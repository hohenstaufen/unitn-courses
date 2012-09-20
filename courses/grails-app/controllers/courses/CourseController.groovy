package courses

import org.springframework.dao.DataIntegrityViolationException


class CourseController {

    static allowedMethods = [
        save: "POST", update: "POST", delete: "POST", join: "POST",
        mail_send: "POST", assign_marks_update: "POST",
        assign_maks_save: "POST"
    ]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Lists all courses for admin
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def courses = Course.notDeleted.list(params)
        [courseInstanceList: courses,
         courseInstanceTotal: Course.notDeleted.count()]
    }

     /**
     * Lists all courses for supervisor
     */
    def list_supervisor() {
        def supervisorInstance;

        if (session.isSupervisor) {
            supervisorInstance = session.user
        }
        if (session.isAdmin) {
            supervisorInstance = Supervisor.get(params.id)
        }

        if (!supervisorInstance) {
            flash.message = message(
                code: 'default.not.found.message',
                args: [message(code: 'supervisor.label', default: 'Supervisor'), params.id]
            )
            redirect(uri: "/")
            return
        }

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def courses = Course.notDeleted.findAllByProfessor(supervisorInstance, params)
        [courseInstanceList: courses, courseInstanceTotal: courses.size()]
    }

      /**
     * Lists all courses for student
     */
    def list_student() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def courses = Course.notDeleted.list(params)
        [courseInstanceList: courses, courseInstanceTotal: courses.size()]
    }

    /**
     * Create form for a new course
     */
    def create() {
        [courseInstance: new Course(params)]
    }

    /**
     * Saves the new course (accepts POST)
     */
    def save() {
        if (session.isStudent) {
            params["isByUnitn"] = false
        }

        def courseInstance = new Course(params)
        if (!courseInstance.save(flush: true)) {
            render(view: "create", model: [courseInstance: courseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)
    }

    /**
     * Shows the course with the given id
     */
    def show() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }

    /**
     * Edit form for the course with the given id
     */
    def edit() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }

    /**
     * Update the course with the given id (accepts POST)
     */
    def update() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (courseInstance.version > version) {
                courseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'course.label', default: 'Course')] as Object[],
                          "Another user has updated this Course while you were editing")
                render(view: "edit", model: [courseInstance: courseInstance])
                return
            }
        }

        courseInstance.properties = params

        if (!courseInstance.save(flush: true)) {
            render(view: "edit", model: [courseInstance: courseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)
    }

    /**
     * Soft-deletes a course (accepts POST)
     */
    def delete() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        try {
            courseInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

   /**
     * Shows the form to send mail
     */
    def mail() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }


   /**
     * Send mail to each student in a given course
     */
    def mail_send() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
            redirect(action: "list")
            return
        }

        for (enrollment in courseInstance.coursesEnrollments) {
            def studentInstance = enrollment.student
            if (studentInstance.email) {
                sendMail {
                  to studentInstance.email
                  subject "Message for course " + courseInstance.courseName
                  html params.mail_text
                }
            }
        }

        flash.message = message(code: 'course.mail.sent', default: 'Mail sent')
        redirect(action: "list")
    }

   /**
     * A student join a given course
     */
    def join() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance || !session.isStudent || !session.user) {
            render (contentType: "text/json") {
                [result: "success"]
            }
            return
        }

        def studentInstance = session.user

        if (studentInstance.isEnrolled(courseInstance)) {
            render (contentType: "text/json") {
                [result: "failure"]
            }
            return
        }

        def courseEnrollmentInstance = new CourseEnrollment(
            qualification: "",
            isFinished: false,
            credits: 0,
            enrolledAt: new Date(),
            updatedAt: new Date(),
            student: studentInstance,
            course: courseInstance
        )

        courseEnrollmentInstance.save()

        if (courseEnrollmentInstance != null) {
            render (contentType: "text/json") {
                [result: "success"]
            }
        }

        else {
            render (contentType: "text/json") {
                [result: "failure"]
            }
        }
    }

   /**
     * A professor assign marks to students of a given course 
     */
    //warnign need check about ROLE!
    def assign_marks() {
        def courseInstance = Course.get(params.id)
        [courseInstance: courseInstance]
    }

   /**
     * A professor assign marks to students of a given course saving
     */
    def assign_marks_save() {
        // TODO: remove duplicated code (similar to assign_marks_update)
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), params.id])
            redirect(action: "list")
            return
        }

        for (courseEnrollmentInstance in courseInstance.coursesEnrollments) {
            def mark = params["qualification_" + courseEnrollmentInstance.student.id]
            courseEnrollmentInstance.qualification = mark
            courseEnrollmentInstance.isFinished = true
            courseEnrollmentInstance.credits = courseInstance.credits
            courseEnrollmentInstance.updatedAt = new Date()

            if (!courseEnrollmentInstance.save(flush: true)) {
                render(view: "assign_marks", model: [courseInstance: courseInstance])
                return
            }
        }

        courseInstance.areAllMarksDefined = true
        courseInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)
    }


   /**
     * A professor update marks to students of a given course
     */
    def assign_marks_update() {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment'), params.id])
            redirect(action: "list")
            return
        }

        for (courseEnrollmentInstance in courseInstance.coursesEnrollments) {
            def mark = params["qualification_" + courseEnrollmentInstance.student.id]
            courseEnrollmentInstance.qualification = mark

            if (!courseEnrollmentInstance.save(flush: true)) {
                render(view: "assign_marks", model: [courseInstance: courseInstance])
                return
            }
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)
    }
}
