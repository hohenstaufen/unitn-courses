 <g:if test="${session.isAdmin}">
  <li class="nav-header">
    <g:message code="admin.menu.header" />
  </li>
  <li id="menu_home">
    <g:link controller="admin" action="home"><g:message code="admin.menu.home"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="admin.menu.header.students" />
  </li>
  <li id="menu_students">
    <g:link controller="student" action="list"><g:message code="admin.menu.students"/></g:link>
  </li>
  <li id="menu_study_plans">
    <g:link controller="student" action="list_incorrect_studyplans"><g:message code="admin.menu.study_plans"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="admin.menu.header.courses" />
  </li>
  <li id="menu_courses">
    <g:link controller="course" action="list"><g:message code="admin.menu.courses"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="admin.menu.header.professors" />
  </li>
  <li id="menu_professors">
    <g:link controller="supervisor" action="list"><g:message code="admin.menu.professors"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="admin.menu.header.other" />
  </li>
  <li id="menu_country">
    <g:link controller="country" action="list"><g:message code="admin.menu.country" /></g:link>
  </li>
  <li id="menu_university">
    <g:link controller="university" action="list"><g:message code="admin.menu.university" /></g:link>
  </li>
</g:if>
<g:elseif test="${session.isStudent}">
  <li class="nav-header">
    <g:message code="student.menu.header"/>
  </li>
  <li id="menu_home">
    <g:link controller="student" action='home'><g:message code="student.menu.home.home"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="student.menu.header.studyplan"/>
  </li>
  <li id="menu_planned_exams">
    <g:link controller="student" action='planned_exams'><g:message code="student.menu.studyplan.planned_exams"/></g:link>
  </li>
  <li id="menu_past_exams">
    <g:link controller="student" action='past_exams'><g:message code="student.menu.studyplan.past_exams"/></g:link>
  </li>
  <li id="menu_studyplan">
    <g:link controller="student" action='study_plan'><g:message code="student.menu.studyplan.study_plan"/></g:link>
  </li>
  <li class="nav-header">
    <g:message code="student.menu.header.courses"/>
  </li>
  <li id="menu_courses">
    <g:link controller="course" action="list_student"><g:message code="student.menu.courses.available_courses"/></g:link>
  </li>
</g:elseif>
<g:elseif test="${session.isSupervisor}">
  <li class="nav-header">
    <g:message code="supervisor.menu.header"/>
  </li>
  <li id="menu_home">
    <g:link controller="supervisor" action="home"><g:message code="supervisor.menu.home" /></g:link>
  </li>
  <li class="nav-header">
    <g:message code="supervisor.menu.header.profile"/>
  </li>
  <li id="menu_profile">
    <g:link controller="supervisor" action="show" id="${session.user.id}"><g:message code="supervisor.menu.profile" /></g:link>
  </li>
  <li class="nav-header">
    <g:message code="supervisor.menu.header.courses"/>
  </li>
  <li id="menu_courses">
    <g:link controller="course" action="list_supervisor"><g:message code="supervisor.menu.courses" /></g:link>
  </li>
</g:elseif>
