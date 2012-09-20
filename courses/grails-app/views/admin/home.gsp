<g:applyLayout name="base">
  <content tag="container">
    
  
    <script type="text/javascript">
      menu_active("#menu_home");
    </script>
    
    <div class="row-fluid">
      <div class="span7">
        <div class="well">
          <h6><g:message code="admin.home.stats_panel"default="Stats Panel" /></h6>
          <br/>
          <ul class="nav nav-tabs" id="myTab">
            <li><a href="#Courses" data-toggle="tab"><g:message code="admin.home.navbar_courses" default="Courses"/></a></li>
            <li><a href="#Students" data-toggle="tab"><g:message code="admin.home.navbar_students" default="Students"/></a></li>
            <li><a href="#Supervisors" data-toggle="tab"><g:message code="admin.home.navbar_supervisors" default="Supervisors"/></a></li>
          </ul>
          
          <div class="tab-content">
            <div class="tab-pane" id="Courses">
               <div>
                 <strong><g:message code="admin.home.num_courses" default="Number of Courses:"/></strong> 
                 ${num_courses}
               </div>
               <div>
                 <strong><g:message code="admin.home.courses_isPaymentCompleted" default="Number of Courses Completely Paid:"/></strong> 
                 ${num_courses_paid}
               </div>
               <div>
                 <strong><g:message code="admin.home.courses_byUnitn" default="Number of Courses by Unitn:"/></strong> 
                 ${num_courses_byUnitn}
               </div>
               <br/>
               <ul class="nav nav-tabs" id="CoursesTab">
                 <li><a href="#Costs" data-toggle="tab"><g:message code="admin.home.costs" default="Costs"/></a></li>
                 <li><a href="#Enrollments" data-toggle="tab"><g:message code="admin.home.enrollments" default="Enrollments"/></a></li>
               </ul>
               
               <div class="tab-content">
                 <div class="tab-pane active" id="Costs">
                   <div>
                     <h6><g:message code="admin.home.more_expensive_courses" default="The More Expensive Courses"/></h6>
                     <br/>
                     <table class="table table-striped">
                       <thead>
                         <tr>
                           <g:sortableColumn property="courseName" title="${message(code: 'course.courseName.label', default: 'Course Name')}" />
                           <g:sortableColumn property="actualCost" title="${message(code: 'course.actualCost.label', default: 'Actual Cost')}" />
                         </tr>
                       </thead>
                       <tbody>
                         <g:each in="${courses_more_costs}" var="c">
                           <tr>
                             <td>${c?.courseName?.encodeAsHTML()}</td>
                             <td>${c?.actualCost.encodeAsHTML()} $</td>
                           </tr>
                         </g:each>
                      </tbody>
                    </table>            
                   </div>
                 </div>
                 <div class="tab-pane" id="Enrollments">
                   <div>
                     <h6><g:message code="admin.home.more_enrollments_course" default="Courses With More Enrollments"/></h6> 
                     <br/>
                     <table class="table table-striped">
                       <thead>
                         <tr>
                           <g:sortableColumn property="courseName" title="${message(code: 'course.courseName.label', default: 'Course Name')}" />
                           <g:sortableColumn property="num_enrollments" title="${message(code: 'admin.home.num_enrollments', default: 'Number of Enrollments')}" />
                         </tr>
                       </thead>
                       <tbody>
                         <g:each in="${courses_more_enrollments}" var="c">
                           <tr>
                             <td>${c?.courseName?.encodeAsHTML()}</td>
                             <td>${c?.num_enrollments.encodeAsHTML()}</td>
                           </tr>
                         </g:each>
                      </tbody>
                    </table>   
                   </div>
                 </div>
               </div>   
               <script type="text/javascript">
                 $(document).ready(function(){
                   $('#CoursesTab a:first').tab('show');
                 });
          </script>
            </div>
            <div class="tab-pane active" id="Students">
              <div>
                <strong><g:message code="admin.home.num_students" default="Number of Students:"/></strong> 
                ${num_students}
              </div>
              <div>
                <strong><g:message code="admin.home.students_admittedConditionally" default="Number of Students Admitted Conditionally:"/></strong> 
                ${num_students_admittedConditionally}
              </div>
              <div>
                <strong><g:message code="admin.home.students_graduated" default="Number of Students Graduated:"/></strong> 
                ${num_students_graduated}
              </div>
            </div>
            <div class="tab-pane" id="Supervisors">
              <div>
                <strong><g:message code="admin.home.num_supervisors" default="Number of Supervisors:"/></strong> 
                ${num_supervisors}
              </div>
              <div>
                <strong><g:message code="admin.home.num_internal_supervisor" default="Number of Internal Supervisors:"/></strong> 
                ${num_supervisors_internal}
              </div>
              <div>
                <strong><g:message code="admin.home.num_external_supervisor" default="Number of External Supervisors:"/></strong> 
                ${num_supervisors_external}
              </div>
              <div>
                <strong><g:message code="admin.home.num_active_supervisor" default="Number of Active Supervisors:"/></strong> 
                ${num_supervisors_active}
              </div>
              <br/>
              <h6><g:message code="admin.home.supervisor_with_more_courses"
                       default="Supervisor with more courses owned" />
              </h6>
              <br/>
              <table class="table table-striped">
                <thead>
                  <tr>
                    <g:sortableColumn property="firstName" title="${message(code: 'supervisor.firstName.label', default: 'First Name')}" />
                    <g:sortableColumn property="lastName" title="${message(code: 'supervisor.lastName.label', default: 'Last Name')}" />
                    <g:sortableColumn property="num_courses" title="${message(code: 'admin.home.supervisor_courses_owned', default: 'Courses owned')}" />
                  </tr>
                </thead>
                <tbody>
                  <g:each in="${supervisorInstance}" var="s">
                    <tr>
                      <td>${s?.firstName?.encodeAsHTML()}</td>
                      <td>${s?.lastName?.encodeAsHTML()}</td>
                      <td>${s?.num_courses.encodeAsHTML()}</td>
                    </tr>
                  </g:each>
                </tbody>
              </table>        
            </div>
          </div>
          
          <script type="text/javascript">
            $(document).ready(function(){
            	$('#myTab a:first').tab('show');
            })
          </script>
            
        </div>
      </div>
      <div class="span5">
        <div class="alert alert-info">
          <h6><g:message code="admin.home.notification"
                         default="Notification Panel" />
          </h6>
          <br/>        
        
          <div class="accordion" id="accordion2">
            <div class="accordion-group">
              <div class="accordion-heading myhover">             
                <div class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                    <div class="pull-left heading-notify"><g:message code="supervisor.home.marks_notifications"
                                 default="Marks" />
                    </div>
                    <div class="notification pull-left">
                      3
                    </div>
                    <div class="spacer"></div>
                </div>
              </div>
              <div id="collapseOne" class="accordion-body collapse">
                <div class="accordion-inner">
                 <ul class="note-list">
                   <li class="note" data-content="Course A has marks expired...." title="Marks Exipred"><g:message code="admin.home.marks_expired" default="Marks Expired"/></li>
                   <li class="note" data-content="Student A have a wrong mark, ...." title="Wrong Mark"><g:message code="admin.home.wrong_marks" default="Wrong Mark"/></li>
                   <li class="note" data-content="Course C have incorrect marks, please check it.." title="Incorrect Marks"><g:message code="admin.home.incorrect_marks" default="Incorrect Marks"/></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading myhover">
                  <div class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                    <div class="pull-left heading-notify"><g:message code="supervisor.home.payments_notifications"
                               default="Payments" />
                    </div>
                    <div class="notification pull-left">
                      4
                    </div>
                    <div class="spacer"></div>
                  </div>
              </div>
              <div id="collapseTwo" class="accordion-body collapse">
                <div class="accordion-inner">
                  <ul>
                    <li class="note" data-content="Student A need a Payment for" title="Marks Exipred">Notification 1</li>
                    <li class="note">Notification 2</li>
                    <li class="note">Notification 3</li>
                    <li class="note">Notification 4</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading myhover">
                <div class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                  <div class="pull-left heading-notify"><g:message code="student.home.studyplan_notification"
                       default="Study Plan" />
                  </div>             
                  <div class="notification pull-left">
                    2
                  </div>
                  <div class="spacer"></div>
                </div>
              </div>
              <div id="collapseThree" class="accordion-body collapse">
                <div class="accordion-inner">
                  <ul>
                    <li class="note">Notification 1</li>
                    <li class="note">Notification 2</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading myhover">
                <div class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                  <div class="pull-left heading-notify"><g:message code="course.notification"
                       default="Courses" />
                  </div>             
                  <div class="notification pull-left">
                    2
                  </div>
                  <div class="spacer"></div>
                </div>
              </div>
              <div id="collapseFour" class="accordion-body collapse">
                <div class="accordion-inner">
                  <ul>
                    <li class="note">Notification 1</li>
                    <li class="note">Notification 2</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $(document).ready(function(){
    	  $('.note').one("hover", function(){$(this).popover('show')});
      });
    </script>      
  </content>
</g:applyLayout>
