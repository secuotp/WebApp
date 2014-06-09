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
                    <!-- <div class="row-fluid head">
                        <div class="span12">
                            <h4>Form wizard</h4>
                        </div>
                    </div> -->

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
                                            <form />
                                            <div class="field-box">
                                                <label>First Name:</label>
                                                <input class="span8" type="text" />
                                            </div>
                                            <div class="field-box error">
                                                <label>Last Name:</label>
                                                <input class="span8" type="text" />
                                                <span class="alert-msg"><i class="icon-remove-sign"></i> Please enter your Last Name</span>
                                            </div>
                                            <div class="field-box">
                                                <label>Email:</label>
                                                <input class="span8" type="text" />
                                            </div>
                                            <div class="field-box success">
                                                <label>Username:</label>
                                                <input class="span8" type="text" />
                                                <span class="alert-msg"><i class="icon-ok-sign"></i> Username available</span>
                                            </div>
                                            <div class="field-box success">
                                                <label>Password</label>
                                                <input class="span8" type="password" />
                                                <label>Re-check Password</label>
                                                <input class="span8" type="password" />
                                                <span class="alert-msg"><i class="icon-ok-sign"></i> Password matching</span>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="step-pane" id="step2">
                                    <div class="row-fluid form-wrapper">
                                        <div class="span8">
                                            <form />
                                            <div class="field-box">
                                                <label>Address:</label>
                                                <input class="span8" type="text" />
                                            </div>
                                            <div class="field-box">
                                                <label>City:</label>
                                                <input class="span8" type="text" />
                                            </div>
                                            <div class="field-box">
                                                <label>Postal/ZIP code:</label>
                                                <input class="span8" type="text" />
                                            </div>
                                            <div class="field-box">
                                                <label>Country:</label>
                                                <div class="ui-select">
                                                    <select>
                                                        <option>Thailand</option>
                                                    </select>
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-actions">
                                <button type="button" disabled="" class="btn-glow primary btn-prev"> 
                                    <i class="icon-chevron-left"></i> Prev
                                </button>
                                <button type="button" class="btn-glow primary btn-next" data-last="Finish">
                                    Next <i class="icon-chevron-right"></i>
                                </button>
                                <button type="button" class="btn-glow success btn-finish">
                                    Setup your account!
                                </button>
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
        </script>
    </body>
</html>