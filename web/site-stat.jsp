<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secu OTP - Site Statistic</title>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />

        <div class="content">
            <div class="container-fluid">

                <!-- upper main stats -->
                <div class="span12" style="padding: 30px 0;">

                    <h2>${site_name}'s Statistic</h2><br>

                    <span style="text-align: center;">
                        <div class="span2">
                            <h4>
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${request_summary}" /></span>
                                Requests
                            </h4>
                        </div>
                        <div class="span2">
                            <h4>
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${user_summary}" /></span>
                                Users
                            </h4>
                        </div>
                        <div class="span2">
                            <h4>
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${sms_summary}" /></span>
                                SMS
                            </h4>
                        </div>
                        <div style="span1">
                                <h4>
                                    <div class="btn-group pull-right">
                                        <a href="javascript:{}" onclick="document.getElementById('week').submit();">
                                            <button class="glow left" active>WEEK</button>
                                        </a>
                                        <a href="javascript:{}" onclick="document.getElementById('month').submit();">
                                            <button class="glow middle">MONTH</button>
                                        </a>
                                        <a href="javascript:{}" onclick="document.getElementById('year').submit();">
                                            <button class="glow right">YEAR</button>
                                        </a>
                                    </div>
                                </h4>
                            <div class="span12">
                                <canvas id="canvas"></canvas>
                            </div>
                        </div>
                    </span>
                </div>
                <!-- end upper main stats -->

                <div id="pad-wrapper">
                    <form id="week" action="Statistic" method="POST">
                        <input type="hidden" name="site_id" value="${site_id}" />
                        <input type="hidden" name="site_name" value="${site_name}" />
                        <input type="hidden" name="mode" value="week" />
                        <input type="hidden" name="length" value="6" />
                    </form>
                    <form id="month" action="Statistic" method="POST">
                        <input type="hidden" name="site_id" value="${site_id}" />
                        <input type="hidden" name="site_name" value="${site_name}" />
                        <input type="hidden" name="mode" value="month" />
                        <input type="hidden" name="length" value="5" />
                    </form>
                    <form id="year" action="Statistic" method="POST">
                        <input type="hidden" name="site_id" value="${site_id}" />
                        <input type="hidden" name="site_name" value="${site_name}" />
                        <input type="hidden" name="mode" value="year" />
                        <input type="hidden" name="length" value="11" />
                    </form>
                    <!-- statistics chart built with jQuery Flot -->

                    <!-- end of statistics chart -->
                </div>
            </div>
        </div>

        <!-- statistics chart source -->

        <script>
                    var lineChartData = {
                    labels: [
                            <c:forEach var = "i" begin = "0" end = "${length}" >
                                <c:choose >
                                    <c:when test = "${i == 6}" >"${unit[i]}"</c:when>
                                    <c:otherwise >"${unit[i]}",</c:otherwise>
                                </c:choose>
                            </c:forEach>
                    ],
                            datasets: [
                            {
                            label: "User dataset",
                                    fillColor: "rgba(41,128,185,0.2)",
                                    strokeColor: "rgba(41,128,185,1)",
                                    pointColor: "rgba(41,128,185,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(41,128,185,1)",
                                    data: [
                                            <c:forEach var = "i" begin = "0" end = "${length}" >
                                                <c:choose >
                                                    <c:when test = "${i == 6}" >${user[i]}</c:when>
                                                    <c:otherwise >${user[i]},</c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                    ]
                            },
                            {
                            label: "Request dataset",
                                    fillColor: "rgba(49,165,166,0.2)",
                                    strokeColor: "rgba(49,165,166,1)",
                                    pointColor: "rgba(49,165,166,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(49,165,166,1)",
                                    data: [
                                            <c:forEach var = "i" begin = "0" end = "${length}" >
                                                <c:choose >
                                                    <c:when test = "${i == 6}" >${req[i]}</c:when>
                                                    <c:otherwise >${req[i]},</c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                    ]
                            },
                            {
                            label: "SMS dataset",
                                    fillColor: "rgba(39,174,96,0.2)",
                                    strokeColor: "rgba(39,174,96,1)",
                                    pointColor: "rgba(39,174,96,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(39,174,96,1)",
                                    data: [
                                            <c:forEach var = "i" begin = "0" end = "${length}" >
                                                <c:choose >
                                                    <c:when test = "${i == 6}" >${sms[i]}</c:when>
                                                    <c:otherwise >${sms[i]},</c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                    ]
                            }
                            ]
                    }
            window.onload = function() {
            var ctx = document.getElementById("canvas").getContext("2d");
                    window.myLine = new Chart(ctx).Line(lineChartData, {
            responsive: true
            });
            }
        </script>

        <!-- end of statistics chart source -->

        <script src="js/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- knob -->
        <script src="js/jquery.knob.js"></script>
        <!-- flot charts -->
        <script src="js/jquery.flot.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.js"></script>
        <script src="js/theme.js"></script>

        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
