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
                <div id="pad-wrapper">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h4>Log In</h4>
                            <i style="color: red;">${errMsg}</i>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <div style="margin-left: 10%;" class="span12">
                            <div class="step-content">
                                <div class="row-fluid form-wrapper">
                                    <div>
                                        <form action="Login" method="POST" class="span8">
                                            <div class="field-box">
                                                <label>Username:</label>
                                                <input type="text" name="username" placeholder="Enter Username"/>
                                            </div>
                                            <div class="field-box">
                                                <label>Password:</label>
                                                <input type="password" name="password" placeholder="Enter Password" />
                                            </div>
                                            <div style="margin-left: 20%;">
                                                <input type="submit" class="btn-flat large default primary" />
                                            </div>
                                        </form>
                                    </div>
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