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
                                    <th class="span6 sortable">
                                        Name
                                    </th>
                                    <th class="span3 sortable">
                                        <span class="line"></span>Created date
                                    </th>
                                    <th class="span2 sortable">
                                        <span class="line"></span>Total users
                                    </th>
                                    <th class="span1 sortable align-right">
                                        <span class="line"></span>Option
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- row -->
                            <c:forEach items="${sites}" var="sis">
                                <tr>
                                    <td>
                                        <img src="img/none.jpg" class="img-circle avatar hidden-phone">
                                        <form id="statistic-of-site-${sis.site_id}" action="Statistic" method="POST">
                                            <input type="hidden" name="site_id" value="${sis.site_id}" />
                                            <a class="name" href="javascript:{}" onclick="document.getElementById('statistic-of-site-${sis.site_id}').submit();">${sis.site_name}</a>
                                            <span class="subtext">${sis.description}</span>
                                        </form>
                                    </td>
                                    <td>
                                        ${sis.date_created}
                                    </td>
                                    <td>
                                        ${sis.user_count}
                                    </td>
                                    <td class="align-right">
                                        <form id="edit_site${sis.site_id}" action="EditSite" method="POST">
                                            <input type="hidden" name="ssid" value="${sis.site_id}" />
                                            <a href="javascript:{}" onclick="document.getElementById('edit_site${sis.site_id}').submit();"><div class="btn-glow"><i class="icon-wrench"></i></div></a>
                                        </form>
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