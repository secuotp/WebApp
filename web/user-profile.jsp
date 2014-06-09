<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - SIT Webiste</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/user-profile.css" type="text/css" media="screen" />
    </head>
</head>
<body>
    <jsp:include page="/header.jsp" flush="true" />

    <!-- main container -->
    <div class="content">

        <div class="container-fluid">
            <div id="pad-wrapper" class="user-profile">
                <!-- header -->
                <div class="row-fluid header">
                    <div class="span8">
                        <img src="img/sit.gif" style="width:70px;" class="avatar img-circle" />
                        <h3 class="name">SIT Website</h3>
                        <span class="area">Admin Authentication</span>
                    </div>
                    <a class="btn-flat icon pull-right delete-user" data-toggle="tooltip" title="Delete user" data-placement="top">
                        <i class="icon-trash"></i>
                    </a>
                    <a class="btn-flat icon large pull-right edit">
                        Edit this website
                    </a>
                </div>

                <div class="row-fluid profile">
                    <!-- bio, new note & orders column -->
                    <div class="span12 bio">
                        <div class="profile-box">
                            <!-- biography -->
                            <div class="span12 section">
                                <h6>Domain Name</h6>
                                <p>sit.kmutt.ac.th</p>
                                <h6>Description</h6>
                                <p>School of Information Technology, King Mongkut's University of Technology Thonburi.</p>
                                <h6>Public Key</h6>
                                <p>6LdnF-wSABCDEJczcz8TypCo1-dWloor9emC9Bq0</p>
                                <h6>Private Key</h6>
                                <p>6LdnF-wSABCDEIGS3ecTlY_SA1olMLuiW2UxPLsq</p>
                                <h6>Pattern</h6>
                                <div class="span3 ui-select">
                                    <select>
                                        <option>Number</option>
                                        <option>Hexadecimal</option>
                                        <option>Text</option>
                                        <option>Text with Number</option>
                                        <option>Text with Symbol</option>
                                        <option>Text with Number and Symbol</option>
                                    </select>
                                </div><br>
                                <h6>Length</h6>
                                <div class="span3 ui-select">
                                    <select>
                                        <option>8</option>
                                    </select>
                                </div><br>
                                <h6>Force user use OTP</h6>
                                <div class="slider-frame primary">
                                    <span data-on-text="ON" data-off-text="OFF" class="slider-button on">ON</span>
                                </div>
                            </div>
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
    <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="js/bootstrap.datepicker.js"></script>

    <!-- call all plugins -->
    <script src="js/theme.js"></script>

    <!-- initialize this page scripts -->
    <script type="text/javascript">
        $(function() {

            // Inline datepicker
            $("#inline-datepicker").datepicker();

            // jQuery UI Sliders
            $(".slider-sample1").slider({
                value: 100,
                min: 1,
                max: 500
            });
            $(".slider-sample2").slider({
                range: "min",
                value: 130,
                min: 1,
                max: 500
            });
            $(".slider-sample3").slider({
                range: true,
                min: 0,
                max: 500,
                values: [40, 170],
            });



            // Switch slide buttons
            $('.slider-button').click(function() {
                if ($(this).hasClass("on")) {
                    $(this).removeClass('on').html($(this).data("off-text"));
                } else {
                    $(this).addClass('on').html($(this).data("on-text"));
                }
            });

        });
    </script>
</body>
</html>