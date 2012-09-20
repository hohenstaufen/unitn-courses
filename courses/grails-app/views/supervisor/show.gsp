<g:applyLayout name="base">

  <content tag="container">

    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">
        ${flash.message}
      </div>
    </g:if>

    <div class="row-fluid">
        <div class="span4">
            <img src="http://placekitten.com/260/260" alt="profile_photo" />
        </div>
        <div class="span8">
            <div class="well">

              <table class="table">

                <g:if test="${supervisorInstance?.firstName}">
                  <tr>
                    <td>
                      <g:message code="supervisor.firstName.label" default="First Name" />
                    </td>
                    <td>
                      <g:fieldValue bean="${supervisorInstance}" field="firstName"/>
                    </td>
                  </tr>
                </g:if>

                <g:if test="${supervisorInstance?.lastName}">
                  <tr>
                    <td>
                      <g:message code="supervisor.lastName.label" default="Last Name" />
                    </td>
                    <td>
                      <g:fieldValue bean="${supervisorInstance}" field="lastName"/>
                    </td>
                  </tr>
                </g:if>

                <g:if test="${supervisorInstance?.email}">
                  <tr>
                    <td>
                      <g:message code="supervisor.email.label" default="Email" />
                    </td>
                    <td>
                      <g:fieldValue bean="${supervisorInstance}" field="email"/>
                    </td>
                  </tr>
                </g:if>

                <g:if test="${supervisorInstance?.studentsForCurrentAdvisor}">
                  <tr>
                    <td>
                      <g:message
                      code="supervisor.studentsForCurrentAdvisor.label" default="Advisor of" />
                    </td>
                    <td>
                      <ul>
                        <g:each in="${supervisorInstance.studentsForCurrentAdvisor}" var="s">
                          <li>
                            <g:link controller="student" action="show" id="${s.id}">
                              ${s.firstName?.encodeAsHTML()}
                              ${s.lastName?.encodeAsHTML()}
                            </g:link>
                          </li>
                        </g:each>
                      </ul>
                    </td>
                  </tr>
                </g:if>

                <g:if test="${supervisorInstance?.studentsForTutor}">
                  <tr>
                    <td>
                      <g:message code="supervisor.studentsForTutor.label" default="Tutor of" />
                    </td>
                    <td>
                      <ul>
                        <g:each in="${supervisorInstance.studentsForTutor}" var="s">
                          <li>
                            <g:link controller="student" action="show" id="${s.id}">
                              ${s.firstName?.encodeAsHTML()}
                              ${s.lastName?.encodeAsHTML()}
                            </g:link>
                          </li>
                        </g:each>
                      </ul>
                    </td>
                  </tr>
                </g:if>
              </table>
            </div>
        </div>
    </div>

    <g:if test="${session.isSupervisor}">
      <script type="text/javascript">
        menu_active("#menu_profile");
      </script>
    </g:if>
    <g:elseif test="${session.isAdmin}">
      <script type="text/javascript">
        menu_active("#menu_professors");
      </script>
    </g:elseif>

  </content>

</g:applyLayout>
