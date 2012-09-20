<g:applyLayout name="base">
  <content tag="container">

    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />

    <g:if test="${session.isAdmin}">
      <g:render template="menu"/>
    </g:if>

    <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list student">
      <div class="row-fluid">
        <div class="span5">
          <img width="330" src="${resource(dir: 'images/courses/student', file: 'no_image.gif')}" alt="No Image"/>
        </div>
        <div class="span7">
          <h6><g:message code="student.show.main_info"/></h6>
          <g:if test="${studentInstance?.firstName}">
            <li class="fieldcontain">
              <span id="firstName-label" class="property-label">
                <g:message code="student.firstName.label" default="First Name" />
              </span>
              <span class="property-value" aria-labelledby="firstName-label">
                <g:fieldValue bean="${studentInstance}" field="firstName"/>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.lastName}">
            <li class="fieldcontain">
              <span id="lastName-label" class="property-label"><g:message code="student.lastName.label" default="Last Name" /></span>
              <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${studentInstance}" field="lastName"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.mobilePhone}">
            <li class="fieldcontain">
              <span id="mobilePhone-label" class="property-label"><g:message code="student.mobilePhone.label" default="Mobile Phone" /></span>
              <span class="property-value" aria-labelledby="mobilePhone-label"><g:fieldValue bean="${studentInstance}" field="mobilePhone"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.email}">
            <li class="fieldcontain">
              <span id="email-label" class="property-label"><g:message code="student.email.label" default="Email" /></span>
              <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${studentInstance}" field="email"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.dateOfBirth}">
            <li class="fieldcontain">
              <span id="dateOfBirth-label" class="property-label"><g:message code="student.dateOfBirth.label" default="Date Of Birth" /></span>
              <span class="property-value"
              aria-labelledby="dateOfBirth-label"><g:formatDate format="dd/MM/yyyy" date="${studentInstance?.dateOfBirth}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.placeOfBirth}">
            <li class="fieldcontain">
              <span id="placeOfBirth-label" class="property-label"><g:message code="student.placeOfBirth.label" default="Place Of Birth" /></span>
              <span class="property-value" aria-labelledby="placeOfBirth-label"><g:fieldValue bean="${studentInstance}" field="placeOfBirth"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.legalResidence}">
            <li class="fieldcontain">
              <span id="legalResidence-label" class="property-label"><g:message code="student.legalResidence.label" default="Legal Residence" /></span>
              <span class="property-value" aria-labelledby="legalResidence-label"><g:fieldValue bean="${studentInstance}" field="legalResidence"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.currentDomicile}">
            <li class="fieldcontain">
              <span id="currentDomicile-label" class="property-label"><g:message code="student.currentDomicile.label" default="Current Domicile" /></span>
              <span class="property-value" aria-labelledby="currentDomicile-label"><g:fieldValue bean="${studentInstance}" field="currentDomicile"/></span>
            </li>
          </g:if>
        </div>
      </div>

      <g:if test="${studentInstance?.courseEnrollments}">
        <div class="row-fluid">
          <div class="span12">
            <hr/>
            <h6><g:message code="student.courseEnrollments.label" default="Course Enrollments" /></h6>
            <table class="table table-striped">
              <thead>
                <tr>
                  <g:sortableColumn property="courseName" title="${message(code: 'course.courseName.label', default: 'Course Name')}" />
                  <g:sortableColumn property="dateEnrollment" title="${message(code: 'courseEnrollment.dateEnrollment', default: 'Date of Enrollment')}" />
                </tr>
              </thead>
              <tbody>
                <g:each in="${studentInstance.courseEnrollments}" var="c">
                  <tr>
                    <td>${c?.course.courseName?.encodeAsHTML()}</td>
                    <td>${c.enrolledAt.encodeAsHTML()}</td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
        </div>
      </g:if>

      <hr/>

      <div class="row-fluid">
        <div class="span5">
          <h6><g:message code="student.show.phdinfo"/></h6>

          <g:if test="${studentInstance?.phdCycle}">
            <li class="fieldcontain">
              <span id="phdCycle-label" class="property-label"><g:message code="student.phdCycle.label" default="Phd Cycle" /></span>
              <span class="property-value" aria-labelledby="phdCycle-label"><g:fieldValue bean="${studentInstance}" field="phdCycle"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.courseYear}">
            <li class="fieldcontain">
              <span id="courseYear-label" class="property-label"><g:message code="student.courseYear.label" default="Course Year" /></span>
              <span class="property-value" aria-labelledby="courseYear-label">
                <g:formatNumber number="${studentInstance.courseYear}" />
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.currentAdvisor}">
            <li class="fieldcontain">
              <span id="currentAdvisor-label" class="property-label">
                <g:message code="student.currentAdvisor.label" default="Current Advisor" />
              </span>
              <span class="property-value" aria-labelledby="currentAdvisor-label">
                <g:link controller="supervisor" action="show" id="${studentInstance?.currentAdvisor?.id}">
                  ${studentInstance?.currentAdvisor?.firstName?.encodeAsHTML()}
                  ${studentInstance?.currentAdvisor?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.deleted}">
            <li class="fieldcontain">
              <span id="deleted-label" class="property-label"><g:message code="student.deleted.label" default="Deleted" /></span>
              <span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${studentInstance?.deleted}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.hasPcRights}">
            <li class="fieldcontain">
              <span id="hasPcRights-label" class="property-label"><g:message code="student.hasPcRights.label" default="Has Pc Rights" /></span>
              <span class="property-value" aria-labelledby="hasPcRights-label"><g:formatBoolean boolean="${studentInstance?.hasPcRights}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.isGraduated}">
            <li class="fieldcontain">
              <span id="isGraduated-label" class="property-label"><g:message code="student.isGraduated.label" default="Is Graduated" /></span>
              <span class="property-value" aria-labelledby="isGraduated-label"><g:formatBoolean boolean="${studentInstance?.isGraduated}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.isSuspended}">
            <li class="fieldcontain">
              <span id="isSuspended-label" class="property-label"><g:message code="student.isSuspended.label" default="Is Suspended" /></span>
              <span class="property-value" aria-labelledby="isSuspended-label"><g:formatBoolean boolean="${studentInstance?.isSuspended}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.admittedConditionally}">
            <li class="fieldcontain">
              <span id="admittedConditionally-label" class="property-label"><g:message code="student.admittedConditionally.label" default="Admitted Conditionally" /></span>
              <span class="property-value" aria-labelledby="admittedConditionally-label"><g:formatBoolean boolean="${studentInstance?.admittedConditionally}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.months}">
            <li class="fieldcontain">
              <span id="months-label" class="property-label"><g:message code="student.months.label" default="Months" /></span>
              <span class="property-value" aria-labelledby="months-label"><g:fieldValue bean="${studentInstance}" field="months"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.personalFundsAvailable}">
            <li class="fieldcontain">
              <span id="personalFundsAvailable-label" class="property-label"><g:message code="student.personalFundsAvailable.label" default="Personal Funds Available" /></span>
              <span class="property-value" aria-labelledby="personalFundsAvailable-label"><g:fieldValue bean="${studentInstance}" field="personalFundsAvailable"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.tutor}">
            <li class="fieldcontain">
              <span id="tutor-label" class="property-label"><g:message code="student.tutor.label" default="Tutor" /></span>
              <span class="property-value" aria-labelledby="tutor-label">
                <g:link controller="supervisor" action="show" id="${studentInstance?.tutor?.id}">
                  ${studentInstance?.tutor?.firstName?.encodeAsHTML()}
                  ${studentInstance?.tutor?.lastName?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.phdScholarship}">
            <li class="fieldcontain">
              <span id="phdScholarship-label" class="property-label"><g:message code="student.phdScholarship.label" default="Phd Scholarship" /></span>
              <span class="property-value" aria-labelledby="phdScholarship-label"><g:formatBoolean boolean="${studentInstance?.phdScholarship}" /></span>
            </li>
          </g:if>
        </div>

        <div class="span7">
          <h6><g:message code="student.show.pre_phd_info"/></h6>
          <g:if test="${studentInstance?.scholarshipType}">
            <li class="fieldcontain">
              <span id="scholarshipType-label" class="property-label"><g:message code="student.scholarshipType.label" default="Scholarship Type" /></span>
              <span class="property-value" aria-labelledby="scholarshipType-label"><g:fieldValue bean="${studentInstance}" field="scholarshipType"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.preDoctoralScholarship}">
            <li class="fieldcontain">
              <span id="preDoctoralScholarship-label" class="property-label"><g:message code="student.preDoctoralScholarship.label" default="Pre Doctoral Scholarship" /></span>
              <span class="property-value" aria-labelledby="preDoctoralScholarship-label"><g:fieldValue bean="${studentInstance}" field="preDoctoralScholarship"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.monthsPredocScholarship}">
            <li class="fieldcontain">
              <span id="monthsPredocScholarship-label" class="property-label"><g:message code="student.monthsPredocScholarship.label" default="Months Predoc Scholarship" /></span>
              <span class="property-value" aria-labelledby="monthsPredocScholarship-label"><g:fieldValue bean="${studentInstance}" field="monthsPredocScholarship"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.yearExtensionScholarship}">
            <li class="fieldcontain">
              <span id="yearExtensionScholarship-label" class="property-label"><g:message code="student.yearExtensionScholarship.label" default="Year Extension Scholarship" /></span>
              <span class="property-value" aria-labelledby="yearExtensionScholarship-label"><g:fieldValue bean="${studentInstance}" field="yearExtensionScholarship"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.graduationDate}">
            <li class="fieldcontain">
              <span id="graduationDate-label" class="property-label"><g:message code="student.graduationDate.label" default="Graduation Date" /></span>
              <span class="property-value"
              aria-labelledby="graduationDate-label"><g:formatDate format="dd/MM/yyyy" date="${studentInstance?.graduationDate}" /></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.commiteeMembers}">
            <li class="fieldcontain">
              <span id="commiteeMembers-label" class="property-label"><g:message code="student.commiteeMembers.label" default="Commitee Members" /></span>
              <span class="property-value" aria-labelledby="commiteeMembers-label"><g:fieldValue bean="${studentInstance}" field="commiteeMembers"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.countryOfProvenance}">
            <li class="fieldcontain">
              <span id="countryOfProvenance-label" class="property-label"><g:message code="student.countryOfProvenance.label" default="Country Of Provenance" /></span>
              <span class="property-value" aria-labelledby="countryOfProvenance-label">
                <g:link controller="country" action="show" id="${studentInstance?.countryOfProvenance?.id}">
                  ${studentInstance?.countryOfProvenance?.name?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.universityOfProvenance}">
            <li class="fieldcontain">
              <span id="universityOfProvenance-label" class="property-label"><g:message code="student.universityOfProvenance.label" default="University Of Provenance" /></span>
              <span class="property-value" aria-labelledby="universityOfProvenance-label">
                <g:link controller="university" action="show" id="${studentInstance?.universityOfProvenance?.id}">
                  ${studentInstance?.universityOfProvenance?.nameUniversity?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
        </div>
      </div>

      <hr/>

      <div class="row-fluid">
        <div class="span12">
          <h6><g:message code="student.show.otherinfo"/></h6>
          <g:if test="${studentInstance?.fullName}">
            <li class="fieldcontain">
              <span id="fullName-label" class="property-label"><g:message code="student.fullName.label" default="Full Name" /></span>
              <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${studentInstance}" field="fullName"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.officePhone}">
            <li class="fieldcontain">
              <span id="officePhone-label" class="property-label"><g:message code="student.officePhone.label" default="Office Phone" /></span>
              <span class="property-value" aria-labelledby="officePhone-label"><g:fieldValue bean="${studentInstance}" field="officePhone"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.officeWorkingPlace}">
            <li class="fieldcontain">
              <span id="officeWorkingPlace-label" class="property-label">
                <g:message code="student.officeWorkingPlace.label" default="Office Working Place" />
              </span>
              <span class="property-value" aria-labelledby="officeWorkingPlace-label"><g:fieldValue bean="${studentInstance}" field="officeWorkingPlace"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.lockerNumber}">
            <li class="fieldcontain">
              <span id="lockerNumber-label" class="property-label">
                <g:message code="student.lockerNumber.label" default="Locker Number" />
              </span>
              <span class="property-value" aria-labelledby="lockerNumber-label">
                <g:fieldValue bean="${studentInstance}" field="lockerNumber"/>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.university}">
            <li class="fieldcontain">
              <span id="university-label" class="property-label">
                <g:message code="student.university.label" default="University" />
              </span>
              <span class="property-value" aria-labelledby="university-label">
                <g:link controller="university" action="show" id="${studentInstance?.university?.id}">
                  ${studentInstance?.university?.nameUniversity?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.citizenship}">
            <li class="fieldcontain">
              <span id="citizenship-label" class="property-label">
                <g:message code="student.citizenship.label" default="Citizenship" />
              </span>
              <span class="property-value" aria-labelledby="citizenship-label">
                <g:link controller="country" action="show" id="${studentInstance?.citizenship?.id}">
                  ${studentInstance?.citizenship?.citizenship?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.italianTaxpayerCode}">
            <li class="fieldcontain">
              <span id="italianTaxpayerCode-label" class="property-label"><g:message code="student.italianTaxpayerCode.label" default="Italian Taxpayer Code" /></span>
              <span class="property-value" aria-labelledby="italianTaxpayerCode-label"><g:fieldValue bean="${studentInstance}" field="italianTaxpayerCode"/></span>
            </li>
          </g:if>

          <g:if test="${studentInstance?.yearlyFeeToCenter}">
            <li class="fieldcontain">
              <span id="yearlyFeeToCenter-label" class="property-label"><g:message code="student.yearlyFeeToCenter.label" default="Yearly Fee To Center" /></span>
              <span class="property-value" aria-labelledby="yearlyFeeToCenter-label"><g:fieldValue bean="${studentInstance}" field="yearlyFeeToCenter"/></span>
            </li>
          </g:if>
          <g:if test="${studentInstance?.yearlyFeeToSchool}">
            <li class="fieldcontain">
              <span id="yearlyFeeToSchool-label" class="property-label"><g:message code="student.yearlyFeeToSchool.label" default="Yearly Fee To School" /></span>
              <span class="property-value" aria-labelledby="yearlyFeeToSchool-label"><g:fieldValue bean="${studentInstance}" field="yearlyFeeToSchool"/></span>
            </li>
          </g:if>
        </div>
      </div>
    </ol>

    <g:if test="${session.isAdmin}">
      <g:form>
        <div class="form-actions">
          <g:hiddenField name="id" value="${studentInstance?.id}" />

          <g:link class="btn btn-primary" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="btn btn-danger" action="delete"
            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </div>
      </g:form>
    </g:if>
  </content>
</g:applyLayout>
