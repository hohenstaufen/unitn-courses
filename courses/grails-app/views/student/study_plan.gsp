<g:applyLayout name="base">
  <content tag="container">

    <h1><g:message code="student.menu.header.studyplan" default="Study Plan"/></h1>
    <g:render template="/courseEnrollment/list" />

    <g:if test="${session.isSupervisor}">
      <div class="form-actions">
        <g:link action="studyplan_approve" id="${studentInstance.id}">
        <button class="btn btn-success">
          <g:message code="student.study_plan.approve" default="Approve" />
        </button>
      </div>
    </g:link>

    <g:if test="${studentInstance.check_studyplan()}">
      <div>
        <g:message code="student.studyplan.controll" default ="Study Plan is correct!"/>
      </div>
    </g:if>
    <g:else>
      <div>
        <p><g:message code="student.studyplan.advice1" default="Problems!"/></p>
        <p>1 <g:message code="student.studyplan.advice2" default="- try to check 15 credits of first year and the others 9 required"/></p>
        <p>2 <g:message code="student.studyplan.advice3" default="- you must have 'Research Methodologies'"/></p>
      </div>
    </g:else>

    </g:if>

    <script type="text/javascript">
      menu_active("#menu_studyplan");
    </script>

  </content>

</g:applyLayout>
