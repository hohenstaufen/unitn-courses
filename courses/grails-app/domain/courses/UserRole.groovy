package courses

class UserRole {

    Integer id
    String role
    Boolean deleted = false

    static hasMany = [userCredentials: UserCredential]

    static mapping = {
        table "users_roles"
        id column: "user_rol_ID"
        version false
    }

    static constraints = {
        role maxSize: 100
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id - $role" }

}
