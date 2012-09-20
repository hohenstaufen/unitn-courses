<div class="alert alert-error hide">
<button class="close" data-dismiss="alert">×</button>
<strong><g:message code="student.course_enrollement.message" default="You have just deleted your enrollment!"/>
</div>
<table class="table table-striped">
  <thead>
    <tr>
      <g:sortableColumn property="course" title="${message(code: 'courseEnrollment.course.label', default: 'Course')}" />

      <g:if test="${finishedCourses}">

        <g:sortableColumn property="qualification" title="${message(code: 'courseEnrollment.qualification.label', default: 'Qualification')}" />
        <g:sortableColumn property="credits" title="${message(code: 'courseEnrollment.credits.label', default: 'Credits')}" />

      </g:if>
      <g:else>

        <g:sortableColumn property="enrolledAt" title="${message(code: 'courseEnrollment.enrolledAt.label', default: 'Enrolled At')}" />
        <th>
        </th>

      </g:else>
  </tr>
  </thead>
  <tbody>
    <g:each in="${courseEnrollmentInstanceList}" status="i" var="courseEnrollmentInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <td>
          <g:link controller="course" action="show" id="${courseEnrollmentInstance.course.id}">
            <g:if test="${courseEnrollmentInstance.course.courseName}">
              ${fieldValue(bean: courseEnrollmentInstance.course, field: "courseName")}
            </g:if>
            <g:else>
              <g:message code="default.noname.label" default="No name" />
            </g:else>
          </g:link>
        </td>

        <g:if test="${finishedCourses}">
          <td>${fieldValue(bean: courseEnrollmentInstance, field: "qualification")}</td>
          <td>${fieldValue(bean: courseEnrollmentInstance, field: "credits")}</td>
        </g:if>

        <g:else>
          <td>
            <g:formatDate format="dd/MM/yyyy" date="${courseEnrollmentInstance.enrolledAt}" />
          </td>
          <td>
            <g:if test="${(session.isStudent || session.isAdmin) && !courseEnrollmentInstance.isFinished}">
              <g:link class="btn btn-danger unjoin" controller="courseEnrollment"
                      action="delete" id="${courseEnrollmentInstance.id}">
                <g:message code="course.unjoin.button" default="Unsubscribe" />
              </g:link>
            </g:if>
          </td>
        </g:else>
      </tr>
    </g:each>
  </tbody>
</table>
<div class="pagination">
   <g:paginate total="${courseEnrollmentInstanceTotal}" />
</div>

<script type="text/javascript">
  $(".unjoin").click(function() {
    var url = $(this).attr("href");
    var elem = $(this);
    $.post(url).success(function(data) {
      elem.closest("tr").remove();
      if (data.result == "success") {
    	  $(".alert").fadeIn("slow");
      }
    })
    return false;
  });
</script>
