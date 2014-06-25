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

                    <form action="AddWebDev" mathod="POST">
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
                                                    <input id="user" name="username" class="uname span8" type="text" required="true" />
                                                    <br><i><span class="status alert-msg"></span></i>
                                                </div>
                                                <div class="field-box">
                                                    <label>Password</label>
                                                    <input name="password" id="pwd" class="span8" type="password" required />
                                                    <label>Re-check Password</label>
                                                    <input name="passwordc" id="pwdc" class="span8" type="password" required />
                                                    <i><span class="alert-msg" id="pwdmsg"></span></i>
                                                </div>
                                                <div class="field-box">
                                                    <label>Email:</label>
                                                    <input name="email" class="span8" type="text" required />
                                                </div>
                                                <div class="field-box">
                                                    <label>First Name:</label>
                                                    <input name="firstname" class="span8" type="text" required />
                                                    <label>Last Name:</label>
                                                    <input name="lastname" class="span8" type="text" required />
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
                                    <button type="button" disabled="" class="btn-glow primary btn-prev"> 
                                        <i class="icon-chevron-left"></i> Prev
                                    </button>
                                    <button id="hulk" type="button" class="btn-glow primary btn-next" data-last="Finish">
                                        Next <i class="icon-chevron-right"></i>
                                    </button>
                                    <button type="submit" class="btn-glow success btn-finish">
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
                $('#hulk').prop('disabled', true);
                $('#pwdmsg').html("<span class='icon-info-sign'> Please enter password.</span>");
                $('.status').html("<span class='icon-info-sign'></span> username should be at least 6 characters.");

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
                var user = $("#user");
                var password = $("#pwd").val();
                var confirmPassword = $("#pwdc").val();

                if (password !== confirmPassword) {
                    $("#pwdmsg").html("<span style='color: red;' class='icon-remove-sign'> Passwords do not match!</span>");
                    $('#hulk').prop('disabled', true);
                } else {
                    $("#pwdmsg").html("<span style='color: green;' class='icon-ok-sign'> Passwords match.</span>");
                    $('#hulk').prop('disabled', false);
                }
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#pwdc").keyup(isPasswordMatch);
            });

            //check username availability

            $(document).ready(function() {
                $(".uname").change(function() {
                    var uname = $(this).val();
                    if (uname.length > 3) {
                        $(".status").html("<span class='icon-spinner'></span> Checking availability...");
                        $.ajax({
                            type: "POST",
                            url: "CheckUser",
                            data: "uname=" + uname,
                            dataType: "text",
                            complete: function(msg) {
                                $(".status").ajaxComplete(function(event, request, settings) {
                                    $(".status").html(msg.responseText);
                                    alert(msg);
                                });
                            }
                        });
                    }
                    else {
                        $(".status").html("<span class='icon-info-sign'></span> username should be at least 6 characters.");
                    }
                });
            });
        </script>
    </body>
</html>