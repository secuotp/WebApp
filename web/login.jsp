<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Log In</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/form-wizard.css" type="text/css" media="screen" />
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    <div class="row-fluid header">
                        <div class="span12">
                            <h3>Log In</h3>
                        </div>

                    </div>


                    <div class="row-fluid form-wrapper">
                        <div class="span12 with-sidebar">
                            <c:if test="${requestScope.msg != null}">
                                <div style="margin-top: -2%" class="span10 alert alert-success" role="alert">${requestScope.msg}</div>
                            </c:if>
                            <div class="container span10" sstyle="float: left">
                                <form action="Login" method="POST" class="new_user_form inline-input">
                                    <div class="span12 field-box">
                                        <label>Username:</label>
                                        <input class="span9" type="text" name="username" placeholder="Enter Username" required/>
                                    </div>
                                    <div style="margin-left: 0" class="span12 field-box">
                                        <label>Password:</label>
                                        <input class="span9" type="password" name="password" placeholder="Enter Password" required />
                                    </div>
                                    <div style="float: right;margin-right: 20%">
                                        <a href="password-recover.jsp" class="btn-flat large default success">Forgot Password?</a>
                                        <input type="submit" class="btn-flat large default primary" value="Login"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end main container -->


        <!-- scripts for this page -->
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>
        <script src="js/fuelux.wizard.js"></script>

        <script type="text/javascript">
            $(function() {
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
                    } else if (step.step === 1) {
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
        </script>
    </body>
</html>