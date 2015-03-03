<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Add New Site</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/new-user.css" type="text/css" media="screen" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">

            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    ${msg}
                    <div class="row-fluid header">
                        <h3>Add New Site</h3>
                    </div>

                    <div class="row-fluid form-wrapper">
                        <!-- left column -->
                        <div class="span12 with-sidebar">
                            <div class="container">
                                <form action="SiteAdd" method="POST" class="new_user_form inline-input">
                                    <div class="span12 field-box">
                                        <label>Site Name:</label>
                                        <input class="span9" name="site_name" type="text" />
                                    </div>
                                    <div class="span12 field-box">
                                        <label>Domain Name:</label>
                                        <input class="span9" name="domain" type="text" />
                                    </div>
                                    <div class="span12 field-box">
                                        <label>Description:</label>
                                        <input class="span9" name="description" type="text" />
                                    </div>
                                    <div class="span12 field-box">
                                        <label>OTP Pattern:</label>
                                        <div class="ui-select">
                                            <select name="otpPattern">
                                                <option value="1" selected="true">Numeric</option>
                                                <option value="2">Hexadecimal</option>
                                                <option value="3">Text</option>
                                                <option value="4">Text + Numeric</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="span12 field-box">
                                        <label>OTP Length:</label>
                                        <div class="ui-select">
                                            <select name="otpLength">
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6" selected="true">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="span12 field-box">
                                        <label>OTP Time Zone:</label>
                                        <div class="ui-select">
                                            <select name="otpTimezone">
                                                <option value="1">GMT-12</option>
                                                <option value="2">GMT-11</option>
                                                <option value="3">GMT-10</option>
                                                <option value="4">GMT-9</option>
                                                <option value="5">GMT-8</option>
                                                <option value="6">GMT-7</option>
                                                <option value="7">GMT-6</option>
                                                <option value="8">GMT-5</option>
                                                <option value="9">GMT-4</option>
                                                <option value="10">GMT-3</option>
                                                <option value="11">GMT-2</option>
                                                <option value="12">GMT-1</option>
                                                <option value="13">GMT</option>
                                                <option value="14">GMT+1</option>
                                                <option value="15">GMT+2</option>
                                                <option value="16">GMT+3</option>
                                                <option value="17">GMT+4</option>
                                                <option value="18">GMT+5</option>
                                                <option value="19">GMT+6</option>
                                                <option value="20" selected="true">GMT+7</option>
                                                <option value="21">GMT+8</option>
                                                <option value="22">GMT+9</option>
                                                <option value="23">GMT+10</option>
                                                <option value="24">GMT+11</option>
                                                <option value="25">GMT+12</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="span11 field-box actions">
                                        <input type="submit" class="btn-flat primary" value="SUBMIT" />
                                        <span>OR</span>
                                        <input type="reset" value="Cancel" class="reset" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end main container -->


        <!-- scripts -->
        <script src="js/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>

        <script type="text/javascript">
            $(function () {

                // toggle form between inline and normal inputs
                var $buttons = $(".toggle-inputs button");
                var $form = $("form.new_user_form");

                $buttons.click(function () {
                    var mode = $(this).data("input");
                    $buttons.removeClass("active");
                    $(this).addClass("active");

                    if (mode === "inline") {
                        $form.addClass("inline-input");
                    } else {
                        $form.removeClass("inline-input");
                    }
                });
            });
        </script>
    </body>
</html>