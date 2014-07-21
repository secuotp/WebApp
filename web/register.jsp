<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Sign Up</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/form-wizard.css" type="text/css" media="screen" />
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">

            <div class="container-fluid">
                <div id="pad-wrapper">

                    <form id="register" action="AddWebDev" mathod="POST">
                        <div class="row-fluid">
                            <div style="margin-left: 10%;" class="span12">
                                <div style="margin-left: 15%; margin-top: 5%;" id="fuelux-wizard" class="wizard row-fluid">
                                    <ul class="wizard-steps">
                                        <li data-target="#step1" class="active">
                                            <span class="step">1</span>
                                            <span class="title">General <br /> information</span>
                                        </li>
                                        <li data-target="#step2">
                                            <span class="step">2</span>
                                            <span class="title">Address <br /> information</span>
                                        </li>
                                    </ul>                            
                                </div>
                                <div class="step-content">
                                    <div class="step-pane active" id="step1">
                                        <div class="row-fluid form-wrapper">
                                            <div class="span8">

                                                <div class="field-box">
                                                    <label>Username:</label>
                                                    <input id="username" name="username" class="one span8" type="text" required="true" />
                                                    <i><span class="alert-msg" id="username-message"></span></i>
                                                </div>
                                                <div class="field-box">
                                                    <label>Password</label>
                                                    <input name="password" id="password" class="span8" type="password" required />
                                                    <label>Re-check Password</label>
                                                    <input name="confirm-password" id="confirm-password" class="span8" type="password" required />
                                                    <i><span class="alert-msg" id="password-message"></span></i>
                                                </div>
                                                <div class="field-box">
                                                    <label>Email:</label>
                                                    <input name="email" id="email" class="span8" type="text" required />
                                                    <i><span class="alert-msg" id="email-message"></span></i>
                                                </div>
                                                <div class="field-box">
                                                    <label>First Name:</label>
                                                    <input name="firstname" id="firstname" class="span8" type="text" required />
                                                    <label>Last Name:</label>
                                                    <input name="lastname" id="lastname" class="span8" type="text" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="step2">
                                        <div class="row-fluid form-wrapper">
                                            <div class="span8">
                                                <div class="field-box">
                                                    <label>Address:</label>
                                                    <input name="address" class="span8" type="text" required />
                                                </div>
                                                <div class="field-box">
                                                    <label>City:</label>
                                                    <input name="city" class="span8" type="text" required />
                                                </div>
                                                <div class="field-box">
                                                    <label>Postal/ZIP code:</label>
                                                    <input name="postal_code" class="span8" type="text" required />
                                                </div>
                                                <div class="field-box">
                                                    <label>Country:</label>
                                                    <div class="ui-select">
                                                        <select name="country_id">
                                                            <c:forEach items="${list}" var="i">
                                                                <option value="${i.cid}">${i.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="wizard-actions">
                                    <button type="button" disabled="" class="btn-flat primary btn-prev"> 
                                        <i class="icon-chevron-left"></i> Prev
                                    </button>
                                    <button id="hulk" type="button" class="btn-flat primary btn-next" data-last="Finish">
                                        Next <i class="icon-chevron-right"></i>
                                    </button>
                                    <button type="submit" class="btn-flat success btn-finish">
                                        Setup your account!
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- end main container -->

        <!-- scripts for this page -->
        <script src="js.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>
        <script src="js/fuelux.wizard.js"></script>

        <script type="text/javascript">
            $(function() {
                // disbled button
                //$('#hulk').prop('disabled', true);
                $('#password-message').html("<span class='icon-info-sign'> Please enter password.</span>");
                $('#email-message').html("<span class='icon-info-sign'> Please enter email.</span>");

                var $wizard = $('#fuelux-wizard'),
                        $btnPrev = $('.wizard-actions .btn-prev'),
                        $btnNext = $('.wizard-actions .btn-next'),
                        $btnFinish = $(".wizard-actions .btn-finish");

                $wizard.wizard().on('finished', function(e) {
                    // wizard complete code
                }).on("changed", function(e) {
                    var step = $wizard.wizard("selectedItem");
                    // reset states
                    $btnNext.removeAttr("disabled");
                    $btnPrev.removeAttr("disabled");
                    $btnNext.show();
                    $btnFinish.hide();

                    if (step.step === 1) {
                        $btnPrev.attr("disabled", "disabled");
                    } else if (step.step === 2) {
                        $btnNext.hide();
                        $btnFinish.show();
                    }
                });

                $btnPrev.on('click', function() {
                    $wizard.wizard('previous');
                });
                $btnNext.on('click', function() {
                    $wizard.wizard('next');
                });
            });

            // check password length
            function isPasswordMatch() {
                var password = $("#password").val();
                var confirmPassword = $("#confirm-password").val();

                if (password !== confirmPassword) {
                    $("#password-message").html("<span style='color: red;' class='icon-remove-sign'> Passwords do not match!</span>");
                    //$('#hulk').prop('disabled', true);
                } else {
                    $("#password-message").html("<span style='color: green;' class='icon-ok-sign'> Passwords match.</span>");
                    //$('#hulk').prop('disabled', false);
                }
            }

            function isEmailFilled() {
                var email = $("#email").val();

                if (validateEmail(email) === false) {
                    $("#email-message").html("<span style='color: red;' class='icon-remove-sign'> Email do not valid!</span>");
                    //$('#hulk').prop('disabled', true);
                } else {
                    $("#email-message").html("<span style='color: green;' class='icon-ok-sign'> Valid email.</span>");
                    //$('#hulk').prop('disabled', false);
                }
            }

            function validateEmail(email) {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }

            $(document).ready(function() {
                $("#confirm-password").keyup(isPasswordMatch);
                $("#email").keyup(isEmailFilled);

                $("#register").on("hulk", function(e) {
                    var empty = "";
                    var username = $('#username').val();
                    //var pw = $('#password').val();
                    //var confirm-pw = $('#confirm-password').val();
                    if (username === "" || username === null)
                    {
                        alert("please enter valid email and password.");
                        e.preventDefault();
                    }
                    else
                    {
                        alert("good");
                        $('#hulk').prop('disabled', false);
                    }
                });
            });
        </script>
    </body>
</html>