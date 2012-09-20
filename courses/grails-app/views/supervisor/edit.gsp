<g:applyLayout name="base">

  <content tag="container">
    <h2><g:message code="supervisor.edit.title" default="Edit supervisor" /></h2>

    <g:form method="post" class="form-horizontal">
      <g:hiddenField name="id" value="${supervisorInstance?.id}" />
      <g:hiddenField name="version" value="${supervisorInstance?.version}" />
      <fieldset>
        <g:render template="form"/>
        <div class="form-actions">
          <g:actionSubmit class="btn btn-success save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                          formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </div>
      </fieldset>
    </g:form>

  </content>

</g:applyLayout>
