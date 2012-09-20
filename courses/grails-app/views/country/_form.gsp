<div class="control-group ${hasErrors(bean: countryInstance, field: 'name', 'error')} ">
  <label class="control-label"for="name">
    <g:message code="country.name.label" default="Name" />
  </label>
  <div class="control">
    <g:textField name="name" value="${countryInstance?.name}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: countryInstance, field: 'region', 'error')} ">
  <label class="control-label"for="region">
    <g:message code="country.region.label" default="Region" />
  </label>
  <div class="control">
    <g:textField name="region" maxlength="200" value="${countryInstance?.region}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: countryInstance, field: 'citizenship', 'error')} ">
  <label class="control-label"for="citizenship">
    <g:message code="country.citizenship.label" default="Citizenship" />
  </label>
  <div class="control">
    <g:textField name="citizenship" value="${countryInstance?.citizenship}"/>
  </div>
</div>


<g:if test="${countryInstance.id}">
  <div class="control-group ${hasErrors(bean: countryInstance, field: 'studentsForCitizenship', 'error')} ">
    <label class="control-label"for="studentsForCitizenship">
      <g:message code="country.studentsForCitizenship.label" default="Students For Citizenship" />
    </label>
    <div class="control">

      <ul class="one-to-many">
        <g:each in="${countryInstance?.studentsForCitizenship?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['country.id': countryInstance?.id]">
            ${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}
          </g:link>
        </li>
      </ul>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: countryInstance, field: 'studentsForCountryOfProvenance', 'error')} ">
    <label class="control-label"for="studentsForCountryOfProvenance">
      <g:message code="country.studentsForCountryOfProvenance.label" default="Students For Country Of Provenance" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${countryInstance?.studentsForCountryOfProvenance?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
        </li>
      </ul>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: countryInstance, field: 'universities', 'error')} ">
    <label class="control-label"for="universities">
      <g:message code="country.universities.label" default="Universities" />

    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${countryInstance?.universities?}" var="u">
          <li>
            <g:link controller="university" action="show" id="${u.id}">
              ${u?.nameUniversity?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="university" action="create" params="['country.id': countryInstance?.id]">
            ${message(code: 'default.add.label', args: [message(code: 'university.label', default: 'University')])}
          </g:link>
        </li>
      </ul>
    </div>
  </div>
</g:if>

<script type="text/javascript">
  menu_active("#menu_country");
</script>
