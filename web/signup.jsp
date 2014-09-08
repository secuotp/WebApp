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
        <link rel="stylesheet" href="Assets/chosen_v1.0.0/chosen.css" type="text/css" media="screen">

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
                        <form action="UserSignup" method="post">
                            <div id="step1" class="form-wrapper">
                                <div id="step1-field-username" class="field-box">
                                    <label>Username:</label>
                                    <input type="text" id="step1-username" class="span8 inline-input" name="username" oninput="usernameCheck()" />
                                    <span id="step1-username-msg" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
                                </div>
                                <div id="step1-field-password-1" class="field-box">
                                    <label>Password:</label>
                                    <input type="password" id="step1-password-1" class="span8 inline-input" name="password" oninput="passwordCheck()" />
                                </div>
                                <div id="step1-field-password-2" class="field-box">
                                    <label>Re-Type Password:</label>
                                    <input type="password" id="step1-password-2" class="span8 inline-input" name="password2" oninput="passwordCheck()" />
                                    <span id="step1-password-msg" style="top: -4px" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
                                </div>
                                <div id="step1-field-email" class="field-box">
                                    <label>Email:</label>
                                    <input type="text" id="step1-email" class="span8 inline-input" name="email" oninput="emailCheck()" />
                                    <span id="step1-email-msg" class="alert-msg">
                                        <i></i>
                                        <span></span>
                                    </span>
                                </div>
                                <div class="field-box">
                                    <label>Firstname</label>
                                    <input type="text" id="step1-firstname" class="span8 inline-input" name="firstname" oninput="fnameCheck()" />
                                </div>
                                <div class="field-box">
                                    <label>Lastname:</label>
                                    <input type="text" id="step1-lastname" class="span8 inline-input" name="lastname" oninput="lnameCheck()" />
                                </div>
                                <div class="field-box" style="height: 33px">
                                    <button type="button" id="step1-next" class="btn-flat primary" style="float: right" onclick="nextButtonClick()">
                                        Next&nbsp;
                                        <i class="icon-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                            <div id="step2">
                                <div class="field-box">
                                    <label>Country:</label>
                                    <select data-placeholder="Choose a Country...." class="chosen-select" name="country" onchange="countryCheck()">
                                        <option value=""></option>
                                        <c:forEach items="${requestScope.country}" var="i">
                                            <option value="${i.countryId}">${i.countryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="field-box">
                                    <label>Address:</label>
                                    <textarea id="step2-address" class="span8 inline-input" name="address" oninput="addressCheck()"></textarea>
                                </div>
                                <div class="field-box">
                                    <label>City:</label>
                                    <input type="text" id="step2-city" class="span8 inline-input" name="city" oninput="cityCheck()" />
                                </div>
                                <div class="field-box">
                                    <label>Postal Code:</label>
                                    <input type="text" id="step2-postal" class="span8 inline-input" name="postal" oninput="postalCheck()" />
                                </div>

                                <div class="field-box" style="height: 33px">
                                    <button type="submit" id="step2-submit" class="btn-flat success" style="margin-left:10px;float: right">
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
        <script>
            $(".chosen-select").chosen();
        </script>
    </body>


    </html>