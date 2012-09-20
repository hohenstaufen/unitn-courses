<g:applyLayout name="base">

  <content tag="container">
    <h2><g:message code="university.create.title" default="Create new university" /></h2>

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


    <g:form class="form-horizontal" action="save" >
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton class="btn btn-success save" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:form>

  </content>

</g:applyLayout>
