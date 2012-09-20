<g:applyLayout name="base">
  <content tag="container">
    <script type="text/javascript">
      menu_active("#menu_home");
    </script>

    <g:if test="${!session.user.check_studyplan()}">
      <div class="alert alert-danger">
        <g:message code="student.home.studyplan_incorrect"default="Check your study plan!" />
      </div>
      <hr/>
    </g:if>

    <div class="row-fluid">
      <div class="span4">
        <img width="300" src="${resource(dir: 'images/courses/student', file: 'no_image.gif')}" alt="No Image"/>
      </div>
      <div class="span8">
        <div class ="well">
          <h6><g:message code="student.show.main_info"/></h6>
          <div class="row-fluid">
            <div class="span6">
              <g:if test="${studentInstance?.firstName}">
                <span id="firstName-label" class="property-label">
                  <strong><g:message code="student.firstName.label" default="First Name" /></strong>
                </span>
                <span class="property-value" aria-labelledby="firstName-label">
                  <g:fieldValue bean="${studentInstance}" field="firstName"/>
                </span>
               </g:if>
            </div>
            <div class="span6">
              <g:if test="${studentInstance?.lastName}">
                <span id="lastName-label" class="property-label"><strong><g:message code="student.lastName.label" default="Last Name" /></strong></span>
                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${studentInstance}" field="lastName"/></span>
              </g:if>
            </div>
          </div>
          <div class="row-fluid">
            <div class="span6">
              <g:if test="${studentInstance?.email}">
                <span id="email-label" class="property-label"><strong><g:message code="student.email.label" default="Email" /></strong></span>
                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${studentInstance}" field="email"/></span>
              </g:if>
            </div>
            <div class="span6">
              <g:if test="${studentInstance?.mobilePhone}">
                <strong><span id="mobilePhone-label" class="property-label"><g:message code="student.mobilePhone.label" default="Mobile Phone" /></strong></span>
                <span class="property-value" aria-labelledby="mobilePhone-label"><g:fieldValue bean="${studentInstance}" field="mobilePhone"/></span>
              </g:if>
            </div>
          </div>
          <div class="row-fluid">
            <div class="span8">
              <g:if test="${studentInstance?.dateOfBirth}">
                <span id="dateOfBirth-label" class="property-label"><strong><g:message code="student.dateOfBirth.label" default="Date Of Birth" /></strong></span>
                <span class="property-value"
                aria-labelledby="dateOfBirth-label">
                <g:formatDate format="dd/MM/yyyy" date="${studentInstance?.dateOfBirth}" /></span>
              </g:if>
            </div>
            <div class="span4">
               <g:if test="${studentInstance?.placeOfBirth}">
                <span id="placeOfBirth-label" class="property-label"><strong><g:message code="student.placeOfBirth.label" default="Place Of Birth" /></strong></span>
                <span class="property-value" aria-labelledby="placeOfBirth-label"><g:fieldValue bean="${studentInstance}" field="placeOfBirth"/></span>
              </g:if>
            </div>
          </div>
          <div class="row-fluid">
            <div class="span6">
              <g:if test="${studentInstance?.legalResidence}">
                <span id="legalResidence-label" class="property-label"><strong><g:message code="student.legalResidence.label" default="Legal Residence" /></strong></span>
                <span class="property-value" aria-labelledby="legalResidence-label"><g:fieldValue bean="${studentInstance}" field="legalResidence"/></span>
              </g:if>
            </div>
            <div class="span6">
              <g:if test="${studentInstance?.currentDomicile}">
                <span id="currentDomicile-label" class="property-label"><strong><g:message code="student.currentDomicile.label" default="Current Domicile" /></strong></span>
                <span class="property-value" aria-labelledby="currentDomicile-label"><g:fieldValue bean="${studentInstance}" field="currentDomicile"/></span>
              </g:if>
            </div>
          </div>

          <div class="row-fluid">
            <div class="span6">
              <g:if test="${studentInstance?.currentAdvisor}">
                <span id="currentAdvisor-label" class="property-label">
                  <strong>
                    <g:message code="student.currentAdvisor.label" default="Current Advisor" />
                  </strong>
                </span>
                <span class="property-value" aria-labelledby="currentAdvisor-label">
                  <g:link controller="supervisor" action="show" id="${studentInstance?.currentAdvisor?.id}">
                    ${studentInstance?.currentAdvisor?.firstName?.encodeAsHTML()}
                    ${studentInstance?.currentAdvisor?.lastName?.encodeAsHTML()}
                  </g:link>
                </span>
              </g:if>
            </div>
            <div class="span6">
              <g:if test="${studentInstance?.tutor}">
                <span id="tutor-label" class="property-label">
                  <strong>
                    <g:message code="student.tutor.label" default="Tutor" />
                  </strong>
                </span>
                <span class="property-value" aria-labelledby="tutor-label">
                  <g:link controller="supervisor" action="show" id="${studentInstance?.tutor?.id}">
                    ${studentInstance?.tutor?.firstName?.encodeAsHTML()}
                    ${studentInstance?.tutor?.lastName?.encodeAsHTML()}
                  </g:link>
                </span>
              </g:if>
            </div>
          </div>

        </div>
        <hr/>
        <div class="well">
          <h6><g:message code="student.home.career_info"/></h6>

          <div class="row-fluid">
            <div class="span6">
              <div>
                <strong><g:message code="student.home.courses" default="Number of courses: "/></strong> ${number_of_courses}
              </div>
              <div>
                <strong><g:message code="student.home.past_exams" default="Number of past courses: "/></strong> ${number_of_courses_done}
              </div>
            </div>
            <div class="span6">
              <div>
                <strong><g:message code="student.home.planned_exams" default="Number of planned courses: "/></strong> ${number_of_courses_todo}
              </div>
              <div>
                <strong><g:message code="student.home.status" default="Status: "/></strong>
                <g:if test="${studentInstance.admittedConditionally}">
                  <b><g:message code="student.home.conditional_admission" default="Conditional Admission to year "/> ${fieldValue(bean: studentInstance, field: "courseYear")}</b>
                </g:if>
                <g:else>
                  <g:message code="student.home.admitted" defautl="Adimitted to year"/> ${studentInstance.courseYear}
                </g:else>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <hr/>
   <h6><g:message code="student.home.career_progress" default="Your carreer's progress bar"/></h6>
    <div>
      <g:message code="student.home.percentage" default="Percentage:"/>
      <g:if test="${number_of_courses != 0}">
        <g:formatNumber number="${number_of_courses_done / number_of_courses * 100.0}"
                        maxFractionDigits="0" roundingMode="HALF_DOWN" />
      </g:if>
      <g:else>
        0
      </g:else>
      %
    </div>
    <g:if test="${number_of_courses != 0}">
      <div class="progress progress-striped active">
        <div class="bar" style="width: ${number_of_courses_done / number_of_courses * 100.0}%;"></div>
      </div>
    </g:if>
    <g:else>
      <div class="progress progress-striped active">
        <div class="bar" style="width: 0%;"></div>
      </div>
    </g:else>
  </content>
</g:applyLayout>
