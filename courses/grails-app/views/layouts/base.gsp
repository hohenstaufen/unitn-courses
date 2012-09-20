<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="layout" content="page"/>
    <title><g:pageProperty name="page.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <r:require modules="bootstrap"/>
    <r:require modules="bootstrap-modal"/>

    <g:javascript library="jquery"/>
    <g:javascript src="courses.js" />

    <resource:richTextEditor />

    <r:layoutResources/>

    <!-- Le styles -->
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- COMPASS -->
    <link href="${resource(dir: 'css/sass', file: 'screen.css')}" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css/sass', file: 'print.css')}" media="screen, projection" rel="stylesheet" type="text/css" />

    <style>
       @font-face { font-family: Lobster2; src: url('${resource(dir: 'fonts/lobster-two', file: 'LobsterTwo-Regular.otf')}'); }
    </style>

    <!--[if IE]>
      <link href="${resource(dir: 'css/sass', file: 'ie.css')}" media="screen, projection" rel="stylesheet" type="text/css" />
    <![endif]-->

    <g:layoutHead/>

  </head>

  <body>

    <g:render template="/layouts/navbar"/>

    <div class="container-fluid">
      <div class="row-fluid">

        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">

              <g:render template="/layouts/menubar"/>

            </ul>
          </div>

        </div><!--/span-->

        <div class="span9">

          <g:pageProperty name="page.container"/>

        </div><!--/span-->
      </div><!--/row-->

      <hr>
      <g:render template="/layouts/footer"/>

    </div><!--/.fluid-container-->
  </body>
</html>

<r:layoutResources disposition="defer"/>
