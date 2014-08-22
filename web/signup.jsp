<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Secu OTP - Sign Up</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled//form-wizard.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/secuotp-page-signup.css" type="text/css" media="screen">

        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content full-bg">

            <c:if test="${msg != null}">
                <div style="margin: 10px" class="alert alert-error">
                    <i class="icon-remove-sign"></i>
                    ${msg}
                </div>
            </c:if>

            <div class="row-fluid login-wrapper">
                <div class="box">
                    <div class="content-wrap">
                        <div id="step-bar" class="row-fluid">
                            <div class="span6 form-step active">
                                <span>Step 1:<br/> General Information <i class="icon-chevron-right"></i></span>
                            </div>
                            <div class="span6 form-step">
                                <span>Step 2:<br/> Address Information <i class="icon-chevron-right"></i></span>
                            </div>
                        </div>
                        <form action="UserLogin" method="post">
                            <div id="step1">
                                <div class="field-box">
                                    <label>Uesrname:</label>
                                    <input type="text" class="span8 inline-input" name="username" />
                                </div>
                                <div class="field-box">
                                    <label>Password:</label>
                                    <input type="password" class="span8 inline-input" name="password" />
                                </div>
                                <div class="field-box">
                                    <label>Retype Password:</label>
                                    <input type="password" class="span8 inline-input" name="password2" />
                                </div>
                                <div class="field-box">
                                    <label>Email:</label>
                                    <input type="email" class="span8 inline-input" name="email" />
                                </div>
                                <div class="field-box">
                                    <label>Firstname</label>
                                    <input type="text" class="span8 inline-input" name="firstname" />
                                </div>
                                <div class="field-box">
                                    <label>Lastname:</label>
                                    <input type="text" class="span8 inline-input" name="lastname" />
                                </div>
                                <div style="height: 33px">
                                    <button type="button" class="btn-flat primary login" style="float: right">
                                        Next&nbsp;
                                        <i class="icon-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                            <div id="step2">
                                <div class="field-box">
                                    <label>Address:</label>
                                    <textarea class="span8 inline-input" name="address"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="no-account">
                    <p>Don't have an account?</span>
                        <a href="SignUp">Sign Up</a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>

    </html>