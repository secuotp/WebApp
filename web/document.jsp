<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Documentation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/secuotp-page-grid.css" type="text/css" media="screen" />
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content">

            <div class="page-main-div document">
                <h1>Documentation</h1>
                <h3>Choose the language which you wants</h3>
                <p>SecuOTP supports many of programming laganguage including PHP, Java and .NET.</p>
            </div>
            
            <div class="page-field">
                <a href="#php">
                    <div class="page-box php"></div>
                </a>
                <a href="#java">
                    <div class="page-box java"></div>
                </a>
                <a href="#net">
                    <div class="page-box net"></div>
                </a>
            </div>
            
            <div id="php" style="padding: 30px;">
                <style type="text/css">
                    h4 { padding: 15px 0; }
                </style>
                
                <h3>PHP</h3>
                
                <h4 style="padding">Quick Start</h4>
                
                <ol>
                    <li>Download <a href="Assets/connector/SecuOTP.zip">SecuOTP.zip</a></li>
                    <li>Import SecuOTP.jar to your project</li>
                </ol>

                <h4>Components</h4>
                
                <ul>
                    <li><b>XMLParser</b>: parse variables and details into XML format.</li>
                    <li><b>XMLParam</b>: collection of SecuOTP service code and name for request use.</li>
                    <li><b>Service</b>: connection core for requests and responses between SecuOTP server.</li>
                    <li><b>SecuOTPService</b>: collection of services for request many servicesto SecuOTP server.</li>
                    <li><b>ServiceStatus</b>: manage service result data from response XML data.</li>
                    <li><b>User</b>: manage user data from response XML data.</li>
                    <li><b>XMLTag</b>: manage tag data for making XML document.</li>
                    <li><b>XMLRequest</b>: engine core for create request to server.</li>
                    <li><b>XMLResponse</b>: engine core for receive response from server.</li>
                </ul>

                <h4>Example</h4>
                <code>$req = new XMLRequest();</code><br><br>
                <p>When you created the object, you can use function in the object. But some functions required variable and/or object to import and execute the function in the server. Use these codes to call the function.</p>
                <ul>
                    <li>valuable.function(valiable/s(if available));</li>
                    <li>Object.function(valiable/s(if available));</li>
                </ul>
                
                <h4>Example</h4>
                <ul>
                    <li>include '<b>Folder Name</b>/SecuOTPService.php';</li>
                    <li>$req = new XMLRequest();</li>
                    <li>$req->setDomainName('www.secuotp-test.co.th');</li>
                    <li>$status = $service->generateOneTimePassword('username');</li>
                </ul>
                
                <a href="#top">^ Back to top</a>
            </div><!-- /PHP -->
            
            <div id="java" style="padding: 30px;">
                <style type="text/css">
                    h4 { padding: 15px 0; }
                </style>
                
                <h3>Java</h3>
                
                <h4 style="padding">Quick Start</h4>
                
                <ol>
                    <li>Download <a href="Assets/connector/SecuOTP.jar">SecuOTP.jar</a></li>
                    <li>Import SecuOTP.jar to your project</li>
                </ol>

                <h4>Components</h4>
                
                <ul>
                    <li><b>XMLParser</b>: parse variables and details into XML format.</li>
                    <li><b>XMLParam</b>: collection of SecuOTP service code and name for request use.</li>
                    <li><b>Service</b>: connection core for requests and responses between SecuOTP server.</li>
                    <li><b>SecuOTPService</b>: collection of services for request many servicesto SecuOTP server.</li>
                    <li><b>ServiceStatus</b>: manage service result data from response XML data.</li>
                    <li><b>User</b>: manage user data from response XML data.</li>
                    <li><b>XMLTag</b>: manage tag data for making XML document.</li>
                    <li><b>XMLRequest</b>: engine core for create request to server.</li>
                    <li><b>XMLResponse</b>: engine core for receive response from server.</li>
                </ul>
                
                <h4>How to use?</h4>
                <p>Use <code>Object valuable = new Object();</code> for create object in your program when you want to use one of these functions on your website.</p>

                <h4>Example</h4>
                <code>XMLRequest req = new XMLRequest();</code><br><br>
                <p>When you created the object, you can use function in the object. But some functions required variable and/or object to import and execute the function in the server. Use these codes to call the function.</p>
                <ul>
                    <li>valuable.function(valiable/s(if available));</li>
                    <li>Object.function(valiable/s(if available));</li>
                </ul>
                
                <h4>Example</h4>
                <ul>
                    <li>XMLRequest req = new XMLRequest();</li>
                    <li>req.setDomainName("www.secuotp-test.co.th");</li>
                    <li>ServiceStatus status = service.generateOneTimePassword("username");</li>
                </ul>
                
                <a href="#top">^ Back to top</a>
            </div><!-- /Java -->
            
            <div id="net" style="padding: 30px;">
                <style type="text/css">
                    h4 { padding: 15px 0; }
                </style>
                
                <h3>.NET</h3>
                
                <h4 style="padding">Quick Start</h4>
                
                <ol>
                    <li>Download <a href="Assets/connector/SecuOTP.dll">SecuOTP.dll</a></li>
                    <li>Import SecuOTP.dll to your project</li>
                </ol>

                <h4>Components</h4>
                
                <ul>
                    <li><b>XMLParser</b>: parse variables and details into XML format.</li>
                    <li><b>XMLParameter</b>: import keys and variables for uses and creates XML document.</li>
                    <li><b>OTPMigration</b>: manage migration data from response XML data.</li>
                    <li><b>Service</b>: connection core for requests and responses between SecuOTP server.</li>
                    <li><b>SecuOTPService</b>: collection of services for request many servicesto SecuOTP server.</li>
                    <li><b>ServiceCodeHttps</b>: Collection of SecuOTP URI for use (Only in HTTPS).</li>
                    <li><b>ServiceStatus</b>: manage service result data from response XML data.</li>
                    <li><b>User</b>: manage user data from response XML data.</li>
                    <li><b>XMLTag</b>: manage tag data for making XML document.</li>
                    <li><b>XMLRequest</b>: engine core for create request to server.</li>
                    <li><b>XMLResponse</b>: engine core for receive response from server.</li>
                </ul>
                
                <h4>How to use?</h4>
                <p>Use <code>Object valuable = new Object();</code> for create object in your program when you want to use one of these functions on your website.</p>

                <h4>Example</h4>
                <code>XMLRequest req = new XMLRequest();</code><br><br>
                <p>When you created the object, you can use function in the object. But some functions required variable and/or object to import and execute the function in the server. Use these codes to call the function.</p>
                <ul>
                    <li>valuable.function(valiable/s(if available));</li>
                    <li>Object.function(valiable/s(if available));</li>
                </ul>
                
                <h4>Example</h4>
                <ul>
                    <li>XMLRequest req = new XMLRequest();</li>
                    <li>req.setSid("U-01");</li>
                    <li>String uri = ServiceCodeHttps.getServiceUri(sCode);</li>
                </ul>
                
                <a href="#top">^ Back to top</a>
            </div><!-- /.NET -->
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>