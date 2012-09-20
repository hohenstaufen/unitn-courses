<g:applyLayout name="base">

  <content tag="container">

    <g:link action='create'>
      <button class="btn btn-success">
        <i class="icon-plus-sign icon-white"></i>
        <g:message code="supervisor.list.new" default="New Supervisor" />
      </button>
    </g:link>
    <hr/>


    <table class="table table-striped">
      <thead>
        <tr>
          <g:sortableColumn property="firstName" title="${message(code: 'supervisor.firstName.label', default: 'First Name')}" />
          <g:sortableColumn property="lastName" title="${message(code: 'supervisor.lastName.label', default: 'Last Name')}" />
          <g:sortableColumn property="email" title="${message(code: 'supervisor.email.label', default: 'Email')}" />
          <g:sortableColumn property="canBeAdvisor" title="${message(code: 'supervisor.canBeAdvisor.label', default: 'Can Be Advisor')}" />
          <g:sortableColumn property="isActive" title="${message(code: 'supervisor.isActive.label', default: 'Is Active')}" />

          <th>
            <a href="#"><g:message code='supervisor.edit.label' default='Edit' /></a>
          </th>
        </tr>
      </thead>
      <tbody>
        <g:each in="${supervisorInstanceList}" status="i" var="supervisorInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show" id="${supervisorInstance.id}">${fieldValue(bean: supervisorInstance, field: "firstName")}</g:link></td>
            <td><g:link action="show" id="${supervisorInstance.id}">${fieldValue(bean: supervisorInstance, field: "lastName")}</g:link></td>
            <td>${fieldValue(bean: supervisorInstance, field: "email")}</td>
            <td><g:formatBoolean true="✔" false="✗" boolean="${supervisorInstance.canBeAdvisor}" /></td>
            <td><g:formatBoolean true="✔" false="✗" boolean="${supervisorInstance.isActive}" /></td>

            <td>
              <g:link action="edit" id="${supervisorInstance.id}">
                <i class="icon-pencil"></i>
              </g:link>
            </td>

          </tr>
        </g:each>
      </tbody>
    </table>

    <div class="pagination">
      <g:paginate total="${supervisorInstanceTotal}" />
    </div>
    <script type="text/javascript">
      menu_active("#menu_professors");
    </script>
  </content>

</g:applyLayout>
