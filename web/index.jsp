<%-- Document : index Created on : Aug 21, 2014, 1:44:52 PM Author : Zenology --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secu OTP</title>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <div class="content">
            
            <div class="page-main-div document" style="padding: 10% 0;">
                <h1>Secu OTP</h1>
                <h3>One-time Passworld Service via Web Service</h3>
                <p>School of Information Technology, King Mongkut's University of Technology Thonburi</p>
            </div>
            
            <span style="text-align: center;">
                <h1 style="padding: 5% 0">Welcome to Secu OTP!</h1>
                <div class="span5">
                    <img src="img/lock.png" width="30%"/>
                    <br><br>
                    <h4>More Security</h4>
                    <p>Build your systems to be more security by our 2-Factor Authentication system.</p>
                </div>
                <div class="span5">
                    <img src="img/talk.png" width="30%" />
                    <br><br>
                    <h4>Many Languages</h4>
                    <p>Secu OTP support many languages including Java, .NET, PHP, and Python.</p>
                </div>
            </span>
            
            <div class="span11" style="padding-top: 30px; -webkit-filter: grayscale(100%); filter: grayscale(100%); margin: auto; text-align: center;">
                <h3>Our Partners</h3><br>
                <img src="img/jersey.png" style="padding-right: 20px"/><img src="img/oath.jpg">
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
