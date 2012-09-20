<g:applyLayout name="base">
  <content tag="container">
    <g:render template="menu"/>
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${studentInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${studentInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
            <g:message error="${error}"/>
          </li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form action="save" class="form-horizontal">
      <g:hiddenField name="id" value="${studentInstance?.id}" />
      <g:hiddenField name="version" value="${studentInstance?.version}" />
      <fieldset>
        <g:render template="form" />
        <g:actionSubmit class="btn btn-success save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </content>
</g:applyLayout>
