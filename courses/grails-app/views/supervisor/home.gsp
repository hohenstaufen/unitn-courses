<g:applyLayout name="base">

  <content tag="container">

    <div class="row-fluid">
      <div class="span8">
        <h2>
          <g:message code="supervisor.home.welcome" default="Welcome!" />
        </h2>

        <div class="alert alert-info">

          <h3>
            <g:message code="supervisor.home.studyplan_notifications"
                       default="Study plans to approve" />
          </h3>

          <ul>
            <g:each in="${studyplanNotifications}" status="i" var="studentInstance">
              <li>
                <g:link controller="student" action="study_plan" id="${studentInstance.id}">
                  ${studentInstance.firstName} ${studentInstance.lastName}
                </g:link>
              </li>
            </g:each>
          </ul>

          <hr/>

          <h3>
            <g:message code="supervisor.home.marks_notifications" />
          </h3>

          <ul>
            <g:each in="${marksNotifications}" status="i" var="courseInstance">
              <li>
                <g:link controller="course" action="show" id="${courseInstance.id}">
                  ${courseInstance.courseName}
                </g:link>
              </li>
            </g:each>
          </ul>

          <hr/>

          <h3>
            <g:message code="supervisor.home.payments_notifications"
                       default="Payments notifications" />
          </h3>

          <ul>
          </ul>

        </div>
      </div>
    </div>

    <script type="text/javascript">
      menu_active("#menu_home");
    </script>

  </content>

</g:applyLayout>
