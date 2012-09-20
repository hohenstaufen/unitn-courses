<div class="alert alert-success hide">
<button class="close" data-dismiss="alert">×</button>
<strong><g:message code="student.course.signup" default="Congratulations!"/></strong><g:message code="student.course.signupMessage" default="You have just signed up for this course!"/>
</div>
<table class="table table-striped">
  <thead>
    <tr>
      <g:sortableColumn property="courseName" title="${message(code: 'course.courseName.label', default: 'Course Name')}" />

      <g:sortableColumn property="actualStartDate" title="${message(code: 'course.actualStartDate.label', default: 'Actual Start Date')}" />

      <g:sortableColumn property="credits" title="${message(code: 'course.credits.label', default: 'Credits')}" />

      <g:sortableColumn property="academicYear" title="${message(code: 'course.academicYear.label', default: 'Academic Year')}" />

      <g:sortableColumn property="isByUnitn" title="${message(code: 'course.isByUnitn.label', default: 'Internal')}" />

      <g:if test="${session.isSupervisor || session.isAdmin}">
        <g:sortableColumn property="isPaid" title="${message(code: 'course.isPaid.label', default: 'Is Paid')}" />

        <g:sortableColumn property="areAllMarksDefined" title="${message(code: 'course.areAllMarksDefined.label', default: 'areAllMarksDefined')}" />

        <g:sortableColumn property="mail" title="${message(code: 'course.mail.label', default: 'Mail students')}" />

        <th>
          <a href="#"><g:message code='course.edit.label' default='Edit' /></a>
        </th>

      </g:if>

      <g:if test="${session.isStudent}">
        <th>
        </th>
      </g:if>

    </tr>
  </thead>
  <tbody>
    <g:each in="${courseInstanceList}" status="i" var="courseInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td>
          <g:link action="show" id="${courseInstance.id}">
            ${fieldValue(bean: courseInstance, field: "courseName")}
          </g:link>
        </td>

        <td><g:formatDate format="dd/MM/yyyy" date="${courseInstance.actualStartDate}" /></td>

        <td>${fieldValue(bean: courseInstance, field: "credits")}</td>

        <td><g:formatNumber number="${courseInstance.academicYear}" /></td>

        <td><g:formatBoolean true="✔" false="✗" boolean="${courseInstance.isByUnitn}" /></td>

        <g:if test="${session.isSupervisor || session.isAdmin}">
          <td><g:formatBoolean true="✔" false="✗" boolean="${courseInstance.isPaid}" /></td>

          <td><g:formatBoolean true="✔" false="✗" boolean="${courseInstance.areAllMarksDefined}" /></td>

          <td>
            <g:link action="mail" id="${courseInstance.id}">
              <i class="icon-envelope"></i>
            </g:link>
          </td>

          <td>
            <g:link action="edit" id="${courseInstance.id}">
              <i class="icon-pencil"></i>
            </g:link>
          </td>
        </g:if>

        <td>
          <g:if test="${session.isStudent && !session.user.isEnrolled(courseInstance)}">
            <g:link class="btn btn-success join" action="join" id="${courseInstance.id}">
              <g:message code="course.join.button" default="Join" />
            </g:link>
          </g:if>
        </td>
      </tr>
    </g:each>
  </tbody>
</table>
<div class="pagination">
  <g:paginate total="${courseInstanceTotal}" />
</div>

<script type="text/javascript">
  $(".join").click(function() {
    var url = $(this).attr("href");
    var elem = $(this);
    $.post(url).success(function(data) {
      elem.remove();
      if (data.result == "success") {
    	  $(".alert").fadeIn("slow");
      }
    })
    return false;
  });
</script>
