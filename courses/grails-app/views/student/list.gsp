<g:applyLayout name="base">
  <content tag="container">

    <div class="row-fluid">

      <div class="span4">
        <g:link action='create'>
          <button class="btn btn-success">
            <i class="icon-plus-sign icon-white"></i>
            <g:message code="student.nav.new"/>
          </button>
        </g:link>
      </div>

      <div class="span8">
        <g:form class="form-horizontal" method="get" action="list">
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
      </div>
    </div>

    <hr/>

    <g:render template="list" />

    <script type="text/javascript">
      menu_active("#menu_students");
    </script>
  </content>
</g:applyLayout>
