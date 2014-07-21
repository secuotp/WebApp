<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Download</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/index.css" type="text/css" media="screen" />   
        <link rel="stylesheet" href="css/download.css" type="text/css" media="screen" />   
        <script src="js/Chart.js"></script>
    </head>
    <body>

        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">

            <div class="download-main-div">
                <h1>Download</h1>
                <h3>Choose your Weapon Below</h3>
                <p>SecuOTP Connector are Support many of Programming Language Including Java, PHP and C# etc.</p>
            </div>
            <div class="download-field">
                <div class="download-box">
                    <h1>PHP</h1>
                </div>
                <div class="download-box">
                    <h1>Java</h1>
                </div>
                <div class="download-box">
                    <h1>C# / ASP.Net</h1>
                </div>                
            </div>
        </div>

        <!-- end of statistics chart source -->

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- knob -->
        <script src="js/jquery.knob.js"></script>
        <!-- flot charts -->
        <script src="js/jquery.flot.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.js"></script>
        <script src="js/theme.js"></script>
    </body>
</html>