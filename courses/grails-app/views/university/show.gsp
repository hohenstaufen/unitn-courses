<g:applyLayout name="base">

  <content tag="container">
    <div id="show-university" class="content scaffold-show" role="main">
      <h1><g:message code="university.show.title" default="Show university" /></h1>
      <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list university">

        <g:if test="${universityInstance?.nameUniversity}">
        <li class="fieldcontain">
          <span id="nameUniversity-label" class="property-label"><g:message code="university.nameUniversity.label" default="University Name" /></span>

            <span class="property-value" aria-labelledby="nameUniversity-label"><g:fieldValue bean="${universityInstance}" field="nameUniversity"/></span>

        </li>
        </g:if>

        <g:if test="${universityInstance?.country}">
        <li class="fieldcontain">
          <span id="country-label" class="property-label"><g:message code="university.country.label" default="Country" /></span>

            <span class="property-value" aria-labelledby="country-label">
              <g:link controller="country" action="show" id="${universityInstance?.country?.id}">
                ${universityInstance?.country?.name.encodeAsHTML()}
                <g:if test="${universityInstance?.country?.region}">
                  (${universityInstance?.country?.region.encodeAsHTML()})
                </g:if>
              </g:link>
            </span>

        </li>
        </g:if>

        <g:if test="${universityInstance?.deleted}">
        <li class="fieldcontain">
          <span id="deleted-label" class="property-label"><g:message code="university.deleted.label" default="Deleted" /></span>

            <span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${universityInstance?.deleted}" /></span>

        </li>
        </g:if>

        <g:if test="${universityInstance?.location}">
        <li class="fieldcontain">
          <span id="location-label" class="property-label"><g:message code="university.location.label" default="Location" /></span>

            <span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${universityInstance}" field="location"/></span>

        </li>
        </g:if>

        <g:if test="${universityInstance?.studentsForUniversity}">
        <li class="fieldcontain">
          <span id="studentsForUniversity-label" class="property-label"><g:message code="university.studentsForUniversity.label" default="Students For University" /></span>

            <g:each in="${universityInstance.studentsForUniversity}" var="s">
              <span class="property-value" aria-labelledby="studentsForUniversity-label">
                <g:link controller="student" action="show" id="${s.id}">
                  ${s?.firstName?.encodeAsHTML()}
                  ${s?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>

        </li>
        </g:if>

        <g:if test="${universityInstance?.studentsForUniversityOfProvenance}">
        <li class="fieldcontain">
          <span id="studentsForUniversityOfProvenance-label" class="property-label"><g:message code="university.studentsForUniversityOfProvenance.label" default="Students For University Of Provenance" /></span>

            <g:each in="${universityInstance.studentsForUniversityOfProvenance}" var="s">
              <span class="property-value" aria-labelledby="studentsForUniversityOfProvenance-label">
                <g:link controller="student" action="show" id="${s.id}">
                  ${s?.firstName?.encodeAsHTML()}
                  ${s?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>

        </li>
        </g:if>

      </ol>
      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${universityInstance?.id}" />
          <g:link class="btn btn-primary" action="edit" id="${universityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>
    <script type="text/javascript">
      menu_active("#menu_university");
    </script>

  </content>

</g:applyLayout>
