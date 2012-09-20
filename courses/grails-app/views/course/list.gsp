<g:applyLayout name="base">

  <content tag="container">
    <g:link action='create'>
      <button class="btn btn-success">
        <i class="icon-plus-sign icon-white"></i>
        <g:message code="course.list.new" default="New Course" />
      </button>
    </g:link>
    <hr/>

    <g:render template="list" />
    <script type="text/javascript">
      menu_active("#menu_courses");
    </script>
  </content>

</g:applyLayout>
