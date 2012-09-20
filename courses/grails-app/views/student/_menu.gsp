<%@ page contentType="text/html;charset=ISO-8859-1" %>
<script type="text/javascript">
  $(document).ready(function(){
    $("#AddCredential_Button").click(function(){
      // TODO: remove hardcoded urls
      $("#AddCredential_Body").load("../../userCredential/edit/${studentCredentials.id}");
    });
    $("#CourseEnrollment_Button").click(function(){
      // TODO: remove harcoded urls
      $("#CourseEnrollment_Body").load("../../courseEnrollment/create/?student_id=${studentInstance.id}");
    });

    $(document).on('submit', "#UserCredential_Form", function(){
      var data = $(this).serialize();
      $.post($(this).attr("action"),data,function(){
        $("#UserCredential_Close").trigger("click");
      });
      return false;
    });

    $(document).on('submit', "#CourseEnrollment_Form", function(){
      var data = $(this).serialize();
      $.post($(this).attr("action"), data, function() {
        if (data.result === 'success') {
          $("#CourseEnrollment_Close").trigger("click");
          location.reload();
        }
        else {
          $(".alert").fadeIn("slow");
        }
      });
      return false;
    });
  });
</script>

<g:link action='create' class="btn btn-success">
  <i class="icon-plus-sign icon-white"></i>
  <g:message code="student.nav.new" args="[entityName]"/>
</g:link>

<div id="AddCredential_Modal" class="modal hide fade">
  <div class="modal-header">
    <button id="UserCredential_Close" class="close" data-dismiss="modal">×</button>
    <h3>Edit Credentials</h3>
  </div>

  <div class="modal-body" id="AddCredential_Body">
    <div class="img-loading">
      <img src="<g:resource dir="images/courses" file="loading-spiral.gif"/>"/>
    </div>
  </div>

  <div class="modal-footer">
    <a href="#" class="btn" data-dismiss="modal">Close</a>
  </div>
</div>

<button id="AddCredential_Button" class="btn btn-info" data-toggle="modal" href="#AddCredential_Modal">
  <i class=" icon-plus-sign icon-white"></i>
  <g:message code="student.edit.editcredential" default="Edit user credentials"/>
</button>

<div id="CourseEnrollment_Modal" class="modal hide fade">
  <div class="modal-header">
    <button id="CourseEnrollment_Close" class="close" data-dismiss="modal">×</button>
    <h3>Course Enrollment</h3>
  </div>
  <div class="modal-body" id="CourseEnrollment_Body">
    <div class="img-loading">
      <img src="<g:resource dir="images/courses" file="loading-spiral.gif"/>"/>
    </div>
  </div>
  <div class="modal-footer"><a href="#" class="btn" data-dismiss="modal">Close</a></div>
</div>

<button id="CourseEnrollment_Button" class="btn btn-info" data-toggle="modal" href="#CourseEnrollment_Modal">
  <i class=" icon-plus-sign icon-white"></i>
  <g:message code="student.edit.addCourseEnrollment" default="Add Course Enrollment"/>
</button>

<hr/>
