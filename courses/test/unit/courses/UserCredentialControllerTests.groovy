package courses



import org.junit.*
import grails.test.mixin.*

@TestFor(UserCredentialController)
@Mock(UserCredential)
class UserCredentialControllerTests {


    def populateValidParams(params) {
        assert params != null
        params["username"] = "username"
        params["password"] = "password"
        params["userRole"] = new UserRole()
        params["user"] = new Student()
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userCredential/list'


        populateValidParams(params)
        def userCredential = new UserCredential(params)

        assert userCredential.save() != null

        params.id = userCredential.id

        def model = controller.edit()

        assert model.userCredentialInstance == userCredential
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userCredential/list'

        response.reset()


        populateValidParams(params)
        def userCredential = new UserCredential(params)

        assert userCredential.save() != null

        // test invalid parameters in update
        params.id = userCredential.id
        params["userRole"] = "Trololol"
        params["user"] = new Date()

        controller.update()

        assert view == "/userCredential/edit"
        assert model.userCredentialInstance != null

        userCredential.clearErrors()

        populateValidParams(params)
        controller.update()

        //assert response.redirectedUrl == "/userCredential/show/$userCredential.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userCredential.clearErrors()

        populateValidParams(params)
        params.id = userCredential.id
        params.version = -1
        controller.update()

        assert view == "/userCredential/edit"
        assert model.userCredentialInstance != null
        //assert model.userCredentialInstance.errors.getFieldError('version')
        assert flash.message != null
    }
}
