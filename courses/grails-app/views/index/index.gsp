<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title><g:message code="index.title" default="Courses Management"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <r:require modules="bootstrap"/>
    <g:javascript library="jquery"/>
    <r:layoutResources/>

    <script type="text/javascript">
      $(document).ready(function(){
        $('#login').dropdown();
      });

    </script>

    <!-- COMPASS -->
    <link href="${resource(dir: 'css/sass', file: 'screen.css')}" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css/sass', file: 'print.css')}" media="screen, projection" rel="stylesheet" type="text/css" />

    <style>
       @font-face { font-family: Lobster2; src: url('${resource(dir: 'fonts/lobster-two', file: 'LobsterTwo-Regular.otf')}'); }
    </style>

    <!--[if IE]>
      <link href="${resource(dir: 'css/sass', file: 'ie.css')}" media="screen, projection" rel="stylesheet" type="text/css" />
    <![endif]-->
  </head>
  <body>
    <g:render template="/layouts/navbar"/>
    <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

      <div class="hero-unit">
        <div class="logo">
            <!--
            <img alt="logo" src="$#{resource(dir: 'images/courses', file: 'logo.png')}" />
            -->
        </div>
        <div class="left">
          <h1><g:message code="index.title" default="Courses Management"/></h1>
          <br/>
          <p class="tagline">
            <g:message code="index.description" default="This is the project for courses management of DEViati team"/>
          </p>
        </div>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2><g:message code="index.school" default="PhD School"/></h2>
           <p><g:message code="index.phd.description" default="The ICT International Doctoral School was founded in 2001 with its main goal to create experts in Information and Communication Technologies. Currently every admission call brings in requests from each and every continent."/></p>
          <p><a class="btn" href="http://ict.unitn.it/"><g:message code="index.goto.button" default="Go to website"/> &raquo;</a></p>
        </div>
        <div class="span4">
          <h2><g:message code="admin.menu.courses" default="Courses"/></h2>
          <p><g:message code="index.courses.description_part1" default="You can find a list of the courses available in the Manifesto Studiorum "/>(<a href="http://static.digns.com/uploads/doctoral_school/documents/regulations/manifesto_2011_12.pdf">pdf</a>). <g:message code="index.courses.description_part2" default="Characteristics, course objectives, contents, prerequisites, programmes and lectures schedule of the Doctoral Courses may be found here: "/><a href="http://ict.unitn.it/program/exams/courses?year=2012"><g:message code="index.courses.description_part3"default="Doctoral Courses"/></a></p>
          <p><a class="btn" href="http://ict.unitn.it/program"><g:message code="index.view.button" default="View details"/> &raquo;</a></p>
        </div>
        <div class="span4">
          <h2>Login</h2>
          <p><g:link url="[action:'login_student',controller:'userCredential']" class="btn btn-info"><g:message code="index.student.login" default="Student Login"/></g:link></p>
          <p><g:link url="[action:'login_supervisor',controller:'userCredential']" class="btn btn-success"><g:message code="index.prof.login" default="Professor Login"/></g:link></p>
          <p><g:link url="[action:'login_admin',controller:'userCredential']" class="btn btn-warning"><g:message code="index.admin.login" default="Admin Login"/></g:link></p>
        </div>
      </div>

      <hr/>

    <g:render template="/layouts/footer"/>

    </div> <!-- /container -->
  </body>
</html>
