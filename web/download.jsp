<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Secu OTP - Download</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/secuotp-page-grid.css" type="text/css" media="screen" />
        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content">

            <div class="page-main-div download">
                <h1>Download</h1>
                <h3>Choose your Weapon Below</h3>
                <p>SecuOTP Connector are Support many of Programming Language Including Java, PHP and C# etc.</p>
            </div>
            <div class="page-field">
                <a href="Assets/PHP-Connector.rar">
                    <div class="page-box php"></div>
                </a>
                <a href="Assets/J-Connector.jar">
                    <div class="page-box java"></div>
                </a>
                <a href="">
                    <div class="page-box net"></div>
                </a>
                <a href="">
                    <div class="page-box python page-coming-soon">
                        <div>
                            <h1>Coming Soon</h1>
                        </div>
                    </div>
                </a>
                <a href="">
                    <div class="page-box ruby page-coming-soon">
                        <div>
                            <h1>Coming Soon</h1>
                        </div>
                    </div>
                </a>
                <a href="">
                    <div class="page-box swift page-coming-soon">
                        <div>
                            <h1>Coming Soon</h1>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        
        <jsp:include page="footer.jsp" flush="true" />
    </body>

    </html>