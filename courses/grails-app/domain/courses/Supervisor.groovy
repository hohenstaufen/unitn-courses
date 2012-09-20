package courses

class Supervisor {

    Integer id
    String firstName
    String lastName
    Boolean canBeAdvisor
    Boolean isActive
    Boolean isInternal
    String email
    Boolean deleted = false

    static hasMany = [courses: Course,
                      studentsForCurrentAdvisor: Student,
                      studentsForTutor: Student]

    static mappedBy = [studentsForCurrentAdvisor: "currentAdvisor",
                       studentsForTutor: "tutor"]

    static mapping = {
        table "supervisors"
        id column: "supervisor_ID"
        version false
    }

    static constraints = {
        firstName maxSize: 200, blank: false
        lastName maxSize: 200, blank: false
        email maxSize: 200
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id - $firstName $lastName" }
}
