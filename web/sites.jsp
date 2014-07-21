<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - My Sites</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="users-list">
                    <div class="row-fluid header">
                        <form action="GetSites" method="POST">
                            <h3>My Sites</h3>
                            <div class="span10 pull-right">
                                <input type="text" name="site_name" class="span7 search" placeholder="Type a site's name...">
                                <input type="hidden" name="path" value="mysi2"/>
                                <a href="new-user.jsp" class="btn-flat success pull-right">
                                    <span>+</span>
                                    NEW SITE
                                </a>
                            </div>
                        </form>
                    </div>

                    <!-- Users table -->
                    <div class="row-fluid table">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="span4" style="padding-top: 2%;">
                                        Name
                                    </th>
                                    <th class="span3" style="padding-top: 2%;">
                                        Created date
                                    </th>
                                    <th class="span2" style="padding-top: 2%;">
                                        Total users
                                    </th>
                                    <th class="span3 align-right" style="padding-top: 2%;">
                                        Options
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- row -->
                                <c:forEach items="${sites}" var="site">
                                <form id="statistic-${site.site_id}" action="Statistic" method="POST">
                                    <input type="hidden" name="site_id" value="${site.site_id}" />
                                    <input type="hidden" name="site_name" value="${site.site_name}" />
                                </form>
                                <form id="site-admin-${site.site_id}" action="SiteAdmin" method="POST">
                                    <input type="hidden" name="site_id" value="${site.site_id}" />
                                    <input type="hidden" name="site_name" value="${site.site_name}" />
                                </form>
                                <form id="edit-site-${site.site_id}" action="EditSite" method="POST"><input type="hidden" name="site_id" value="${site.site_id}" /></form>
                                <tr>
                                    <td>
                                        <img src="img/none.jpg" class="img-circle avatar hidden-phone">
                                        <input type="hidden" name="site_id" value="${site.site_id}" />
                                        <a class="name" href="javascript:{}" onclick="document.getElementById('statistic-${site.site_id}').submit();">${site.site_name}</a>
                                        <span class="subtext">${site.description}</span>
                                    </td>
                                    <td>
                                        ${site.date_created}
                                    </td>
                                    <td>
                                        ${site.user_count}
                                    </td>
                                    <td class="align-right">
                                        <a href="javascript:{}" onclick="document.getElementById('statistic-${site.site_id}').submit();"><span class="btn-flat white"><i class="icon-bar-chart"></i></span></a>
                                        <a href="javascript:{}" onclick="document.getElementById('site-admin-${site.site_id}').submit();"><span class="btn-flat white"><i class="icon-group"></i></span></a>
                                        <a href="javascript:{}" onclick="document.getElementById('edit-site-${site.site_id}').submit();"><span class="btn-flat white"><i class="icon-wrench"></i></span></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- end users table -->
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