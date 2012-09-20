<g:applyLayout name="base">

  <content tag="container">
    <h2><g:message code="university.edit.title" default="Edit university" /></h2>

    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${universityInstance}">
      <ul class="alert alert-error" role="alert">
        <g:eachError bean="${universityInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
            <g:message error="${error}"/>
          </li>
        </g:eachError>
      </ul>
    </g:hasErrors>


    <g:form method="post" class="form-horizontal">
      <g:hiddenField name="id" value="${universityInstance?.id}" />
      <g:hiddenField name="version" value="${universityInstance?.version}" />
      <fieldset>
        <g:render template="form"/>
        <div class="form-actions">
          <g:actionSubmit class="btn btn-success save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </div>
      </fieldset>
    </g:form>

  </content>

</g:applyLayout>
