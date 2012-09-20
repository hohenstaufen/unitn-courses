package courses



import org.junit.*
import grails.test.mixin.*
import org.grails.mail.*


@TestFor(StudentController)
@Mock(Student)
class StudentControllerTests {


    def populateValidParams(params) {
        assert params != null
        params["firstName"] = "Gigi"
        params["lastName"] = "Parigi"
        params["fullName"] = "Gigi Parigi"
        params["phdCycle"] = "cycle"
        params["isSuspended"] = false
        params["courseYear"] = 3
        params["admittedConditionally"] = false
        params["legalResidence"] = "This is my address"
        params["isSuspended"] = false
        params["currentDomicile"] = "this is my domicile"
        params["dateOfBirth"] = new Date(1991, 03, 14)
        params["placeOfBirth"] = "Trento"
        params["officePhone"] = "1234"
        params["mobilePhone"] = "1234"
        params["officeWorkingPlace"] = "Lab 1"
        params["lockerNumber"] = "A001"
        params["phdScholarship"] = true
        params["scholarshipType"] = "this is a type"
        params["yearlyFeeToCenter"] = 1000
        params["yearlyFeeToSchool"] = 1000
        params["hasPcRights"] = true
        params["preDoctoralScholarship"] = ""
        params["monthsPredocScholarship"] = 4
        params["yearExtensionScholarship"] = ""
        params["months"] = 1
        params["personalFundsAvailable"] = 1000
        params["isGraduated"] = false
        params["graduationDate"] = null
        params["commiteeMembers"] = "prof1, prof2"
        params["email"] = ""
        params["deleted"] = false
        params["italianTaxpayerCode"] = 1234
        params["tutor"] = new Supervisor()
        params["currentAdvisor"] = new Supervisor()
        params["universityOfProvenance"] = new University()
        params["citizenship"] = new Country()
        params["university"] = new University()
        params["countryOfProvenance"] = new Country()
    }

    void testIndex() {
        controller.index()
        assert "/student/home" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studentInstanceList.size() == 0
        assert model.studentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.studentInstance != null
    }

    void testSave() {
        mockDomain(UserRole)
        mockDomain(UserCredential)

        controller.save()

        assert model.studentInstance != null
        assert view == '/student/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/student/show/1'
        assert controller.flash.message != null
        assert Student.count() == 1
    }

    void testShow() {
        mockDomain(UserCredential)

        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/student/list'


        populateValidParams(params)
        def student = new Student(params)

        assert student.save() != null

        params.id = student.id

        def model = controller.show()

        assert model.studentInstance == student
    }

    void testEdit() {
        mockDomain(UserCredential)

        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/student/list'


        populateValidParams(params)
        def student = new Student(params)

        assert student.save() != null

        params.id = student.id

        def model = controller.edit()

        assert model.studentInstance == student
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/student/list'

        response.reset()


        populateValidParams(params)
        def student = new Student(params)

        assert student.save() != null

        // test invalid parameters in update
        params.id = student.id
        params["phdCycle"] = "This is a cycle"
        params["dateOfBirth"] = null

        controller.update()

        assert view == "/student/edit"
        assert model.studentInstance != null

        student.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/student/show/$student.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        student.clearErrors()

        populateValidParams(params)
        params.id = student.id
        params.version = -1
        controller.update()

        assert view == "/student/edit"
        assert model.studentInstance != null
        //assert model.studentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/student/list'

        response.reset()

        populateValidParams(params)
        def student = new Student(params)

        assert student.save() != null
        assert Student.count() == 1

        params.id = student.id

        controller.delete()

        assert Student.count() == 1
        assert Student.get(student.id) == student
        assert student.deleted == true
        assert response.redirectedUrl == '/student/list'
    }
}
