package courses

import org.springframework.dao.DataIntegrityViolationException

class UserRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Lists all roles
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def userRoles = UserRole.notDeleted.list(params)
        [userRoleInstanceList: userRoles,
         userRoleInstanceTotal: UserRole.notDeleted.count()]
    }

    /**
     * Create form for a new role
     */
    def create() {
        [userRoleInstance: new UserRole(params)]
    }

    /**
     * Saves the new role (accepts POST)
     */
    def save() {
        def userRoleInstance = new UserRole(params)
        if (!userRoleInstance.save(flush: true)) {
            render(view: "create", model: [userRoleInstance: userRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])
        redirect(action: "show", id: userRoleInstance.id)
    }

    /**
     * Shows the role with the given id
     */
    def show() {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "list")
            return
        }

        [userRoleInstance: userRoleInstance]
    }

    /**
     * Edit form for the role with the given id
     */
    def edit() {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "list")
            return
        }

        [userRoleInstance: userRoleInstance]
    }

    /**
     * Update the role with the given id (accepts POST)
     */
    def update() {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userRoleInstance.version > version) {
                userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userRole.label', default: 'UserRole')] as Object[],
                          "Another user has updated this UserRole while you were editing")
                render(view: "edit", model: [userRoleInstance: userRoleInstance])
                return
            }
        }

        userRoleInstance.properties = params

        if (!userRoleInstance.save(flush: true)) {
            render(view: "edit", model: [userRoleInstance: userRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])
        redirect(action: "show", id: userRoleInstance.id)
    }

    /**
     * Soft-deletes a country (accepts POST)
     */
    def delete() {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userRoleInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
