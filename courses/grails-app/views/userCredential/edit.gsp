<g:form action="update" method="post" class="form-horizontal" name="UserCredential_Form">
  <g:hiddenField name="id" value="${userCredentialInstance?.id}" />
  <g:hiddenField name="version" value="${userCredentialInstance?.version}" />
  <fieldset>
      <g:render template="form"/>
      <g:actionSubmit class="btn btn-success save modal-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
  </fieldset>
</g:form>
