<g:applyLayout name="base">

  <content tag="container">
    <h1><g:message code="student.menu.studyplan.past_exams" default="Past Exams"/></h1>
    <g:render template="/courseEnrollment/list" />
    <script type="text/javascript">
      menu_active("#menu_past_exams");
    </script>
  </content>

</g:applyLayout>
