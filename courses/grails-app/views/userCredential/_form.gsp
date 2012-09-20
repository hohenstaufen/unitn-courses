<div class="row-fluid">
  <div class="span12">
    <div class="control-group ${hasErrors(bean: userCredentialInstance, field: 'username', 'error')}">
      <label class="control-label" for="username"><g:message code="userCredential.username.label" default="Username" /></label>
      <div class="controls">
        <g:textField name="firstName" maxlength="200" value="${userCredentialInstance?.username}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: userCredentialInstance, field: 'password', 'error')}">
      <label class="control-label" for="password"><g:message code="userCredential.password.label" default="Password" /></label>
      <div class="controls">
        <g:textField name="password" maxlength="500" value="${userCredentialInstance?.password}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: userCredentialInstance, field: 'userRole', 'error')} required">
      <label class="control-label" for="userRole"><g:message code="userCredential.userRole.label" default="User Role" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="userRole" name="userRole.id" from="${courses.UserRole.list()}" optionKey="id"
                  required="" value="${userCredentialInstance?.userRole?.id}" class="many-to-one"
                  optionValue="${{ it.role }}" />
      </div>
    </div>

    <g:hiddenField name="user.id" value="${userCredentialInstance?.user?.id}" />

  </div>
</div>
