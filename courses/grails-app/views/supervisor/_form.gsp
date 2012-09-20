<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'firstName', 'error')} ">
  <label class="control-label" for="firstName">
    <g:message code="supervisor.firstName.label" default="First Name" />
  </label>
  <div class="control">
    <g:textField name="firstName" maxlength="200" value="${supervisorInstance?.firstName}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'lastName', 'error')} ">
  <label class="control-label" for="lastName">
    <g:message code="supervisor.lastName.label" default="Last Name" />
  </label>
  <div class="control">
    <g:textField name="lastName" maxlength="200" value="${supervisorInstance?.lastName}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'email', 'error')} ">
  <label class="control-label" for="email">
    <g:message code="supervisor.email.label" default="Email" />
  </label>
  <div class="control">
    <g:textField name="email" maxlength="200" value="${supervisorInstance?.email}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'canBeAdvisor', 'error')} ">
  <label class="control-label" for="canBeAdvisor">
    <g:message code="supervisor.canBeAdvisor.label" default="Can Be Advisor" />
  </label>
  <div class="control">
    <g:checkBox name="canBeAdvisor" value="${supervisorInstance?.canBeAdvisor}" />
  </div>
</div>

<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'isActive', 'error')} ">
  <label class="control-label" for="isActive">
    <g:message code="supervisor.isActive.label" default="Is Active" />
  </label>
  <div class="control">
    <g:checkBox name="isActive" value="${supervisorInstance?.isActive}" />
  </div>
</div>

<div class="control-group ${hasErrors(bean: supervisorInstance, field: 'isInternal', 'error')} ">
  <label class="control-label" for="isInternal">
    <g:message code="supervisor.isInternal.label" default="Is Internal" />
  </label>
  <div class="control">
    <g:checkBox name="isInternal" value="${supervisorInstance?.isInternal}" />
  </div>
</div>

<g:if test="${supervisorInstance.id}">
  <div class="control-group ${hasErrors(bean: supervisorInstance, field: 'courses', 'error')} ">
    <label class="control-label" for="courses">
      <g:message code="supervisor.courses.label" default="Courses" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${supervisorInstance?.courses?}" var="c">
          <li>
            <g:link controller="course" action="show" id="${c.id}">
              ${c?.courseName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="course" action="create" params="['supervisor.id': supervisorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'course.label', default: 'Course')])}</g:link>
        </li>
      </ul>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: supervisorInstance, field: 'studentsForCurrentAdvisor', 'error')} ">
    <label class="control-label" for="studentsForCurrentAdvisor">
      <g:message code="supervisor.studentsForCurrentAdvisor.label" default="Students For Current Advisor" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${supervisorInstance?.studentsForCurrentAdvisor?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['supervisor.id': supervisorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
        </li>
      </ul>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: supervisorInstance, field: 'studentsForTutor', 'error')} ">
    <label class="control-label" for="studentsForTutor">
      <g:message code="supervisor.studentsForTutor.label" default="Students For Tutor" />
    </label>
    <div class="control">
      <ul class="one-to-many">
        <g:each in="${supervisorInstance?.studentsForTutor?}" var="s">
          <li>
            <g:link controller="student" action="show" id="${s.id}">
              ${s?.firstName?.encodeAsHTML()}
              ${s?.lastName?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>
        <li class="add">
          <g:link controller="student" action="create" params="['supervisor.id': supervisorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
        </li>
      </ul>
  </div>
</g:if>

<script type="text/javascript">
  menu_active("#menu_professors");
</script>
