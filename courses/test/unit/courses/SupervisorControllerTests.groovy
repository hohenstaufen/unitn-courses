package courses



import org.junit.*
import grails.test.mixin.*

@TestFor(SupervisorController)
@Mock(Supervisor)
class SupervisorControllerTests {


    def populateValidParams(params) {
        assert params != null
        params["firstName"] = "Gianni"
        params["lastName"] = "Fox"
        params["canBeAdvisor"] = true
        params["isActive"] = true
        params["isInternal"] = true
        params["email"] = ""
        params["token"] = "7a6bf05689b1a4a2dc830a3e6d0a91266c4100c4"
        params["deleted"] = false
    }

    void testIndex() {
        controller.index()
        assert "/supervisor/home" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.supervisorInstanceList.size() == 0
        assert model.supervisorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.supervisorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.supervisorInstance != null
        assert view == '/supervisor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/supervisor/show/1'
        assert controller.flash.message != null
        assert Supervisor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/supervisor/list'


        populateValidParams(params)
        def supervisor = new Supervisor(params)

        assert supervisor.save() != null

        params.id = supervisor.id

        def model = controller.show()

        assert model.supervisorInstance == supervisor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/supervisor/list'


        populateValidParams(params)
        def supervisor = new Supervisor(params)

        assert supervisor.save() != null

        params.id = supervisor.id

        def model = controller.edit()

        assert model.supervisorInstance == supervisor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/supervisor/list'

        response.reset()


        populateValidParams(params)
        def supervisor = new Supervisor(params)

        assert supervisor.save() != null

        // test invalid parameters in update
        params.id = supervisor.id
        params["firstName"] = null
        params["isInternal"] = "trololol"

        controller.update()

        assert view == "/supervisor/edit"
        assert model.supervisorInstance != null

        supervisor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/supervisor/show/$supervisor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        supervisor.clearErrors()

        populateValidParams(params)
        params.id = supervisor.id
        params.version = -1
        controller.update()

        assert view == "/supervisor/edit"
        assert model.supervisorInstance != null
        //assert model.supervisorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/supervisor/list'

        response.reset()

        populateValidParams(params)
        def supervisor = new Supervisor(params)

        assert supervisor.save() != null
        assert Supervisor.count() == 1

        params.id = supervisor.id

        controller.delete()

        assert Supervisor.count() == 1
        assert Supervisor.get(supervisor.id) == supervisor
        assert supervisor.deleted == true
        assert response.redirectedUrl == '/supervisor/list'
    }

    void testExternalLogin() {
        mockDomain(UserRole)
        mockDomain(UserCredential)

        controller.external_login()
        assert response.redirectedUrl == '/'

        response.reset()

        populateValidParams(params)
        params.isInternal = false
        def supervisor = new Supervisor(params)
        assert supervisor.save() != null
        assert supervisor.count() == 1
        params.id = supervisor.id
        controller.create_external_login()
        controller.external_login()
        assert response.redirectedUrl == '/supervisor/home'
    }

    void testCreateExternalLogin(){
        assert true
    }
}
