package courses

class AdminController {

    /**
     * Index page: redirects to home
     */
    def index() {
        redirect(action: "home", params: params)
    }

    /**
     * Admin home page: displays some stats and other general info
     */
    def home() {
        def num_courses = Course.notDeleted.count()
        def num_courses_paid = Course.notDeleted.findAllByIsPaid(true).size()
        def num_courses_byUnitn = Course.notDeleted.findAllByIsByUnitn(true).size()
        def courses_more_costs = Course.notDeleted.list(max: 3, sort: "actualCost", order: "desc")


        def num_students = Student.notDeleted.count()
        def num_students_admittedConditionally = Student.notDeleted.findAlladmittedConditionally(true).size()
        def num_students_graduated = Student.notDeleted.findAllIsGraduated(true).size()

        def num_supervisors = Supervisor.notDeleted.count()
        def num_supervisors_internal = Supervisor.notDeleted.findAllIsInternal(true).size()
        def num_supervisors_external = Supervisor.notDeleted.findAllIsInternal(false).size()
        def num_supervisors_active = Supervisor.notDeleted.findAllIsActive(true).size()

        [
            num_courses: num_courses,
            num_courses_paid: num_courses_paid,
            num_courses_byUnitn:num_courses_byUnitn,
            courses_more_costs : courses_more_costs,
            //courses_more_enrollments : courses_more_enrollments,

            num_students: num_students,
            num_students_admittedConditionally : num_students_admittedConditionally,
            num_students_graduated : num_students_graduated,

            num_supervisors : num_supervisors,
            num_supervisors_internal : num_supervisors_internal,
            num_supervisors_external : num_supervisors_external,
            num_supervisors_active : num_supervisors_active
        ]
    }
}
