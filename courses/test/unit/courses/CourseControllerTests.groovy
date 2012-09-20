package courses



import org.junit.*
import grails.test.mixin.*

@TestFor(CourseController)
@Mock(Course)
class CourseControllerTests {

    def populateValidParams(params) {
        assert params != null
        params["notes"] = "This is a note"
        params["actualStartDate"] = new Date(2012, 04, 02)
        params["credits"] = 3
        params["courseName"] = "Test Course"
        params["isPaid"] = false
        params["areAllMarksDefined"] = false
        params["institution"] = "This is an institiution"
        params["isByUnitn"] = true
        params["isInManifesto"] = true
        params["isPaymentCompleted"] = false
        params["place"] = "this is a place"
        params["plannedCoursePeriod"] = "this is a course period"
        params["url"] = "http://course.com"
        params["academicYear"] = 2012
        params["actualCost"] = 1000
        params["professor"] = new Supervisor()
        params["budgetedCost"] = 1000
        params["deleted"] = false
    }

    void testIndex() {
        controller.index()
        assert "/course/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.courseInstanceList.size() == 0
        assert model.courseInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.courseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.courseInstance != null
        assert view == '/course/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/course/show/1'
        assert controller.flash.message != null
        assert Course.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/course/list'


        populateValidParams(params)
        def course = new Course(params)

        assert course.save() != null

        params.id = course.id

        def model = controller.show()

        assert model.courseInstance == course
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/course/list'


        populateValidParams(params)
        def course = new Course(params)

        assert course.save() != null

        params.id = course.id

        def model = controller.edit()

        assert model.courseInstance == course
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/course/list'

        response.reset()


        populateValidParams(params)
        def course = new Course(params)

        assert course.save() != null

        // test invalid parameters in update
        params.id = course.id

        params["academicYear"] = "troll"
        params["actualCost"] = "gigiparigi"
        params["budgetedCost"] = "lololol"

        controller.update()

        assert view == "/course/edit"
        assert model.courseInstance != null

        course.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/course/show/$course.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        course.clearErrors()

        populateValidParams(params)
        params.id = course.id
        params.version = -1
        controller.update()

        assert view == "/course/edit"
        assert model.courseInstance != null
        //assert model.courseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {

        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/course/list'

        response.reset()

        populateValidParams(params)
        def course = new Course(params)

        assert course.save() != null
        assert course.deleted == false
        assert Course.count() == 1

        params.id = course.id

        controller.delete()

        assert Course.count() == 1
        assert Course.get(course.id) == course
        assert Course.get(course.id).deleted == true
        assert response.redirectedUrl == '/course/list'

    }
}
