<g:applyLayout name="base">

  <content tag="container">

    <div id="show-country" class="content scaffold-show" role="main">
      <h1><g:message code="country.show.title" default="Show country" /></h1>
      <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list country">

        <g:if test="${countryInstance?.name}">
        <li class="fieldcontain">
          <span id="name-label" class="property-label"><g:message code="country.name.label" default="Name" /></span>

            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${countryInstance}" field="name"/></span>

        </li>
        </g:if>

        <g:if test="${countryInstance?.region}">
        <li class="fieldcontain">
          <span id="region-label" class="property-label"><g:message code="country.region.label" default="Region" /></span>

            <span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${countryInstance}" field="region"/></span>

        </li>
        </g:if>

        <g:if test="${countryInstance?.citizenship}">
        <li class="fieldcontain">
          <span id="citizenship-label" class="property-label"><g:message code="country.citizenship.label" default="Citizenship" /></span>

            <span class="property-value" aria-labelledby="citizenship-label"><g:fieldValue bean="${countryInstance}" field="citizenship"/></span>

        </li>
        </g:if>

        <g:if test="${countryInstance?.studentsForCitizenship}">
        <li class="fieldcontain">
          <span id="studentsForCitizenship-label" class="property-label"><g:message code="country.studentsForCitizenship.label" default="Students For Citizenship" /></span>

            <g:each in="${countryInstance.studentsForCitizenship}" var="s">
              <span class="property-value" aria-labelledby="studentsForCitizenship-label">
                <g:link controller="student" action="show" id="${s.id}">
                  ${s?.firstName?.encodeAsHTML()}
                  ${s?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>

        </li>
        </g:if>

        <g:if test="${countryInstance?.studentsForCountryOfProvenance}">
        <li class="fieldcontain">
          <span id="studentsForCountryOfProvenance-label" class="property-label"><g:message code="country.studentsForCountryOfProvenance.label" default="Students For Country Of Provenance" /></span>

            <g:each in="${countryInstance.studentsForCountryOfProvenance}" var="s">
              <span class="property-value" aria-labelledby="studentsForCountryOfProvenance-label">
                <g:link controller="student" action="show" id="${s.id}">
                  ${s?.firstName?.encodeAsHTML()}
                  ${s?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>

        </li>
        </g:if>

        <g:if test="${countryInstance?.universities}">
        <li class="fieldcontain">
          <span id="universities-label" class="property-label"><g:message code="country.universities.label" default="Universities" /></span>

            <g:each in="${countryInstance.universities}" var="u">
              <span class="property-value" aria-labelledby="universities-label">
                <g:link controller="university" action="show" id="${u.id}">
                  ${u?.nameUniversity?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>

        </li>
        </g:if>

      </ol>
      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${countryInstance?.id}" />
          <g:link class="btn btn-primary" action="edit" id="${countryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>

    <script type="text/javascript">
      menu_active("#menu_country");
    </script>
  </content>

</g:applyLayout>
