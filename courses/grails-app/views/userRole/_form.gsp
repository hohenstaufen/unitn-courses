<div class="control-group ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} ">
  <label class="control-label" for="role">
    <g:message code="userRole.role.label" default="Role" />
  </label>
  <div class="control">
    <g:textField name="role" maxlength="100" value="${userRoleInstance?.role}"/>
  </div>
</div>
