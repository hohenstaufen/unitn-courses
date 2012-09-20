package courses

class University {

    Integer id
    String nameUniversity
    String location
    Boolean deleted = false
    Country country

    static hasMany = [studentsForUniversity: Student,
                      studentsForUniversityOfProvenance: Student]
    static belongsTo = [Country]

    static mappedBy = [studentsForUniversity: "university",
                       studentsForUniversityOfProvenance: "universityOfProvenance"]

    static mapping = {
        table "universities"
        id column: "university_ID"
        country column: "country"
        version false
    }

    static constraints = {
        nameUniversity unique: true, blank: false
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id - $nameUniversity" }
}
