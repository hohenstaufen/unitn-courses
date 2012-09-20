<%@ page import="courses.Student" %>
<div class="row-fluid">
  <div class="span6">
    <img width="330" src="${resource(dir: 'images/courses/student', file: 'no_image.gif')}" alt="No Image"/>
  </div>
  <div class="span6">
    <h6><g:message code="student.show.main_info"/></h6><br/>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'firstName', 'error')}">
      <label class="control-label" for="firstName"><g:message code="student.firstName.label" default="First Name" /></label>
      <div class="controls">
        <g:textField name="firstName" maxlength="120" value="${studentInstance?.firstName}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'lastName', 'error')}">
      <label class="control-label" for="lastName"><g:message code="student.lastName.label" default="Last Name" /></label>
      <div class="controls">
        <g:textField name="lastName" maxlength="120" value="${studentInstance?.lastName}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'mobilePhone', 'error')}">
      <label class="control-label" for="mobilePhone"><g:message code="student.mobilePhone.label" default="Mobile Phone" /></label>
      <div class="controls">
        <g:textField name="mobilePhone" maxlength="100" value="${studentInstance?.mobilePhone}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'email', 'error')}">
      <label class="control-label" for="email"><g:message code="student.email.label" default="Email" /></label>
      <div class="controls">
        <g:textField name="email" maxlength="200" value="${studentInstance?.email}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'dateOfBirth', 'error')}">
      <label class="control-label" for="dateOfBirth">
        <g:message code="student.dateOfBirth.label" default="Date Of Birth" />
      </label>
      <div class="controls">
        <g:datePicker name="dateOfBirth" precision="day"  value="${studentInstance?.dateOfBirth}" default="none" noSelection="['': '']" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'placeOfBirth', 'error')}">
      <label class="control-label" for="placeOfBirth"><g:message code="student.placeOfBirth.label" default="Place Of Birth" /></label>
      <div class="controls">
        <g:textField name="placeOfBirth" maxlength="120" value="${studentInstance?.placeOfBirth}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'legalResidence', 'error')}">
      <label class="control-label" for="legalResidence"><g:message code="student.legalResidence.label" default="Legal Residence" /></label>
      <div class="controls">
        <g:textField name="legalResidence" maxlength="120" value="${studentInstance?.legalResidence}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'currentDomicile', 'error')}">
      <label class="control-label" for="currentDomicile"><g:message code="student.currentDomicile.label" default="Current Domicile" /></label>
      <div class="controls">
        <g:textField name="currentDomicile" maxlength="120" value="${studentInstance?.currentDomicile}"/>
      </div>
    </div>
  </div>
