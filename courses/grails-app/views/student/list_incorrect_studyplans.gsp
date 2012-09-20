<g:applyLayout name="base">
  <content tag="container">
    <h1><g:message code="student.courses.incorrect_studyplan" default="Students with incorrect study plan"/></h1>
    <hr/>

    <g:form class="form-horizontal" method="get" action="list_incorrect_studyplans">
      <div class="control-group">
        <b class="control-label">
          <g:message code="student.courses.filter" default="Filter by year:"/>
        </b>
        <div class="control">
          <g:select name="year" from="${years}" />
          <g:submitButton class="btn btn-primary" name="filter"
                          value="${message(code: 'student.courses.filter_button', default: 'Filter')}" />
        </div>
      </div>
    </g:form>
    <hr/>

    <g:render template="list" />

    <script type="text/javascript">
      menu_active("#menu_study_plans");
    </script>
  </content>
</g:applyLayout>
