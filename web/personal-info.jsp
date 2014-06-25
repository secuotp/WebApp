<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Account Settings</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/new-user.css" type="text/css" media="screen" />
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://secuotp.sit.kmutt.ac.th:3306/secuotp"
                           user="root"  password="secuotp"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from ADDRESS where address_id = ?
            <sql:param value="${address_id}" />
        </sql:query>
        
        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    <div class="row-fluid header">
                        <h3>Account Settings</h3>
                    </div>
                    <div class="row-fluid form-wrapper">
                        <div class="span12 with-sidebar">
                            <div class="container">

                                <c:forEach var="row" items="${result.rows}">
                                    <form action="EditWebDev" method="POST" class="new_user_form inline-input">
                                        <input type="hidden" name="address_id" value="${address_id}" />
                                        <input type="hidden" name="user_id" value="${user_id}" />
                                        <div class="span12 field-box">
                                            <label>Email:</label>
                                            <input class="span9" type="text" name="email" value="${email}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>First Name:</label>
                                            <input class="span9" type="text" name="firstname" value="${firstname}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>Last Name:</label>
                                            <input class="span9" type="text" name="lastname" value="${lastname}" />
                                        </div>
                                        <div class="span12 field-box">
                                            <label>Address:</label>
                                            <input class="span9" type="text" name="address" value="${row.address}"/>
                                        </div>
                                        <div class="span6 field-box">
                                            <label>City:</label>
                                            <input class="span9" type="text" name="city" value="${row.city}"/>
                                        </div>

                                        <div class="span6 field-box">
                                            <label>Country:</label>
                                            <div class="ui-select">
                                                <select name="country_id">
                                                    <c:forEach items="${countries}" var="co">
                                                        <c:choose>
                                                            <c:when test="${row.country_id == co.cid}">
                                                                <option value="${co.cid}" selected="true">${co.name}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${co.cid}">${co.name}</option>   
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span6 field-box">
                                            <label>Postal/ZIP code:</label>
                                            <input class="span9" type="text" name="postal_code" value="${row.postal_code}"/>
                                        </div>
                                        <div style="margin-left: 60%;">
                                            <input type="submit" class="btn-glow primary btn-next" value="Change Settings">
                                            <input type="reset"/>
                                        </div>
                                    </c:forEach>
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