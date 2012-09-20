package courses

import org.springframework.dao.DataIntegrityViolationException

class StudentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", mail_send: "POST"]

    /**
     * Index: redirects to list
     */
    def index() {
        redirect(action: "home", params: params)
    }

    /**
     * Set variables information to approve students career
     */
    def home() {
        if (session.isStudent) {
            // Awful but the only way to refresh the object
            session.user = Student.get(session.user.id)

            def studentInstance = session.user
            def number_of_courses = CourseEnrollment.findAllByStudent(studentInstance).size()
            def number_of_courses_done = CourseEnrollment.findAllWhere(student: studentInstance, isFinished: true).size()
            def number_of_courses_todo = CourseEnrollment.findAllWhere(student: studentInstance, isFinished: false).size()
            return [
                studentInstance: studentInstance,
                number_of_courses: number_of_courses,
                number_of_courses_done: number_of_courses_done,
                number_of_courses_todo: number_of_courses_todo
            ]
        }
        else {
            redirect(uri: "/")
        }
    }

    /**
     * Lists all students
     */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def students
        def total
        if (params["year"]) {
            students = Student.notDeleted.findAllByCourseYear(params["year"], params)
            total = Student.notDeleted.findAllByCourseYear(params["year"]).size()
        }
        else {
            students = Student.notDeleted.list(params)
            total = Student.notDeleted.count()
        }
        def years = Student.withCriteria {
            projections {
                distinct "courseYear"
            }
        }.sort()

        [studentInstanceList: students,
         studentInstanceTotal: total,
         years: years,
         selectedYear: params["year"]]
    }

    /**
     * Create form for a new student
     */
    def create() {
        def studentInstance = new Student(params)
        [studentInstance: studentInstance]
    }

    /**
     * Saves the new student (accepts POST)
     */
    def save() {
        def studentInstance = new Student(params)

        // TODO check for duplicates!
        def user = studentInstance.firstName + "." + studentInstance.lastName

        def random_gen = { String alphabet, int n ->
            new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }

        def pass = random_gen((('A'..'Z')+('0'..'9')).join(), 9)

        if (!UserRole.findByRole("user")) {
            def userRoleInstance = new UserRole(role: "user")
            userRoleInstance.save(flush: true)
        }

        def userCredentialInstance = new UserCredential(
            user: studentInstance,
            username: user,
            password: pass,
            userRole: UserRole.findByRole("user")
        )

        if (!studentInstance.save(flush: true) || !userCredentialInstance.save(flush: true)) {
            render(view: "create", model: [studentInstance: studentInstance])
            return
        }

        if (studentInstance.email) {
            sendMail {
              to studentInstance.email
              subject "Registered to UniTN PhD School"
              html "<p>Username: <b>" + user + "</b>" + "</p><p>Password: <b>" + pass + "</b></p>"
            }
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])
        redirect(action: "show", id: studentInstance.id)
    }

    /**
     * Shows the student with the given id
     */
    def show() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        [studentInstance: studentInstance,
         studentCredentials: UserCredential.findByUser(studentInstance)]
    }

    /**
     * Edit form for the student with the given id
     */
    def edit() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        [studentInstance: studentInstance,
         studentCredentials: UserCredential.findByUser(studentInstance)]
    }

    /**
     * Update the student with the given id (accepts POST)
     */
    def update() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (studentInstance.version > version) {
                studentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'student.label', default: 'Student')] as Object[],
                          "Another user has updated this Student while you were editing")
                render(view: "edit", model: [studentInstance: studentInstance])
                return
            }
        }

        studentInstance.properties = params

        if (!studentInstance.save(flush: true)) {
            render(view: "edit", model: [studentInstance: studentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])
        redirect(action: "show", id: studentInstance.id)
    }

    /**
     * Soft-deletes a student (accepts POST)
     */
    def delete() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        try {
            studentInstance.deleted = true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    /**
    * Shows student's past exams
    */
    def past_exams() {
        if (session.isStudent) {
            // Awful but the only way to refresh the object
            session.user = Student.get(session.user.id)

            def studentInstance = session.user
            def enrollments = CourseEnrollment.findAllWhere(student: studentInstance, isFinished: true)
            [courseEnrollmentInstanceList: enrollments,
             courseEnrollmentInstanceTotal: enrollments.size(),
             finishedCourses: true]
        }
        else {
            redirect(uri: "/")
        }
    }

    /**
    * Shows student's planned exams
    */
    def planned_exams(){
        if (session.isStudent) {
            // Awful but the only way to refresh the object
            session.user = Student.get(session.user.id)

            def studentInstance = session.user
            def enrollments = CourseEnrollment.findAllWhere(student: studentInstance, isFinished: false)
            [courseEnrollmentInstanceList: enrollments,
             courseEnrollmentInstanceTotal: enrollments.size()]
        }
        else {
            redirect(uri: "/")
        }
    }

    /**
    * Shows studyplan of students
    */
    def study_plan() {
        def studentInstance = null

        if (session.isStudent) {
            // Awful but the only way to refresh the object
            session.user = Student.get(session.user.id)
            studentInstance = session.user
        }
        else if ((session.isSupervisor || session.isAdmin) && params.id) {
            studentInstance = Student.get(params.id)
            //if (studentInstance.currentAdvisor != session.user) {
            //    redirect(uri: "/")
            //}
        }
        else {
            redirect(uri: "/")
        }

        def enrollments = CourseEnrollment.findAllByStudent(studentInstance)
        [studentInstance: studentInstance,
         courseEnrollmentInstanceList: enrollments,
         courseEnrollmentInstanceTotal: enrollments.size()]
    }

    /**
    * Advisor approves studyplans
    */
    def studyplan_approve() {
        def studentInstance = Student.get(params.id)
        if (studentInstance) {
            studentInstance.isPlanApproved = true
            studentInstance.save()
        }
        redirect(uri: "/")
    }

    /**
     * Lists incorrect studyplans
     */
    def list_incorrect_studyplans() {
        // TODO almost duplicate of list(), should be refactored
        if (session.isAdmin) {
            def all_students
            def total
            if (params["year"]) {
                all_students = Student.notDeleted.findAllByCourseYear(params["year"], params)
                total = Student.notDeleted.findAllByCourseYear(params["year"]).size()
            }
            else {
                all_students = Student.notDeleted.list(params)
                total = Student.notDeleted.count()
            }
            def students = []

            for (s in all_students) {
                if (!s.check_studyplan()) {
                    students.add(s)
                }
            }

            def years = Student.withCriteria {
                projections {
                    distinct "courseYear"
                }
            }.sort()

            [studentInstanceList: students,
             studentInstanceTotal: total,
             years: years,
             selectedYear: params["year"]]
        }
        else {
            redirect(uri: "/")
        }
    }

    /**
    * Shows mail form
    */
    def mail() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        [studentInstance: studentInstance]
    }

    /**
    * Sends mail to a student
    */
    def mail_send() {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
            redirect(action: "list")
            return
        }

        if (studentInstance.email) {
            sendMail {
                to studentInstance.email
                subject "Message from UniTN PhD School"
                html params.mail_text
            }
        }

        flash.message = message(code: 'student.mail.sent', default: 'Mail sent')
        redirect(action: "list")
    }
}
