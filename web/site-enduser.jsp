<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - My Site</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/secuotp-page-site.css" />
        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper">
                    <div class="table-wrapper users-table section">
                        <div class="row-fluid head">
                            <div class="span12">
                                <h2>${site_name}'s Users</h2>
                            </div>
                        </div>

                        <form action="SiteEndUser" method="POST">
                            <div class="row-fluid filter-block">
                                <div class="pull-right">
                                    <input type="text" name="key" class="search user-search" placeholder="Search for user.." />
                                    <input type="hidden" name="site_id" value="${siteid}" />
                                    <input type="hidden" name="site_name" value="${site_name}" />
                                </div>
                            </div>
                        </form>

                        <div class="row-fluid">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="span2">
                                            <span class="line"></span>Username
                                        </th>
                                        <th class="span2">
                                            <span class="line"></span>First Name
                                        </th>
                                        <th class="span2">
                                            <span class="line"></span>Last Name
                                        </th>
                                        <th class="span2">
                                            <span class="line"></span>Email
                                        </th>
                                        <th class="span2">
                                            <span class="line"></span>Phone Number
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- row -->
                                    <c:set var="count" value="1" />
                                    <c:forEach items="${requestScope.endUserList}" var="i">
                                        <c:choose>
                                            <c:when test="${count > 1}">
                                                <tr>
                                                    <td>
                                                        <span>${i.username}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.firstname}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.lastname}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.email}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.phone_number}</span>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td>
                                                        <span>${i.username}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.firstname}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.lastname}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.email}</span>
                                                    </td>
                                                    <td>
                                                        <span>${i.phone_number}</span>
                                                    </td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div></div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>