package courses

import org.junit.*
import grails.test.mixin.*
import grails.converters.JSON


@TestFor(CourseEnrollmentController)
@Mock(CourseEnrollment)
class CourseEnrollmentControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["qualification"] = "this is a qualification"
      params["isFinished"] = false
      params["credits"] = 3
      params["enrolledAt"] = new Date(2012, 01, 15)
      params["updatedAt"] = new Date(2012, 03, 14)
      params["course"] = new Course()
      params["student"] = new Student()
    }

    void testIndex() {
        controller.index()
        assert "/courseEnrollment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.courseEnrollmentInstanceList.size() == 0
        assert model.courseEnrollmentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.courseEnrollmentInstance != null
    }

    void testSave() {
        controller.save()

        //assert model.courseEnrollmentInstance != null
        //assert view == '/courseEnrollment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        //assert response.redirectedUrl == '/courseEnrollment/show/1'
        assert controller.flash.message != null
        assert CourseEnrollment.count() == 1
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        def controllerResponse = controller.response.contentAsString
        def jsonResult = JSON.parse(controllerResponse)
        assert "failure" == jsonResult.result

        response.reset()

        populateValidParams(params)
        def courseEnrollment = new CourseEnrollment(params)

        assert courseEnrollment.save() != null
        assert CourseEnrollment.count() == 1

        params.id = courseEnrollment.id

        controller.delete()

        assert CourseEnrollment.count() == 0
        assert CourseEnrollment.get(courseEnrollment.id) == null
        controllerResponse = controller.response.contentAsString
        jsonResult = JSON.parse(controllerResponse)
        assert "success" == jsonResult.result
    }
}
