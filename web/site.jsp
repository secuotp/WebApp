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
                                <h4>Users</h4>
                            </div>
                        </div>

                        <div class="row-fluid filter-block">
                            <div class="pull-right">
                                <a class="btn-flat pull-right success new-product add-user">+ Add user</a>
                                <input type="text" class="search user-search" placeholder="Search for users..">
                            </div>
                        </div>

                        <div class="row-fluid">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="span4">
                                            Name
                                        </th>
                                        <th class="span3">
                                            <span class="line"></span>Date Created
                                        </th>
                                        <th class="span2">
                                            <span class="line"></span>Total User
                                        </th>
                                        <th class="span3 align-right">
                                            <span class="line"></span>Command
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- row -->
                                    <c:set var="count" value="1" />
                                    <c:forEach items="${requestScope.siteList}" var="i">
                                        <c:choose>
                                            <c:when test="${count > 1}">
                                                <tr>
                                                    <td>
                                                        <img src="img/contact-img.png" class="img-circle avatar hidden-phone"/>
                                                        <b style="font-size: 14px">${i.siteName}</b>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${i.dateCreated}" pattern="yyyy-MM-dd HH:mm"/>
                                                    </td>
                                                    <td>
                                                        <span>${i.userCount}</span>
                                                    </td>
                                                    <td>
                                                        Test
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="first">
                                                    <td>
                                                        <img src="img/contact-img.png" class="img-circle avatar hidden-phone"/>
                                                        <b style="font-size: 14px">${i.siteName}</b>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${i.dateCreated}" pattern="yyyy-MM-dd HH:mm"/>
                                                    </td>
                                                    <td>
                                                        <span>${i.userCount}</span>
                                                    </td>
                                                    <td>
                                                        Test
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