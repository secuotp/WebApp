<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Site Settings</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/new-user.css" type="text/css" media="screen" />
        <script type="text/javascript">
            function changeds() {
                var val = $("#disable-site").attr("value");
                if (val === "0")
                    $("#disable-site").attr("value", 1);
                else
                    $("#disable-site").attr("value", 0);
            }
        </script>
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://secuotp.sit.kmutt.ac.th:3306/secuotp"
                           user="root"  password="secuotp"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * FROM site where site_id = ?;
            <sql:param value="${site_id}" />
        </sql:query>

        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    ${msg}
                    <div class="row-fluid header">
                        <h3>Site Settings</h3>
                    </div>
                    <div class="row-fluid form-wrapper">
                        <div class="span12 with-sidebar">
                            <div class="container">
                                <!--img src="img/sit.gif" style="width:70px;" class="avatar img-circle" /-->
                                <c:forEach var="row" items="${result.rows}">
                                    <form action="EditSite2" method="POST" class="new_user_form inline-input">
                                        <div style="position: absolute; right: 25%; margin-top: -3%;" class="slider-frame primary" onclick="changeds()">
                                            <c:choose>
                                                <c:when test="${row.disabled == '0'}">
                                                    <span data-on-text="ON" data-off-text="OFF" class="slider-button">OFF</span>
                                                    <input id="disable-site" type="hidden" name="disabled" value="0" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span data-on-text="ON" data-off-text="OFF" class="slider-button on">ON</span>
                                                    <input id="disable-site" type="hidden" name="disabled" value="1" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <input type="hidden" name="site_id" value="${row.site_id}" />
                                        <div class="span12 field-box">
                                            <label>Site Name:</label>
                                            <input class="span9" type="text" name="site_name" value="${row.site_name}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>Domain Name:</label>
                                            <input class="span9" type="text" name="domain" value="${row.domain}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>Description:</label>
                                            <input class="span9" type="text" name="description" value="${row.description}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>Key:</label>
                                            <input class="span9" type="text" value="${row.serial_number}" disabled />
                                        </div>
                                        <div style="margin-left: 70%;">
                                            <input type="submit" class="btn-flat primary" value="Change Settings">
                                        </div>
                                    </form>
                                </c:forEach>
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
                                                    var data
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