package courses

import org.springframework.dao.DataIntegrityViolationException

class CourseEnrollmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Lists all enrollments
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [courseEnrollmentInstanceList: CourseEnrollment.list(params), courseEnrollmentInstanceTotal: CourseEnrollment.count()]
    }

    /**
     * Create form for a new enrollment
     */
    def create() {
        def studentInstance = null

        if (params.student_id) {
            studentInstance = Student.get(params.student_id)
        }

        [courseEnrollmentInstance: new CourseEnrollment(params),
         studentInstance: studentInstance]
    }

    /**
     * Saves the new enrollment (accepts POST)
     */
    def save() {
        params["enrolledAt"] = new Date()
        params["updatedAt"] = new Date()

        if (params.course && params.course.id) {
            params["course"] = Course.get(params.course.id)
        }

        if (params.student_id) {
            params["student"] = Student.get(params.student_id)
        }

        def courseEnrollmentInstance = new CourseEnrollment(params)

        if (!courseEnrollmentInstance.save(flush: true)) {
            render (contentType: "text/json") {
                [result: "failure", message: flash.message]
            }
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), courseEnrollmentInstance.id])

        render (contentType: "text/json") {
            [result: "success", message: flash.message]
        }

    }

    /**
     * Deletes an enrollment (accepts POST)
     */
    def delete() {
        def courseEnrollmentInstance = CourseEnrollment.get(params.id)
        if (!courseEnrollmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), params.id])
            render (contentType: "text/json") {
                [result: "failure", message: flash.message]
            }
            return
        }

        try {
            courseEnrollmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), params.id])
            render (contentType: "text/json") {
                [result: "success", message: flash.message]
            }
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), params.id])
            render (contentType: "text/json") {
                [result: "failure", message: flash.message]
            }
        }
    }
}
