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
                            <div id="step1-bar" class="span6 form-step active">
                                <span>Step 1:<br/> General Information <i class="icon-chevron-right"></i></span>
                            </div>
                            <div id="step2-bar" class="span6 form-step">
                                <span>Step 2:<br/> Address Information <i class="icon-chevron-right"></i></span>
                            </div>
                        </div>
                        <form action="UserLogin" method="post">
                            <div id="step1" class="form-wrapper">
                                <div id="step1-field-username" class="field-box">
                                    <label>Username: *</label>
                                    <input type="text" id="step1-username" class="span8 inline-input" name="username" oninput="usernameCheck()" />
                                    <span id="step1-username-msg" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
                                </div>
                                <div id="step1-field-password-1" class="field-box">
                                    <label>Password: *</label>
                                    <input type="password" id="step1-password-1" class="span8 inline-input" name="password" oninput="passwordCheck()"/>
                                </div>
                                <div id="step1-field-password-2" class="field-box">
                                    <label>Re-Type Password:</label>
                                    <input type="password" id="step1-password-2" class="span8 inline-input" name="password2" oninput="passwordCheck()" />
                                    <span id="step1-password-msg" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
                                </div>
                                <div id="step1-field-email" class="field-box">
                                    <label>Email:</label>
                                    <input type="email" id="step1-email" class="span8 inline-input" name="email" oninput="emailCheck()"/>
                                    <span id="step1-email-msg" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
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
                                    <button type="button" id="step1-next" class="btn-flat primary" style="float: right" onclick="nextButtonClick()">
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
                                <div class="field-box">
                                    <label>City:</label>
                                    <input type="text" class="span8 inline-input" name="city" />
                                </div>
                                <div class="field-box">
                                    <label>Postal Code:</label>
                                    <input type="text" class="span8 inline-input" name="postal" />
                                </div>
                                <div class="field-box">
                                    <label>Country:</label>
                                    <input type="text" class="span8 inline-input" name="country" />
                                </div>
                                <div style="height: 33px">
                                    <button type="button" class="btn-flat success" style="margin-left:10px;float: right">
                                        Register&nbsp;
                                        <i class="icon-chevron-right"></i>
                                    </button>
                                    <button type="button" class="btn-flat primary" style="float: right" onclick="previousButtonClick()">
                                        <i class="icon-chevron-left"></i>
                                        Previous&nbsp;
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />

        <!-- SCRIPT -->
        <script src="js/Secuotp/signup.js"></script>
    </body>


    </html>