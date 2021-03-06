<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - My Site</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/index.css" type="text/css" media="screen" />   
        <script src="js/Chart.js"></script>
    </head>
    <body>

        <jsp:include page="/header.jsp" flush="true" />

        <!-- main container -->
        <div class="content">

            <div class="container-fluid">

                <!-- upper main stats -->
                <div id="main-stats">
                    <div class="row-fluid stats-row">
                        <div class="span4 stat">
                            <div class="data">
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${request_summary}" /></span>
                                requests
                            </div>
                        </div>
                        <div class="span4 stat">
                            <div class="data">
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${user_summary}" /></span>
                                users
                            </div>
                        </div>
                        <div class="span4 stat last">
                            <div class="data">
                                <span class="number"><fmt:formatNumber type="number" pattern="#,###" value="${sms_summary}" /></span>
                                sms
                            </div>
                        </div>
                    </div>
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
                    <div class="row-fluid chart">
                        <h4>
                            Statistics of ${site_name}
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
                    <!-- end of statistics chart -->
                </div>
            </div>
        </div>

        <!-- statistics chart source -->

        <script>
                    var lineChartData = {
                    labels: [
            <c:forEach var="i" begin="0" end="${length}">
                <c:choose>
                    <c:when test="${i == 6}">
                    "${unit[i]}"
                    </c:when>
                    <c:otherwise>
                    "${unit[i]}",
                    </c:otherwise>
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
            <c:forEach var="i" begin="0" end="${length}">
                <c:choose>
                    <c:when test="${i == 6}">
                        ${user[i]}
                    </c:when>
                    <c:otherwise>
                        ${user[i]},
                    </c:otherwise>
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
            <c:forEach var="i" begin="0" end="${length}">
                <c:choose>
                    <c:when test="${i == 6}">
                        ${req[i]}
                    </c:when>
                    <c:otherwise>
                        ${req[i]},
                    </c:otherwise>
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
            <c:forEach var="i" begin="0" end="${length}">
                <c:choose>
                    <c:when test="${i == 6}">
                        ${sms[i]}
                    </c:when>
                    <c:otherwise>
                        ${sms[i]},
                    </c:otherwise>
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

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- knob -->
        <script src="js/jquery.knob.js"></script>
        <!-- flot charts -->
        <script src="js/jquery.flot.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.js"></script>
        <script src="js/theme.js"></script>
    </body>
</html>