<g:applyLayout name="base">

  <content tag="container">
    <h1><g:message code="student.menu.studyplan.planned_exams" default ="Planned Exams"/></h1>
    <g:render template="/courseEnrollment/list" />
    <script type="text/javascript">
      menu_active("#menu_planned_exams");
    </script>
  </content>

</g:applyLayout>
