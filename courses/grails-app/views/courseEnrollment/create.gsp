<div class="alert alert-danger hide">
<button class="close" data-dismiss="alert">×</button>
<strong><g:message code="student.course.error" default="Error!"/></strong> <g:message code="cc" default="You are already enrolled at this Course"/>
</div>
<g:form action="save" name="CourseEnrollment_Form" url="[action:'save',controller:'courseEnrollment']" class="form-horizontal">
  <fieldset class="form">
    <g:render template="form"/>
      <button type="submit" id="CourseEnrollmentButton" class="btn btn-success modal-button"><i class="icon-plus icon-white"></i> <g:message code="default.button.create.label" default="Create"/></button>
  </fieldset>
</g:form>
