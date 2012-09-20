<g:applyLayout name="base">
  <content tag="container">


  <!-- if it is a supervisor or admin can assign marks or view enrollments-->
  <g:if test="${(session.isAdmin || session.isSupervisor) && !courseInstance.areAllMarksDefined}">
    <g:link controller="course" action="assign_marks" id="${courseInstance.id}">
      <button class="btn btn-primary">
        <i class="icon-pencil icon-white"></i>
        <g:message code="professor.show.assign_marks" args="[entityName]"/>
      </button>
    </g:link>
    <g:if test="${courseInstance?.coursesEnrollments}">
      <div id="ViewEnrollments" class="modal hide fade">
        <div class="modal-header">
          <button class="close" data-dismiss="modal">×</button>
          <h3><g:message code="professor.show.view_enrollements" default="View Enrollments"/></h3>
        </div>
        <div class="modal-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <g:sortableColumn property="studentFirstName" title="${message(code: 'student.firstName', default: 'First Name')}" />
                <g:sortableColumn property="studentLastName" title="${message(code: 'student.lastName', default: 'Last Name')}" />
                <g:sortableColumn property="dateEnrollment" title="${message(code: 'courseEnrollment.dateEnrollment', default: 'Date of Enrollment')}" />
              </tr>
            </thead>
            <tbody>
              <g:each in="${courseInstance.coursesEnrollments}" var="c">
                <tr>
                  <td>${c.student.firstName.encodeAsHTML()}</td>
                  <td>${c.student.lastName.encodeAsHTML()}</td>
                  <td>${c.enrolledAt.encodeAsHTML()}</td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
        <div class="modal-footer"><a href="#" class="btn" data-dismiss="modal"><g:message code="professor.window.close_button" default="Close"/></a></div>
      </div>
      <button class="btn btn-info" data-toggle="modal" href="#ViewEnrollments">
        <i class="icon-list icon-white"></i>
        <g:message code="professor.show.view_ enrollments" default="View Enrollments"/>
      </button>
    </g:if>
    <hr/>
  </g:if>

  <div id="show-course" class="content scaffold-show" role="main">
    <h2>
      <g:fieldValue bean="${courseInstance}" field="courseName"/>
    </h2>

    <h6>
      <g:message code="professor.show.main_details"/>
    </h6>

    <g:if test="${flash.message}">
      <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list course">
      <g:if test="${courseInstance?.courseName}">
        <li class="fieldcontain">
          <span id="courseName-label" class="property-label">
            <g:message code="course.courseName.label" default="Course Name" />
          </span>
          <span class="property-value" aria-labelledby="courseName-label">
            <g:fieldValue bean="${courseInstance}" field="courseName"/>
          </span>
        </li>
      </g:if>

      <g:if test="${courseInstance?.notes}">
        <li class="fieldcontain">
          <span id="notes-label" class="property-label">
            <g:message code="course.notes.label" default="Notes" />
          </span>
          <span class="property-value" aria-labelledby="notes-label">
            <g:fieldValue bean="${courseInstance}" field="notes"/>
          </span>
        </li>
      </g:if>

      <g:if test="${courseInstance?.actualStartDate}">
        <li class="fieldcontain">
          <span id="actualStartDate-label" class="property-label">
            <g:message code="course.actualStartDate.label" default="Actual Start Date" />
          </span>
          <span class="property-value" aria-labelledby="actualStartDate-label">
            <g:formatDate format="dd/MM/yyyy" date="${courseInstance?.actualStartDate}" />
          </span>
        </li>
      </g:if>

      <g:if test="${courseInstance?.credits}">
        <li class="fieldcontain">
          <span id="credits-label" class="property-label">
            <g:message code="course.credits.label" default="Credits" />
          </span>
          <span class="property-value" aria-labelledby="credits-label">
            <g:fieldValue bean="${courseInstance}" field="credits"/>
          </span>
        </li>
      </g:if>

      <g:if test="${courseInstance?.professor}">
        <li class="fieldcontain">
          <span id="professor-label" class="property-label">
            <g:message code="course.professor.label" default="Professor" />
          </span>
          <span class="property-value" aria-labelledby="professor-label">
            <g:link controller="supervisor" action="show" id="${courseInstance?.professor?.id}">
              ${courseInstance?.professor?.firstName?.encodeAsHTML()}
              ${courseInstance?.professor?.lastName?.encodeAsHTML()}
            </g:link>
          </span>
        </li>
      </g:if>

      <g:if test="${courseInstance?.url}">
        <li class="fieldcontain">
          <span id="url-label" class="property-label">
            <g:message code="course.url.label" default="Url" />
          </span>
          <span class="property-value" aria-labelledby="url-label">
            <g:fieldValue bean="${courseInstance}" field="url"/>
          </span>
        </li>
      </g:if>

      <g:if test="${session.isAdmin || session.isSupervisor}">

        <g:if test="${courseInstance?.isPaid}">
          <li class="fieldcontain">
            <span id="isPaid-label" class="property-label">
              <g:message code="course.isPaid.label" default="Is Paid" />
            </span>
            <span class="property-value" aria-labelledby="isPaid-label">
              <g:formatBoolean boolean="${courseInstance?.isPaid}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.academicYear}">
          <li class="fieldcontain">
            <span id="academicYear-label" class="property-label">
              <g:message code="course.academicYear.label" default="Academic Year" />
            </span>
            <span class="property-value" aria-labelledby="academicYear-label">
              <g:formatNumber number="${courseInstance.academicYear}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.actualCost}">
          <li class="fieldcontain">
            <span id="actualCost-label" class="property-label">
              <g:message code="course.actualCost.label" default="Actual Cost" />
            </span>
            <span class="property-value" aria-labelledby="actualCost-label">
              <g:fieldValue bean="${courseInstance}" field="actualCost"/>
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.areAllMarksDefined}">
          <li class="fieldcontain">
            <span id="areAllMarksDefined-label" class="property-label">
              <g:message code="course.areAllMarksDefined.label" default="Are All Marks Defined" />
            </span>
            <span class="property-value" aria-labelledby="areAllMarksDefined-label">
              <g:formatBoolean boolean="${courseInstance?.areAllMarksDefined}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.budgetedCost}">
          <li class="fieldcontain">
            <span id="budgetedCost-label" class="property-label">
              <g:message code="course.budgetedCost.label" default="Budgeted Cost" />
            </span>
            <span class="property-value" aria-labelledby="budgetedCost-label">
              <g:fieldValue bean="${courseInstance}" field="budgetedCost"/>
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.institution}">
          <li class="fieldcontain">
            <span id="institution-label" class="property-label">
              <g:message code="course.institution.label" default="Institution" />
            </span>
            <span class="property-value" aria-labelledby="institution-label">
              <g:fieldValue bean="${courseInstance}" field="institution"/>
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.isByUnitn}">
          <li class="fieldcontain">
            <span id="isByUnitn-label" class="property-label">
              <g:message code="course.isByUnitn.label" default="Is By Unitn" />
            </span>
            <span class="property-value" aria-labelledby="isByUnitn-label">
              <g:formatBoolean boolean="${courseInstance?.isByUnitn}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.isInManifesto}">
          <li class="fieldcontain">
            <span id="isInManifesto-label" class="property-label">
              <g:message code="course.isInManifesto.label" default="Is In Manifesto" />
            </span>
            <span class="property-value" aria-labelledby="isInManifesto-label">
              <g:formatBoolean boolean="${courseInstance?.isInManifesto}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.isPaymentCompleted}">
          <li class="fieldcontain">
            <span id="isPaymentCompleted-label" class="property-label">
              <g:message code="course.isPaymentCompleted.label" default="Is Payment Completed" />
            </span>
            <span class="property-value" aria-labelledby="isPaymentCompleted-label">
              <g:formatBoolean boolean="${courseInstance?.isPaymentCompleted}" />
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.place}">
          <li class="fieldcontain">
            <span id="place-label" class="property-label">
              <g:message code="course.place.label" default="Place" />
            </span>
            <span class="property-value" aria-labelledby="place-label">
              <g:fieldValue bean="${courseInstance}" field="place"/>
            </span>
          </li>
        </g:if>

        <g:if test="${courseInstance?.plannedCoursePeriod}">
          <li class="fieldcontain">
            <span id="plannedCoursePeriod-label" class="property-label">
              <g:message code="course.plannedCoursePeriod.label" default="Planned Course Period" />
            </span>
            <span class="property-value" aria-labelledby="plannedCoursePeriod-label">
              <g:fieldValue bean="${courseInstance}" field="plannedCoursePeriod"/>
            </span>
          </li>
        </g:if>
      </ol>

      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${courseInstance?.id}" />
          <g:link class="btn btn-primary" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:if test="${session.isAdmin}">
            <g:actionSubmit class="btn btn-danger" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          </g:if>
        </fieldset>
      </g:form>
    </div>
  </g:if>

  <script type="text/javascript">
    menu_active("#menu_courses");
  </script>

</content>
</g:applyLayout>
