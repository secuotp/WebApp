<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - My Site</title>
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="users-list">
                    ${msg}
                    <div class="row-fluid header">
                        <h3>${site_name}'s Site</h3>
                    </div>

                    <!-- Admins table -->
                    <div class="row-fluid table">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="span2" style="padding-top: 2%;">
                                        Username
                                    </th>
                                    <th class="span3" style="padding-top: 2%;">
                                        Name
                                    </th>
                                    <th class="span2" style="padding-top: 2%;">
                                        Email
                                    </th>
                                    <th class="span2" style="padding-top: 2%;">
                                        Role
                                    </th>
                                    <th class="span3 align-right" style="padding-top: 2%;">
                                        Options
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- rows -->
                                <c:forEach items="${admins}" var="admin">
                                <form id="remove-admin-${admin.username}" action="RemoveSiteAdmin" method="POST">
                                    <input type="hidden" name="site_id" value="${site_id}"/>
                                    <input type="hidden" name="site_name" value="${site_name}"/>
                                    <input type="hidden" name="username" value="${admin.username}"/>
                                </form>
                                <tr>
                                    <td>
                                        ${admin.username}
                                    </td>
                                    <td>
                                        ${admin.firstname} ${admin.lastname}
                                    </td>
                                    <td>
                                        ${admin.email}
                                    </td>
                                    <td>
                                        ${admin.role}
                                    </td>
                                    <td class="align-right">
                                        <c:choose>
                                            <c:when test="${admin.role == 'Owner'}">
                                                <span style="margin-right: 10%" class="icon-user"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:{}" onclick="document.getElementById('remove-admin-${admin.username}').submit();">
                                                    <span class="btn-flat white"><i class="icon-remove"></i></span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <!-- End of admins table -->

                    <!-- Add New Admn -->
                    <form action="AddSiteAdmin" method="POST">
                        <b class="span2" style="padding-top: 0.5%;">Add New Moderator</b>
                        <input type="hidden" name="site_id" value="${site_id}"/>
                        <input type="hidden" name="site_name" value="${site_name}"/>
                        <input type="text" name="username" class="span7" placeholder="Specify an username"/>
                        <input type="submit" value="SAVE" class="btn-flat primary pull-right"/>
                    </form>
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