</div>
<hr/>
<div class="row-fluid">
  <div class="span6">
    <h6><g:message code="student.show.phdinfo"/></h6>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'phdCycle', 'error')} ">
      <label class="control-label" for="phdCycle"><g:message code="student.phdCycle.label" default="Phd Cycle" /></label>
      <div class="controls">
        <g:textField name="phdCycle" maxlength="10" value="${studentInstance?.phdCycle}"/>
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'courseYear', 'error')} required">
      <label class="control-label" for="courseYear"><g:message code="student.courseYear.label" default="Course Year" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:field type="number" name="courseYear" required="" value="${studentInstance.courseYear}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'currentAdvisor', 'error')} required">
      <label class="control-label" for="currentAdvisor"><g:message code="student.currentAdvisor.label" default="Current Advisor" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="currentAdvisor" name="currentAdvisor.id" from="${courses.Supervisor.list()}"
                  optionKey="id" required="" value="${studentInstance?.currentAdvisor?.id}"
                  class="many-to-one" optionValue="${{it.firstName + ' ' + it.lastName}}" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'hasPcRights', 'error')} ">
      <label class="control-label" for="hasPcRights"><g:message code="student.hasPcRights.label" default="Has Pc Rights" /></label>
      <div class="controls">
        <g:checkBox name="hasPcRights" value="${studentInstance?.hasPcRights}" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'isGraduated', 'error')} ">
      <label class="control-label" for="isGraduated"><g:message code="student.isGraduated.label" default="Is Graduated" /></label>
      <div class="controls">
        <g:checkBox name="isGraduated" value="${studentInstance?.isGraduated}" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'isSuspended', 'error')} ">
      <label class="control-label" for="isSuspended"><g:message code="student.isSuspended.label" default="Is Suspended" /></label>
      <div class="controls">
        <g:checkBox name="isSuspended" value="${studentInstance?.isSuspended}" />
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'admittedConditionally', 'error')} ">
      <label class="control-label" for="admittedConditionally"><g:message code="student.admittedConditionally.label" default="Admitted Conditionally" /></label>
      <div class="controls">
        <g:checkBox name="admittedConditionally" value="${studentInstance?.admittedConditionally}" />
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'months', 'error')} required">
      <label class="control-label" for="months"><g:message code="student.months.label" default="Months" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:field type="number" name="months" required="" value="${fieldValue(bean: studentInstance, field: 'months')}"/>
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'personalFundsAvailable', 'error')} required">
      <label class="control-label" for="personalFundsAvailable"><g:message code="student.personalFundsAvailable.label" default="Available Funds " /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:field type="number" name="personalFundsAvailable" required="" value="${fieldValue(bean: studentInstance, field: 'personalFundsAvailable')}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'tutor', 'error')} required">
      <label class="control-label" for="tutor"><g:message code="student.tutor.label" default="Tutor" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="tutor" name="tutor.id" from="${courses.Supervisor.list()}" optionKey="id"
                  required="" value="${studentInstance?.tutor?.id}" class="many-to-one"
                  optionValue="${{it.firstName + ' ' + it.lastName}}" />
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'phdScholarship', 'error')} ">
      <label class="control-label" for="phdScholarship"><g:message code="student.phdScholarship.label" default="Phd Scholarship" /></label>
      <div class="controls">
        <g:checkBox name="phdScholarship" value="${studentInstance?.phdScholarship}" />
      </div>
    </div>
  </div>
  <div class="span6">
    <h6><g:message code="student.show.pre_phd_info"/></h6>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'scholarshipType', 'error')} ">
      <label class="control-label" for="scholarshipType"><g:message code="student.scholarshipType.label" default="Scholarship Type" /></label>
      <div class="controls">
        <g:textField name="scholarshipType" maxlength="120" value="${studentInstance?.scholarshipType}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'preDoctoralScholarship', 'error')} ">
      <label class="control-label" for="preDoctoralScholarship"><g:message code="student.preDoctoralScholarship.label" default="Pre Doctoral Scholarship" /></label>
      <div class="controls">
        <g:textField name="preDoctoralScholarship" maxlength="120" value="${studentInstance?.preDoctoralScholarship}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'monthsPredocScholarship', 'error')} required">
      <label class="control-label" for="monthsPredocScholarship"><g:message code="student.monthsPredocScholarship.label" default="Months Scholarship" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:field type="number" name="monthsPredocScholarship" required="" value="${fieldValue(bean: studentInstance, field: 'monthsPredocScholarship')}"/>
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'yearExtensionScholarship', 'error')} ">
      <label class="control-label" for="yearExtensionScholarship"><g:message code="student.yearExtensionScholarship.label" default="Year Extension Scholarship" /></label>
      <div class="controls">
        <g:textField name="yearExtensionScholarship" maxlength="100" value="${studentInstance?.yearExtensionScholarship}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'graduationDate', 'error')} ">
      <label class="control-label" for="graduationDate"><g:message code="student.graduationDate.label" default="Graduation Date" /></label>
      <div class="controls">
        <g:datePicker name="graduationDate" precision="day"  value="${studentInstance?.graduationDate}" default="none" noSelection="['': '']" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'commiteeMembers', 'error')} ">
      <label class="control-label" for="commiteeMembers"><g:message code="student.commiteeMembers.label" default="Commitee Members" /></label>
      <div class="controls">
        <g:textField name="commiteeMembers" maxlength="20" value="${studentInstance?.commiteeMembers}"/>
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'countryOfProvenance', 'error')} required">
      <label class="control-label" for="countryOfProvenance"><g:message code="student.countryOfProvenance.label" default="Provenance Country" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="countryOfProvenance" name="countryOfProvenance.id" from="${courses.Country.list()}"
                  optionKey="id" required="" value="${studentInstance?.countryOfProvenance?.id}"
                  class="many-to-one" optionValue="${{it.name + ' - ' + it.region}}" />
      </div>
    </div>

    <!--
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'courseEnrollments', 'error')} ">
      <label class="control-label" for="courseEnrollments"><g:message code="student.courseEnrollments.label" default="Course Enrollments" /></label>
      <div class="controls">
        <ul class="one-to-many">
          <g:each in="${studentInstance?.courseEnrollments?}" var="c">
            <li>
              <g:link controller="courseEnrollment" action="show" id="${c.id}">
                ${c?.encodeAsHTML()}
              </g:link>
            </li>
          </g:each>
          <li class="add"><g:link controller="courseEnrollment" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'courseEnrollment.label', default: 'CourseEnrollment')])}</g:link></li>
        </ul>
      </div>
    </div>
     -->

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'universityOfProvenance', 'error')} required">
      <label class="control-label" for="universityOfProvenance"><g:message code="student.universityOfProvenance.label" default="Provenance University" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="universityOfProvenance" name="universityOfProvenance.id" from="${courses.University.list()}"
                  optionKey="id" required="" value="${studentInstance?.universityOfProvenance?.id}"
                  optionValue="nameUniversity" class="many-to-one"/>
      </div>
    </div>
  </div>
