<g:applyLayout name="base">

  <content tag="container">
    <g:link controller="course" action="assign_marks" id="${courseInstance.id}">
      <button class="btn btn-primary">
        <i class="icon-pencil icon-white"></i>
        <g:message code="professor.show.assign_marks" />
      </button>
    </g:link>
    <g:if test="${courseInstance?.coursesEnrollments}">
      <div id="ViewEnrollments" class="modal hide fade">
        <div class="modal-header">
          <button class="close" data-dismiss="modal">×</button>
          <h3><g:message code="professor.show.view_enrollments" default="View Enrollments"/></h3>
        </div>
        <div class="modal-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <g:sortableColumn property="studentFirstName" title="${message(code: 'student.firstName', default: 'First Name')}" />
                <g:sortableColumn property="studentLastName" title="${message(code: 'student.lastName', default: 'Last Name')}" />
                <g:sortableColumn property="dateEnrollment" title="${message(code: 'courseEnrollment.dateEnrollment', default: 'Date of Enrollment')}" />
              </tr>
            </thead>
            <tbody>
              <g:each in="${courseInstance.coursesEnrollments}" var="c">
                <tr>
                  <td>${c.student.firstName.encodeAsHTML()}</td>
                  <td>${c.student.lastName.encodeAsHTML()}</td>
                  <td>${c.enrolledAt.encodeAsHTML()}</td>
                </tr>
             </g:each>
           </tbody>
         </table>
        </div>
        <div class="modal-footer"><a href="#" class="btn" data-dismiss="modal"><g:message code="professor.window.close_button" default="Close"/></a></div>
      </div>
      <button class="btn btn-info" data-toggle="modal" href="#ViewEnrollments">
        <i class="icon-list icon-white"></i>
        <g:message code="professor.show.view_enrollments" default="View Enrollments"/>
      </button>

    </g:if>
    <hr/>    
    <h2><g:message code="course.edit.title" default="Edit course" /></h2>

    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${courseInstance}">
      <ul class="alert alert-error" role="alert">
        <g:eachError bean="${courseInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
            <g:message error="${error}"/>
          </li>
        </g:eachError>
      </ul>
    </g:hasErrors>


    <g:form method="post" class="form-horizontal">
      <g:hiddenField name="id" value="${courseInstance?.id}" />
      <g:hiddenField name="version" value="${courseInstance?.version}" />
      <fieldset>
        <g:render template="form"/>
        <div class="form-actions">
          <g:actionSubmit class="btn btn-success save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </div>
      </fieldset>
    </g:form>

    <script type="text/javascript">
      menu_active("#menu_courses");
    </script>
  </content>

</g:applyLayout>
