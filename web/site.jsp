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
                                <h2>My Site</h2>
                            </div>
                        </div>

                        <form action="Site" method="POST">
                            <div class="row-fluid filter-block">
                                <div class="pull-right">
                                    <a href="site-add.jsp" class="btn-flat pull-right success new-product add-user">+ Add Site</a>
                                    <input type="text" name="key" class="search user-search" placeholder="Search for site.." />
                                </div>
                            </div>
                        </form>

                        <div class="row-fluid">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="span4">
                                            Name
                                        </th>
                                        <th class="span3">
                                            <span class="line"></span>Created On
                                        </th>
                                        <th class="span6">
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
                                                        <!--img src="img/contact-img.png" class="img-circle avatar hidden-phone"/-->
                                                        <a href="javascript:{}" onclick="document.getElementById('statistic-${i.siteId}').submit();">
                                                            <b style="font-size: 14px">${i.siteName}</b>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${i.dateCreated}" pattern="yyyy-MM-dd HH:mm"/>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:{}" onclick="document.getElementById('endUser-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-group"></i> Show All Users
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="javascript:{}" onclick="document.getElementById('statistic-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-bar-chart"></i> View Statistic
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="javascript:{}" onclick="document.getElementById('setting-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-edit"></i> Change Settings
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="first">
                                                    <td>
                                                        <a href="javascript:{}" onclick="document.getElementById('statistic-${i.siteId}').submit();">
                                                            <!--img src="img/contact-img.png" class="img-circle avatar hidden-phone"/-->
                                                            <b style="font-size: 14px">${i.siteName}</b>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${i.dateCreated}" pattern="yyyy-MM-dd HH:mm"/>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:{}" onclick="document.getElementById('endUser-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-group"></i> Show All Users
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="javascript:{}" onclick="document.getElementById('statistic-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-bar-chart"></i> View Statistic
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="javascript:{}" onclick="document.getElementById('setting-${i.siteId}').submit();" style="text-decoration: none;">
                                                            <i class="icon-edit"></i> Change Settings
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    <form id="statistic-${i.siteId}" action="SiteStat" method="POST">
                                        <input type="hidden" name="site_id" value="${i.siteId}" />
                                        <input type="hidden" name="site_name" value="${i.siteName}" />
                                        <input type="hidden" name="mode" value="week" />
                                        <input type="hidden" name="length" value="6" />
                                    </form>
                                    <form id="setting-${i.siteId}" action="SiteSetting" method="POST">
                                        <input type="hidden" name="site_id" value="${i.siteId}" />
                                    </form>
                                    <form id="endUser-${i.siteId}" action="SiteEndUser" method="POST">
                                        <input type="hidden" name="site_id" value="${i.siteId}" />
                                        <input type="hidden" name="site_name" value="${i.siteName}" />
                                    </form>
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