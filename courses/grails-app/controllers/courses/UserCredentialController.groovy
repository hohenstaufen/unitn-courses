package courses


class UserCredentialController {

    static allowedMethods = [update: "POST"]

    /**
     * Edit form for the credentials with the given id
     */
    def edit() {
        def userCredentialInstance = UserCredential.get(params.id)
        if (!userCredentialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCredential.label', default: 'UserCredential'), params.id])
            redirect(action: "list")
            return
        }

        [userCredentialInstance: userCredentialInstance]
    }

    /**
     * Update the credentials with the given id (accepts POST)
     */
    def update() {
        def userCredentialInstance = UserCredential.get(params.id)
        if (!userCredentialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCredential.label', default: 'UserCredential'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userCredentialInstance.version > version) {
                userCredentialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userCredential.label', default: 'UserCredential')] as Object[],
                          "Another user has updated this UserCredential while you were editing")
                render(view: "edit", model: [userCredentialInstance: userCredentialInstance])
                return
            }
        }

        userCredentialInstance.properties = params

        if (!userCredentialInstance.save(flush: true)) {
            render(view: "edit", model: [userCredentialInstance: userCredentialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userCredential.label', default: 'UserCredential'), userCredentialInstance.id])
        render (contentType: "text/json") {
            [result: "success"]
        }
    }

    /**
    *  Provide a session containing a student (the first in the database),
    *  change this with a real login system
    **/
    def login_student() {
        session.user = Student.list([max: 1]).first()
        session.isStudent = true
        redirect(uri: "/")
    }

    /**
    *  Provide a session containing a supervisor (the first in the database),
    *  change this with a real login system
    **/
    def login_supervisor() {
        session.user = Supervisor.list([max: 1]).first()
        session.isSupervisor = true
        redirect(uri: "/")
    }

    /**
    *  Provide a session containing a admin (the first in the database),
    *  change this with a real login system
    **/
    def login_admin() {
        session.user = "admin"
        session.isAdmin = true
        redirect(uri: "/")
    }

    /**
    *  Clean the session
    **/
    def logout() {
        session.user = null
        session.isStudent = null
        session.isSupervisor = null
        session.isAdmin = null
        redirect(uri: "/")
    }
}
