<%@ page import="courses.CourseEnrollment" %>
<div class="row-fluid">
  <div class="span12">

  <!--
    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'qualification', 'error')}">
      <label class="control-label" for="qualification"><g:message code="courseEnrollment.qualification.label" default="Qualification" /></label>
      <div class="controls">
        <g:textField name="qualification" maxlength="30" value="${courseEnrollmentInstance?.qualification}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'isFinished', 'error')}">
      <label class="control-label" for="isFinished"><g:message code="courseEnrollment.isFinished.label" default="Is Finished" /></label>
      <div class="controls">
        <g:checkBox name="isFinished" value="${courseEnrollmentInstance?.isFinished}" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'credits', 'error')}">
      <label class="control-label" for="credits"><g:message code="courseEnrollment.credits.label" default="Credits" /></label>
      <div class="controls">
        <g:field type="number" name="credits" value="${fieldValue(bean: courseEnrollmentInstance, field: 'credits')}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'enrolledAt', 'error')}">
      <label class="control-label" for="enrolledAt"><g:message code="courseEnrollment.enrolledAt.label" default="Enrolled At" /></label>
      <div class="controls">
        <g:datePicker name="enrolledAt" precision="day"  value="${courseEnrollmentInstance?.enrolledAt}" default="none" noSelection="['': '']" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'updatedAt', 'error')}">
      <label class="control-label" for="updatedAt"><g:message code="courseEnrollment.updatedAt.label" default="Updated At" /></label>
      <div class="controls">
        <g:datePicker name="updatedAt" precision="day"  value="${courseEnrollmentInstance?.updatedAt}" default="none" noSelection="['': '']" />
      </div>
    </div>

  -->

    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'course', 'error')} required">
      <label class="control-label" for="course"><g:message code="courseEnrollment.course.label" default="Course" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="course" name="course.id" from="${courses.Course.list()}" optionKey="id" required="" value="${courseEnrollmentInstance?.course?.id}"  optionValue="courseName" class="many-to-one"/>
      </div>
    </div>

  <!--
    <div class="control-group ${hasErrors(bean: courseEnrollmentInstance, field: 'student', 'error')} required">
      <label class="control-label" for="student"><g:message code="courseEnrollment.student.label" default="Student" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="student" name="student.id" from="${courses.Student.list()}"
                  optionKey="id" required="" value="${courseEnrollmentInstance?.student?.id}"
                  optionValue="${{it.firstName +' ' + it.lastName}}" class="many-to-one"/>
      </div>
    </div>
  -->

    <g:hiddenField name="student_id" value="${studentInstance?.id}" />

  </div>
</div>
