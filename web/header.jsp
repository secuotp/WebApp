<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

<!-- libraries -->
<link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/layout.css" />
<link rel="stylesheet" type="text/css" href="css/elements.css" />
<link rel="stylesheet" type="text/css" href="css/icons.css" />   

<!-- open sans font -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

<!-- lato font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />

<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<% HttpSession hs = request.getSession();%>
<c:set var='asd' value='<%= hs.getAttribute("status")%>' />

<!-- navbar -->
<c:choose>
    <c:when test='${login == "ok"}'>

        <div class="navbar navbar-inverse">
            <div class="navbar-inner">
                <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="brand" href="index.jsp">Secu OTP</a>

                <ul class="nav pull-right">                
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                            Hello, ${name}
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="personal-info.jsp">Account Settings</a></li>
                            <li><a href="Logout">Log Out</a></li>
                        </ul>
                    </li>
                </ul>            
            </div>
        </div>

    </c:when>
    <c:otherwise>
        <div class="navbar navbar-inverse">
            <div class="navbar-inner">
                <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="brand" href="index.jsp">Secu OTP</a>

                <ul class="nav pull-right">                
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                            Hello, Guest
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/login.jsp">Log In</a></li>
                        </ul>
                    </li>
                </ul>            
            </div>
        </div>
    </c:otherwise>
</c:choose>
<!-- end navbar -->

<!-- sidebar -->
<div id="sidebar-nav">
    <c:choose>
        <c:when test='${login == "ok"}'>
            <ul id="dashboard-menu">
                <li>                
                    <a href="index.jsp">
                        <i class="icon-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a class="dropdown-toggle" href="#">
                        <i class="icon-group"></i>
                        <span>My Sites</span>
                        <i class="icon-chevron-down"></i>
                    </a>
                    <ul class="submenu">
                        <li><a href="user-profile.jsp">SIT</a></li>
                        <li><a href="new-user.jsp">New Sites..</a></li>
                    </ul>
                </li>
                 <li>                
                    <a href="emergency.jsp">
                        <i class="icon-envelope"></i>
                        <span>Emergency</span>
                    </a>
                </li>
                <li>
                    <div>
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <a href="personal-info.jsp">
                        <i class="icon-cog"></i>
                        <span>My Info.</span>
                    </a>
                </li>
            </ul>
        </c:when>
        <c:otherwise>
            <ul id="dashboard-menu">
                <li>
                    <div>
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <a href="login.jsp">
                        <i class="icon-key"></i>
                        <span>Log In</span>
                    </a>
                </li>
                <li>
                    <div>
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <a href="register.jsp">
                        <i class="icon-plus"></i>
                        <span>Sign Up</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<!-- end sidebar -->