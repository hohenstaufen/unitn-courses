<g:applyLayout name="base">
  <content tag="container">

    <g:link action='create'>
      <button class="btn btn-success">
        <i class="icon-plus-sign icon-white"></i>
        <g:message code="user_role.nav.new" default="New user role" />
      </button>
    </g:link>
    <hr/>

    <div id="list-country" class="content" role="main">
      <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <table class="table table-striped">
        <thead>
          <g:sortableColumn property="role" title="${message(code: 'userRole.role.label', default: 'Role')}" />

          <th>
            <a href="#"><g:message code='user_role.edit.label' default='Edit' /></a>
          </th>

        </thead>
        <tbody>
        <g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show" id="${userRoleInstance.id}">${fieldValue(bean: userRoleInstance, field: "role")}</g:link></td>

            <td>
              <g:link action="edit" id="${userRoleInstance.id}">
                <i class="icon-pencil"></i>
              </g:link>
            </td>

          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${userRoleInstanceTotal}" />
      </div>
    </div>
  </content>
</g:applyLayout>
