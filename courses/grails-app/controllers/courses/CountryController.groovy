package courses

import org.springframework.dao.DataIntegrityViolationException

class CountryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Lists all countries
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def countries = Country.notDeleted.list(params)
        [countryInstanceList: countries,
         countryInstanceTotal: Country.notDeleted.count()]
    }

    /**
     * Create form for a new country
     */
    def create() {
        [countryInstance: new Country(params)]
    }

    /**
     * Saves the new country (accepts POST)
     */
    def save() {
        def countryInstance = new Country(params)
        if (!countryInstance.save(flush: true)) {
            render(view: "create", model: [countryInstance: countryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
        redirect(action: "show", id: countryInstance.id)
    }

    /**
     * Shows the country with the given id
     */
    def show() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        [countryInstance: countryInstance]
    }

    /**
     * Edit form for the country with the given id
     */
    def edit() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        [countryInstance: countryInstance]
    }

    /**
     * Update the country with the given id (accepts POST)
     */
    def update() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (countryInstance.version > version) {
                countryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'country.label', default: 'Country')] as Object[],
                          "Another user has updated this Country while you were editing")
                render(view: "edit", model: [countryInstance: countryInstance])
                return
            }
        }

        countryInstance.properties = params

        if (!countryInstance.save(flush: true)) {
            render(view: "edit", model: [countryInstance: countryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
        redirect(action: "show", id: countryInstance.id)
    }

    /**
     * Soft-deletes a country (accepts POST)
     */
    def delete() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        try {
            countryInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
