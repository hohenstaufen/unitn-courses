<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="#"><g:message code="navbar.header" default="Courses Management"/></a>
      <div class="nav-collapse">
        <ul class="nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#contact">Team</a></li>
        </ul>

        <ul class="nav pull-right">
          <li><a id="i18n-en" href=".?lang=en">EN</a></li>
          <li><a id="i18n-it" href=".?lang=it">IT</a></li>
          <li class="dropdown" id="menu1">
            <g:if test="${!session.user}">
              <a id="login" class="dropdown-toggle" data-toggle="dropdown" href="#menu1">
                Login
                <b class="caret"></b>
              </a>
              <div class="dropdown-menu">
                <br/>
                <input id="email" type="text" placeholder="email" />
                <input id="password" type="password" placeholder="password" />
                <div class='btn btn-primary'>Login</div>
                <div><a href="#"><g:message code="default.index.navbar" default="Forgot your password?"/></a></div>
              </div>
            </g:if>
            <g:else>
              <g:link url="[action: 'logout', controller: 'userCredential']">
                Logout
              </g:link>
            </g:else>
          </li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