</div>

<hr/>

<div class="row-fluid">
  <div class="span12">
    <h6><g:message code="student.show.otherinfo"/></h6>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'fullName', 'error')} ">
      <label class="control-label" for="fullName"><g:message code="student.fullName.label" default="Full Name" /> </label>
      <div class="controls">
        <g:textField name="fullName" maxlength="120" value="${studentInstance?.fullName}"/>
      </div>
    </div>
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'officePhone', 'error')} ">
      <label class="control-label" for="officePhone"><g:message code="student.officePhone.label" default="Office Phone" /></label>
      <div class="controls">
        <g:textField name="officePhone" maxlength="100" value="${studentInstance?.officePhone}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'officeWorkingPlace', 'error')} ">
      <label class="control-label" for="officeWorkingPlace"><g:message code="student.officeWorkingPlace.label" default="Office Working Place" /></label>
      <div class="controls">
        <g:textField name="officeWorkingPlace" maxlength="200" value="${studentInstance?.officeWorkingPlace}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'lockerNumber', 'error')} ">
      <label class="control-label" for="lockerNumber"><g:message code="student.lockerNumber.label" default="Locker Number" /></label>
      <div class="controls">
        <g:textField name="lockerNumber" maxlength="60" value="${studentInstance?.lockerNumber}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'italianTaxpayerCode', 'error')} ">
      <label class="control-label" for="italianTaxpayerCode"><g:message code="student.italianTaxpayerCode.label" default="Italian Taxpayer Code" /></label>
      <div class="controls">
        <g:field type="number" name="italianTaxpayerCode" value="${fieldValue(bean: studentInstance, field: 'italianTaxpayerCode')}"/>
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'citizenship', 'error')} required">
      <label class="control-label" for="citizenship"><g:message code="student.citizenship.label" default="Citizenship" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="citizenship" name="citizenship.id" from="${courses.Country.list()}" optionKey="id"
                  required="" value="${studentInstance?.citizenship?.id}" class="many-to-one"
                  optionValue="${{it.name + ' - ' + it.region}}" />
      </div>
    </div>

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'university', 'error')} required">
      <label class="control-label" for="university"><g:message code="student.university.label" default="University" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:select id="university" name="university.id" from="${courses.University.list()}" optionKey="id"
                  required="" value="${studentInstance?.university?.id}" class="many-to-one"
                  optionValue="nameUniversity" />
      </div>
    </div>

    <!--
    <div class="control-group ${hasErrors(bean: studentInstance, field: 'userCredentials', 'error')} ">
      <label class="control-label" for="userCredentials"><g:message code="student.userCredentials.label" default="User Credentials" /></label>
      <div class="controls">
        <ul class="one-to-many">
          <g:each in="${studentInstance?.userCredentials?}" var="u">
            <li>
              <g:link controller="userCredential" action="show" id="${u.id}">
                ${u?.encodeAsHTML()}
              </g:link>
            </li>
          </g:each>
          <li class="add"><g:link controller="userCredential" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userCredential.label', default: 'UserCredential')])}</g:link></li>
        </ul>
      </div>
    </div>
     -->

    <div class="control-group ${hasErrors(bean: studentInstance, field: 'yearlyFeeToCenter', 'error')} required">
      <label class="control-label" for="yearlyFeeToCenter"><g:message code="student.yearlyFeeToCenter.label" default="Yearly Fee To Center" /><span class="required-indicator">*</span></label>
      <div class="controls">
        <g:field type="number" name="yearlyFeeToCenter" required="" value="${fieldValue(bean: studentInstance, field: 'yearlyFeeToCenter')}"/>
      </div>
    </div>

   <div class="control-group ${hasErrors(bean: studentInstance, field: 'yearlyFeeToSchool', 'error')} required">
     <label class="control-label" for="yearlyFeeToSchool"><g:message code="student.yearlyFeeToSchool.label" default="Yearly Fee To School" /><span class="required-indicator">*</span></label>
     <div class="controls">
       <g:field type="number" name="yearlyFeeToSchool" required="" value="${fieldValue(bean: studentInstance, field: 'yearlyFeeToSchool')}"/>
     </div>
   </div>
  </div>
</div>
