package courses

class Course {

    Integer id
    String notes
    Date actualStartDate
    String institution
    String place
    Integer credits
    String courseName
    Integer academicYear = 2012
    Boolean isInManifesto = false
    Boolean isByUnitn = false
    Boolean isPaid = false
    Integer budgetedCost = 0
    Integer actualCost = 0
    String plannedCoursePeriod
    Boolean areAllMarksDefined = false
    String url
    Boolean isPaymentCompleted = false
    Boolean deleted = false
    Supervisor professor

    static hasMany = [coursesEnrollments: CourseEnrollment]
    static belongsTo = [Supervisor]

    static mapping = {
        table "courses"
        id column: "course_ID"
        notes type: 'text'
        professor column: "professor"
        version false

    }

    static constraints = {
        courseName blank: false

        notes nullable: true, maxSize: 65535
        actualStartDate nullable: true, maxSize: 10
        professor nullable: true
        credits nullable: true
        courseName maxSize: 200
        isPaid nullable: true
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id" }
}
