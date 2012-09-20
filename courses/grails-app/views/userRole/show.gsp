<g:applyLayout name="base">

  <content tag="container">
    <div id="show-userRole" class="content scaffold-show" role="main">
      <h1><g:message code="user_role.show.title" default="Show user role" /></h1>
      <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list userRole">

        <g:if test="${userRoleInstance?.role}">
        <li class="fieldcontain">
          <span id="role-label" class="property-label"><g:message code="userRole.role.label" default="Role" /></span>

            <span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${userRoleInstance}" field="role"/></span>

        </li>
        </g:if>

        <g:if test="${userRoleInstance?.deleted}">
        <li class="fieldcontain">
          <span id="deleted-label" class="property-label"><g:message code="userRole.deleted.label" default="Deleted" /></span>

            <span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${userRoleInstance?.deleted}" /></span>

        </li>
        </g:if>

        <g:if test="${userRoleInstance?.userCredentials}">
        <li class="fieldcontain">
          <span id="userCredentials-label" class="property-label"><g:message code="userRole.userCredentials.label" default="User Credentials" /></span>

            <g:each in="${userRoleInstance.userCredentials}" var="u">
            <span class="property-value" aria-labelledby="userCredentials-label"><g:link controller="userCredential" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
            </g:each>

        </li>
        </g:if>

      </ol>
      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${userRoleInstance?.id}" />
          <g:link class="btn btn-primary" action="edit" id="${userRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>
  </content>
</g:applyLayout>
