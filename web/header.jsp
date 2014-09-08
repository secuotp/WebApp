<%-- Document : header Created on : Aug 21, 2014, 1:48:24 PM Author : Zenology --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <!-- CSS -->
        <!-- bootstrap -->
        <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
        <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

        <!-- libraries -->
        <link href="css/lib/bootstrap-wysihtml5.css" type="text/css" rel="stylesheet" />
        <link href="css/lib/uniform.default.css" type="text/css" rel="stylesheet" />
        <link href="css/lib/select2.css" type="text/css" rel="stylesheet" />
        <link href="css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet" />
        <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

        <!-- global styles -->
        <link rel="stylesheet" type="text/css" href="css/layout.css" />
        <link rel="stylesheet" type="text/css" href="css/elements.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />

        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/form-showcase.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/secuotp-page-overall.css" type="text/css" media="screen" />

        <!-- open sans font -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />
    </head>

    <body>
        <!-- navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-inner">
                <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="brand logo" href="${pageContext.servletContext.contextPath}">
                    <img src="img/secuotp/logo.png" />
                </a>

                <ul class="nav pull-right">
                    <li class="notification-dropdown hidden-phone">
                        <a href="#" class="trigger">
                            <i class="icon-lightbulb"></i>
                            <span class="count">3</span>
                        </a>
                        <div class="pop-dialog">
                            <div class="pointer right">
                                <div class="arrow"></div>
                                <div class="arrow_border"></div>
                            </div>
                            <div class="body">
                                <a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
                                <div class="messages">
                                    <a href="#" class="item">
                                        <img src="img/contact-img.png" class="display" />
                                        <div class="name">Alejandra Galván</div>
                                        <div class="msg">
                                            There are many variations of available, but the majority have suffered alterations.
                                        </div>
                                        <span class="time"><i class="icon-time"></i> 13 min.</span>
                                    </a>
                                    <a href="#" class="item">
                                        <img src="img/contact-img2.png" class="display" />
                                        <div class="name">Alejandra Galván</div>
                                        <div class="msg">
                                            There are many variations of available, have suffered alterations.
                                        </div>
                                        <span class="time"><i class="icon-time"></i> 26 min.</span>
                                    </a>
                                    <a href="#" class="item last">
                                        <img src="img/contact-img.png" class="display" />
                                        <div class="name">Alejandra Galván</div>
                                        <div class="msg">
                                            There are many variations of available, but the majority have suffered alterations.
                                        </div>
                                        <span class="time"><i class="icon-time"></i> 48 min.</span>
                                    </a>
                                    <div class="footer">
                                        <a href="#" class="logout">View all messages</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">Welcome <span style="font-weight: bold; text-transform: capitalize">${sessionScope.user.username}</span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Account Setting</a>
                                    </li>
                                    <li>
                                        <a href="UserLogout">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="settings hidden-phone" style="width: 90px">
                                <a href="Login" role="button">
                                    <i class="icon-off" style="float: left"></i>
                                    <span style="display: block;float: right">Login</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- end navbar -->
            <!-- sidebar -->
            <div id="sidebar-nav">
                <ul id="dashboard-menu">
                    <li>
                        <a href="${pageContext.servletContext.contextPath}">
                            <i class="icon-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <c:if test="${sessionScope.user != null}">
                        <li>
                            <a href="#">
                                <i class="icon-sitemap"></i>
                                <span>My Site</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-warning-sign"></i>
                                <span>Emergency</span>
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <a href="Documentation">
                            <i class="icon-book"></i>
                            <span>Documentation</span>
                        </a>
                    </li>
                    <li>
                        <a href="Download">
                            <i class="icon-download-alt"></i>
                            <span>Download</span>
                        </a>
                    </li>
                    <c:if test="${sessionScope.user == null}">
                        <li>
                            <a href="SignUp">
                                <i class="icon-plus"></i>
                                <span>Sign Up</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- end sidebar -->

            <script src="js/jquery-2.1.1.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
            <!-- chosen -->
            <script src="Assets/chosen_v1.0.0/chosen.jquery.js"></script>
            <!-- knob -->
            <script src="js/jquery.knob.js"></script>
            <!-- flot charts -->
            <script src="js/jquery.flot.js"></script>
            <script src="js/jquery.flot.stack.js"></script>
            <script src="js/jquery.flot.resize.js"></script>
            <script src="js/theme.js"></script>
        </body>

    </html>
