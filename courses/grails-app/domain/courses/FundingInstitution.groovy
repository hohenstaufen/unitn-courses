package courses

class FundingInstitution {

    Integer id
    String name
    Boolean deleted = false
    String type

    static mapping = {
        table "funding_institutions"
        id column: "funding_institution_ID", generator: "native"
        version false
    }

    static constraints = {
        name unique: true, maxSize: 200
        type maxSize: 20
    }

    String toString() { "${this.class.name} : $id - $name" }
}
