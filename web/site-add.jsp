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
                                        <label>App Badge:</label>
                                        <input class="span9" type="file" />
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