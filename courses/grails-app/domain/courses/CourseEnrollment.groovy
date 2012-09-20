package courses

class CourseEnrollment {

    Integer id
    String qualification = ""
    Boolean isFinished = false
    Integer credits = 0
    Date enrolledAt
    Date updatedAt
    Course course
    Student student

    static belongsTo = [Course, Student]

    static mapping = {
        table "courses_enrollments"
        id column: "enrollment_ID", ignoreNotFound: true
        course column: "course"
        student column: "student"
        version false
    }

    static constraints = {
        qualification maxSize: 30
        isFinished nullable: true
        credits nullable: true
        enrolledAt nullable: true, maxSize: 19
        updatedAt nullable: true, maxSize: 19

        student unique: 'course'
    }

    String toString() { "${this.class.name} : $id - $student - $course" }
}
