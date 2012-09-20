package courses

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

class SupervisorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def grailsUrlMappingsHolder

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "home", params: params)
    }

    /**
     * Set supervisor's home page variables, to make him able to get notification about marks, courses, etc
     */
    def home() {
        if (session.isSupervisor) {
            session.user = Supervisor.get(session.user.id)
            [
                studyplanNotifications: Student.findAllWhere(
                    currentAdvisor: session.user,
                    isPlanApproved: false
                ),
                marksNotifications: Course.findAllWhere(
                    professor: session.user,
                    areAllMarksDefined: false
                )
            ]
        }
        else {
            redirect(uri: "/")
        }
    }

  /**
   * Redirect to profile.html.gsp in views
   */
    def profile() {

    }

    /**
     * Lists all supervisors
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def supervisors = Supervisor.notDeleted.list(params)
        [supervisorInstanceList: supervisors,
         supervisorInstanceTotal: Supervisor.notDeleted.count()]
    }

    /**
     * Create form for a new supervisor
     */
    def create() {
        [supervisorInstance: new Supervisor(params)]
    }

    /**
     * Saves the new supervisor (accepts POST)
     */
    def save() {
        def supervisorInstance = new Supervisor(params)
        if (!supervisorInstance.save(flush: true)) {
            render(view: "create", model: [supervisorInstance: supervisorInstance])
            return
        }
        if(!params.isInternal){
            params.id = supervisorInstance.id
            create_external_login()
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), supervisorInstance.id])
        redirect(action: "show", id: supervisorInstance.id)
    }

    /**
     * Shows the supervisor with the given id
     */
    def show() {
        def supervisorInstance = Supervisor.get(params.id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "list")
            return
        }

        [supervisorInstance: supervisorInstance]
    }

    /**
     * Edit form for the supervisor with the given id
     */
    def edit() {
        def supervisorInstance = Supervisor.get(params.id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "list")
            return
        }

        [supervisorInstance: supervisorInstance]
    }

    /**
     * Update the supervisor with the given id (accepts POST)
     */
    def update() {
        def supervisorInstance = Supervisor.get(params.id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (supervisorInstance.version > version) {
                supervisorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'supervisor.label', default: 'Supervisor')] as Object[],
                          "Another user has updated this Supervisor while you were editing")
                render(view: "edit", model: [supervisorInstance: supervisorInstance])
                return
            }
        }

        supervisorInstance.properties = params

        if (!supervisorInstance.save(flush: true)) {
            render(view: "edit", model: [supervisorInstance: supervisorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), supervisorInstance.id])
        redirect(action: "show", id: supervisorInstance.id)
    }

    /**
     * Soft-deletes a supervisor (accepts POST)
     */
    def delete() {
        def supervisorInstance = Supervisor.get(params.id)
        if (!supervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            supervisorInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    /**
    * Creates external login token and sends the login url to the supervisor
    */
    def create_external_login(){
        // creating random token
        def now = Calendar.instance
        def date = now.time
        def millisec = date.time
        def random = new Random(millisec)
        def token = random.nextInt().encodeAsSHA1()
        if (params.id){
            def supervisorInstance = Supervisor.get(params.id)
            def userCredential = new UserCredential()
            userCredential.username = token
            userCredential.password = token
            params.token = token
            userCredential.userSupervisor = supervisorInstance
            def userRole = UserRole.find{role == "supervisor"}
            if (!userRole){
                userRole = new UserRole()
                userRole.role = "supervisor"
                userRole.save(flush: true)
            }
            userCredential.userRole = userRole
            userCredential.save(flush: true)

            def tagLib = new ApplicationTagLib()
            tagLib.grailsUrlMappingsHolder = grailsUrlMappingsHolder
            def link = tagLib.createLink(action:'external_login', absolute: true)
            link += '/' + token
            if (params.email){
                sendMail {
                  to params.email
                  subject "UNITN Courses Management Credentials"
                  html link
                }
            }
        }
    }

    /**
    * Allows the external supervisor (professor) login
    */
    def external_login() {
        if(params.token){
            def userCredentialInstance = UserCredential.find{username == params.token}
            if(userCredentialInstance && userCredentialInstance.userSupervisor != null){
                def supervisorInstance = userCredentialInstance.userSupervisor
                if(supervisorInstance && !supervisorInstance.isInternal){
                    session.isSupervisor = true
                    session.user = supervisorInstance
                    redirect(action: "home")
                    return
                }
            }
        }
        session.invalidate()
        redirect(uri: "/")
    }
}
