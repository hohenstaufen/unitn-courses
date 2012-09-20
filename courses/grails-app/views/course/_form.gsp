<%@ page import="courses.Course" %>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'courseName', 'error')} ">
  <label class="control-label" for="courseName">
    <g:message code="course.courseName.label" default="Course Name" />
  </label>
  <div class="control">
    <g:textField name="courseName" maxlength="200" value="${courseInstance?.courseName}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'notes', 'error')}">
  <label class="control-label" for="notes">
    <g:message code="course.notes.label" default="Notes" />
  </label>
  <div class="controls">
    <g:textArea name="notes" maxlength="65535" value="${courseInstance?.notes}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'url', 'error')} ">
  <label class="control-label" for="url">
    <g:message code="course.url.label" default="Url" />

  </label>
  <div class="control">
    <g:textField name="url" value="${courseInstance?.url}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'actualStartDate', 'error')} ">
  <label class="control-label" for="actualStartDate">
    <g:message code="course.actualStartDate.label" default="Actual Start Date" />
  </label>
  <div class="control">
    <g:datePicker name="actualStartDate" precision="day" value="${courseInstance?.actualStartDate}" default="none" noSelection="['': '']" />
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'place', 'error')} ">
  <label class="control-label" for="place">
    <g:message code="course.place.label" default="Place" />
  </label>
  <div class="control">
    <g:textField name="place" value="${courseInstance?.place}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'plannedCoursePeriod', 'error')} ">
  <label class="control-label" for="plannedCoursePeriod">
    <g:message code="course.plannedCoursePeriod.label" default="Planned Course Period" />
  </label>
  <div class="control">
    <g:textField name="plannedCoursePeriod" value="${courseInstance?.plannedCoursePeriod}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: courseInstance, field: 'institution', 'error')} ">
  <label class="control-label" for="institution">
    <g:message code="course.institution.label" default="Institution" />
  </label>
  <div class="control">
    <g:textField name="institution" value="${courseInstance?.institution}"/>
  </div>
</div>

<!--
<g:if test="${session.isSupervisor}">
  <div class="control-group ${hasErrors(bean: courseInstance, field: 'areAllMarksDefined', 'error')} ">
    <label class="control-label" for="areAllMarksDefined">
      <g:message code="course.areAllMarksDefined.label" default="All marks defined" />
    </label>
    <div class="control">
      <g:checkBox name="areAllMarksDefined" value="${courseInstance?.areAllMarksDefined}" />
    </div>
  </div>
</g:if>
-->

<g:if test="${ session.isAdmin }">
  <div class="control-group ${hasErrors(bean: courseInstance, field: 'credits', 'error')} ">
    <label class="control-label" for="credits">
      <g:message code="course.credits.label" default="Credits" />

    </label>
    <div class="control">
      <g:field type="number" name="credits" value="${fieldValue(bean: courseInstance, field: 'credits')}"/>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'isPaid', 'error')} ">
    <label class="control-label" for="isPaid">
      <g:message code="course.isPaid.label" default="Is Paid" />
    </label>
    <div class="control">
      <g:checkBox name="isPaid" value="${courseInstance?.isPaid}" />
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'academicYear', 'error')} required">
    <label class="control-label" for="academicYear">
      <g:message code="course.academicYear.label" default="Academic Year" />
      <span class="required-indicator">*</span>
    </label>
    <div class="control">
      <g:field type="number" name="academicYear" required="" value="${courseInstance.academicYear}"/>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'actualCost', 'error')} required">
    <label class="control-label" for="actualCost">
      <g:message code="course.actualCost.label" default="Actual Cost" />
      <span class="required-indicator">*</span>
    </label>
    <div class="control">
      <g:field type="number" name="actualCost" required="" value="${fieldValue(bean: courseInstance, field: 'actualCost')}"/>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'budgetedCost', 'error')} required">
    <label class="control-label" for="budgetedCost">
      <g:message code="course.budgetedCost.label" default="Budgeted Cost" />
      <span class="required-indicator">*</span>
    </label>
    <div class="control">
      <g:field type="number" name="budgetedCost" required="" value="${fieldValue(bean: courseInstance, field: 'budgetedCost')}"/>
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'isByUnitn', 'error')} ">
    <label class="control-label" for="isByUnitn">
      <g:message code="course.isByUnitn.label" default="Is By Unitn" />
    </label>
    <div class="control">
      <g:checkBox name="isByUnitn" value="${courseInstance?.isByUnitn}" />
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'isInManifesto', 'error')} ">
    <label class="control-label" for="isInManifesto">
      <g:message code="course.isInManifesto.label" default="Is In Manifesto" />
    </label>
    <div class="control">
      <g:checkBox name="isInManifesto" value="${courseInstance?.isInManifesto}" />
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'isPaymentCompleted', 'error')} ">
    <label class="control-label" for="isPaymentCompleted">
      <g:message code="course.isPaymentCompleted.label" default="Is Payment Completed" />
    </label>
    <div class="control">
      <g:checkBox name="isPaymentCompleted" value="${courseInstance?.isPaymentCompleted}" />
    </div>
  </div>

  <div class="control-group ${hasErrors(bean: courseInstance, field: 'professor', 'error')} required">
    <label class="control-label" for="professor">
      <g:message code="course.professor.label" default="Professor" />
      <span class="required-indicator">*</span>
    </label>
    <div class="control">
      <g:select id="professor" name="professor.id" from="${courses.Supervisor.list()}"
                optionKey="id" required="" value="${courseInstance?.professor?.id}"
                optionValue="${{it.firstName + ' ' + it.lastName}}" class="many-to-one"/>
    </div>
  </div>

  <g:if test="${courseInstance.id}">
    <div class="control-group ${hasErrors(bean: courseInstance, field: 'coursesEnrollments', 'error')} ">
      <label class="control-label" for="coursesEnrollments">
        <g:message code="course.coursesEnrollments.label" default="Courses Enrollments" />
      </label>
      <div class="control">
        <ul class="one-to-many">
          <g:each in="${courseInstance?.coursesEnrollments?}" var="c">
            <li><g:link controller="courseEnrollment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
          </g:each>
          <li class="add">
            <g:link controller="courseEnrollment" action="create" params="['course.id': courseInstance?.id]">
              ${message(code: 'default.add.label', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment')])}
            </g:link>
          </li>
        </ul>
      </div>
    </div>
  </g:if>

</g:if>
