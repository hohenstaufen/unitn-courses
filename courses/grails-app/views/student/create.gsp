<g:applyLayout name="base">
  <content tag="container">
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <div id="create-student" class="content scaffold-create" role="main">
      <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${studentInstance}">
        <ul class="errors" role="alert">
          <g:eachError bean="${studentInstance}" var="error">
            <li>
              <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
              <g:message error="${error}"/>
            </li>
          </g:eachError>
        </ul>
      </g:hasErrors>
      <g:form class="form-horizontal" action="save">
        <fieldset>
          <g:render template="form"/>

          <div class="form-actions">
            <g:submitButton class="btn btn-success save" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
          </div>
        </fieldset>
      </g:form>
    </div>
  </content>
</g:applyLayout>
