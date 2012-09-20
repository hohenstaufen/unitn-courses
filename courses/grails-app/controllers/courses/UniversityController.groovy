package courses

import org.springframework.dao.DataIntegrityViolationException

class UniversityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Lists all universities
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def universities = University.notDeleted.list(params)
        [universityInstanceList: universities,
         universityInstanceTotal: University.notDeleted.count()]
    }

    /**
     * Create form for a new university
     */
    def create() {
        [universityInstance: new University(params)]
    }

    /**
     * Saves the new university (accepts POST)
     */
    def save() {
        def universityInstance = new University(params)
        if (!universityInstance.save(flush: true)) {
            render(view: "create", model: [universityInstance: universityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'university.label', default: 'University'), universityInstance.id])
        redirect(action: "show", id: universityInstance.id)
    }

    /**
     * Shows the university with the given id
     */
    def show() {
        def universityInstance = University.get(params.id)
        if (!universityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "list")
            return
        }

        [universityInstance: universityInstance]
    }

    /**
     * Edit form for the university with the given id
     */
    def edit() {
        def universityInstance = University.get(params.id)
        if (!universityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "list")
            return
        }

        [universityInstance: universityInstance]
    }

    /**
     * Update the supervisor with the given id (accepts POST)
     */
    def update() {
        def universityInstance = University.get(params.id)
        if (!universityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (universityInstance.version > version) {
                universityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'university.label', default: 'University')] as Object[],
                          "Another user has updated this University while you were editing")
                render(view: "edit", model: [universityInstance: universityInstance])
                return
            }
        }

        universityInstance.properties = params

        if (!universityInstance.save(flush: true)) {
            render(view: "edit", model: [universityInstance: universityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'university.label', default: 'University'), universityInstance.id])
        redirect(action: "show", id: universityInstance.id)
    }

    /**
     * Soft-deletes a university (accepts POST)
     */
    def delete() {
        def universityInstance = University.get(params.id)
        if (!universityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "list")
            return
        }

        try {
            universityInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'university.label', default: 'University'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
