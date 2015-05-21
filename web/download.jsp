<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Download</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/secuotp-page-grid.css" type="text/css" media="screen" />
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content">

            <div class="page-main-div download">
                <h1>Download</h1>
                <h3>Choose the language which you wants</h3>
                <p>SecuOTP supports many of programming laganguage including PHP, Java and .NET.</p>
            </div>
            <div class="page-field">
                <a href="Assets/connector/SecuOTP.zip">
                    <div class="page-box php"></div>
                </a>
                <a href="Assets/connector/SecuOTP.jar">
                    <div class="page-box java"></div>
                </a>
                <a href="Assets/connector/SecuOTP.dll">
                    <div class="page-box net"></div>
                </a>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>