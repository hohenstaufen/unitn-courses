<div class="control-group ${hasErrors(bean: universityInstance, field: 'nameUniversity', 'error')} ">
  <label class="control-label" for="nameUniversity">
    <g:message code="university.nameUniversity.label" default="Name University" />
  </label>
  <div class="control">
    <g:textField name="nameUniversity" value="${universityInstance?.nameUniversity}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: universityInstance, field: 'country', 'error')} required">
  <label class="control-label" for="country">
    <g:message code="university.country.label" default="Country" />
    <span class="required-indicator">*</span>
  </label>
  <div class="control">
    <g:select id="country" name="country.id" optionValue="${{it.name +' - '+it.region}}"
              from="${courses.Country.list()}" optionKey="id" required="" value="${universityInstance?.country?.id}" class="many-to-one"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: universityInstance, field: 'location', 'error')} ">
  <label class="control-label" for="location">
    <g:message code="university.location.label" default="Location" />
  </label>
  <div class="control">
    <g:textField name="location" value="${universityInstance?.location}"/>
  </div>
</div>


<g:if test="${universityInstance.id}">
  <div class="control-group ${hasErrors(bean: universityInstance, field: 'studentsForUniversity', 'error')} ">
    <label class="control-label" for="studentsForUniversity">
      <g:message code="university.studentsForUniversity.label" default="Students For University" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${universityInstance?.studentsForUniversity?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['university.id': universityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
        </li>
      </ul>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: universityInstance, field: 'studentsForUniversityOfProvenance', 'error')} ">
    <label class="control-label" for="studentsForUniversityOfProvenance">
      <g:message code="university.studentsForUniversityOfProvenance.label" default="Students For University Of Provenance" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${universityInstance?.studentsForUniversityOfProvenance?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['university.id': universityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
        </li>
      </ul>
    </div>
  </div>
</g:if>

<script type="text/javascript">
  menu_active("#menu_university");
</script>
