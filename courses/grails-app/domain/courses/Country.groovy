package courses

class Country {

    Integer id
    String name
    String region
    String citizenship
    Boolean deleted = false

    static hasMany = [studentsForCitizenship: Student,
                      studentsForCountryOfProvenance: Student,
                      universities: University]

    static mappedBy = [studentsForCitizenship: "citizenship",
                       studentsForCountryOfProvenance: "countryOfProvenance"]

    static mapping = {
        table "countries"
        id column: "country_ID", generator: "native"
        version false
    }

    static constraints = {
        name unique: true, blank: false
        region maxSize: 200
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id - $name" }
}
