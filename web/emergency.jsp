<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Emergency Remove User</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/new-user.css" type="text/css" media="screen" />
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />
        <!-- main container -->
        <div class="content">

            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    <div class="row-fluid header">
                        <h3>Emergency Remove User</h3>
                    </div>

                    <div class="row-fluid form-wrapper">
                        <!-- left column -->
                        <div class="span12 with-sidebar">
                            <div class="container">
                                <form class="new_user_form inline-input" />
                                <div class="span12 field-box">
                                    <label>Site Name:</label>
                                    <div class="ui-select">
                                        <select>
                                            <option>SIT</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="span6 field-box">
                                    <label>Username:</label>
                                    <input class="span9" type="text" />
                                </div>
                                <div class="span6 field-box">
                                    <label>E-mail:</label>
                                    <input class="span9" type="text" />
                                </div>
                                <div class="span6 field-box">
                                    <label>First Name:</label>
                                    <input class="span9" type="text" />
                                </div>
                                <div class="span6 field-box">
                                    <label>Last Name:</label>
                                    <input class="span9" type="text" />
                                </div>
                                <div class="span6 field-box">
                                    <label>Telephone:</label>
                                    <input class="span9" type="text" />
                                </div>                       
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" value="SUBMIT" />
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
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>

        <script type="text/javascript">
            $(function() {

                // toggle form between inline and normal inputs
                var $buttons = $(".toggle-inputs button");
                var $form = $("form.new_user_form");

                $buttons.click(function() {
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