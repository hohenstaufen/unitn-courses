<g:if test="${flash.message}">
  <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<table class="table table-striped">
  <thead>
    <tr>
      <g:sortableColumn property="firstName" title="${message(code: 'student.firstName.label', default: 'First Name')}" />
      <g:sortableColumn property="lastName" title="${message(code: 'student.lastName.label', default: 'Last Name')}" />
      <g:sortableColumn property="fullName" title="${message(code: 'student.fullName.label', default: 'Full Name')}" />
      <g:sortableColumn property="phdCycle" title="${message(code: 'student.phdCycle.label', default: 'Phd Cycle')}" />

      <th>
        <a href="#"><g:message code="student.list.studyplan" default="Study plan" /></a>
      </th>

      <th>
        <a href="#"><g:message code='student.mail.label' default='Mail student' /></a>
      </th>

      <th>
        <a href="#"><g:message code='student.edit.label' default='Edit' /></a>
      </th>
    </tr>
  </thead>
  <tbody>
    <g:each in="${studentInstanceList}" status="i" var="studentInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <td>
          <g:link action="show" id="${studentInstance.id}">
            ${fieldValue(bean: studentInstance, field: "firstName")}
          </g:link>
        </td>
        <td>
          <g:link action="show" id="${studentInstance.id}">
            ${fieldValue(bean: studentInstance, field: "lastName")}
          </g:link>
        </td>
        <td>
          <g:link action="show" id="${studentInstance.id}">
            ${fieldValue(bean: studentInstance, field: "fullName")}
          </g:link>
        </td>
        <td>${fieldValue(bean: studentInstance, field: "phdCycle")}</td>

        <td>
          <g:link action="study_plan" id="${studentInstance.id}">
            <i class="icon-list-alt"></i>
          </g:link>
        </td>

        <td>
          <g:if test="${studentInstance.email}">
            <g:link action="mail" id="${studentInstance.id}">
              <i class="icon-envelope"></i>
            </g:link>
          </g:if>
        </td>

        <td>
          <g:link action="edit" id="${studentInstance.id}">
            <i class="icon-pencil"></i>
          </g:link>
        </td>

      </tr>
    </g:each>
  </tbody>
</table>

<div class="pagination">
  <g:if test="${selectedYear}">
    <g:paginate total="${studentInstanceTotal}" params="${[year: selectedYear]}" />
  </g:if>
  <g:else>
    <g:paginate total="${studentInstanceTotal}" />
  </g:else>
</div>
