package courses

class UserCredential {

    Integer id
    String username
    String password
    UserRole userRole
    Student user = null
    Supervisor userSupervisor = null

    static belongsTo = [Student, UserRole]

    static mapping = {
        table "users_credentials"
        id column: "user_credential_ID"
        userRole column: "user_rol"
        user column: "user"
        username column: "user_name"
        userSupervisor column: "user_supervisor"
        version false
    }

    static constraints = {
        username maxSize: 200
        password maxSize: 500

        password(blank:false, password:true)

        user nullable: true
        userSupervisor nullable: true
    }

    String toString() { "${this.class.name} : $id - $username" }
}
