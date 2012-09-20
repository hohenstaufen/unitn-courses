package courses

class IndexController {

    /**
     * Index: Site homepage
     */
    def index() {
        if (session.user) {
            if (session.user.getClass() == Student){
                redirect(controller: "student", action: "home")
            }
            else if (session.user.getClass() == Supervisor){
                redirect(controller: "supervisor", action: "home")
            }
            else if (session.user.getClass() == String){
                redirect(controller: "admin", action: "home")
            }
        }
    }
}
