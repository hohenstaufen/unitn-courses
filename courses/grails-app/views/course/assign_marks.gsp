<g:applyLayout name="base">

  <content tag="container">
    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>

    <g:form method="post" class="form-horizontal">
      <g:hiddenField name="id" value="${courseInstance?.id}" />
      <table class="table table-striped">
        <thead>
          <tr>
            <g:sortableColumn property="studentFirstName" title="${message(code: 'student.firstName', default: 'First Name')}" />
            <g:sortableColumn property="studentLastName" title="${message(code: 'student.lastName', default: 'Last Name')}" />
            <g:sortableColumn property="dateEnrollment" title="${message(code: 'courseEnrollment.mark', default: 'Mark')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${courseInstance?.coursesEnrollments}" var="c">
            <tr>
              <td>${c.student?.firstName?.encodeAsHTML()}</td>
              <td>${c.student?.lastName?.encodeAsHTML()}</td>
              <td>
                <g:textField name="qualification_${c.student?.id}" value="${c.qualification?.encodeAsHTML()}" class="span1"/>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="form-actions">
        <g:actionSubmit class="btn" action="assign_marks_update" value="${message(code: 'courseEnrollment.save_marks', default: 'Save Marks')}" />
        <g:actionSubmit class="btn btn-success" action="assign_marks_save" value="${message(code: 'courseEnrollment.assign_marks', default: 'Submit Marks')}" />
      </div>
    </g:form>

    <script type="text/javascript">
      menu_active("#menu_courses");
    </script>

  </content>

</g:applyLayout>
