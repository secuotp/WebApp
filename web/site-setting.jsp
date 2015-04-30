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

        <!-- main container -->
        <div class="content">
            <div class="container-fluid">
                <div id="pad-wrapper" class="new-user">
                    ${msg}${imgMsg}
                    <div class="row-fluid header">
                        <h2>Site Settings</h2>
                    </div>

                    <div class="row-fluid form-wrapper">
                        <div class="span12 with-sidebar">
                            <div class="container">
                                <!--img src="img/sit.gif" style="width:70px;" class="avatar img-circle" /-->
                                <c:forEach var="row" items="${siteList}">
                                    <form action="EditSiteSetting" method="POST" class="new_user_form inline-input">
                                        <p style="text-align: right; padding-right: 23%;">Disable: </p>
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

                                        <div class="span12 field-box">
                                            <label>Serial Number:</label>
                                            <input class="span9" type="text" value="${row.serialNumber}" disabled />
                                        </div>

                                        <input type="hidden" name="site_id" value="${row.siteId}" />

                                        <div class="span12 field-box">
                                            <label>Site Name:</label>
                                            <input class="span9" type="text" name="site_name" value="${row.siteName}" />
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
                                            <label>OTP Pattern:</label>
                                            <div class="ui-select">
                                                <select name="otpPattern">
                                                    <c:choose>
                                                        <c:when test="${row.otpPattern == '1'}">
                                                            <option value="1" selected="true">Numeric</option>
                                                            <option value="2">Hexadecimal</option>
                                                        </c:when>
                                                        <c:when test="${row.otpPattern == '2'}">
                                                            <option value="1">Numeric</option>
                                                            <option value="2" selected="true">Hexadecimal</option>
                                                        </c:when>
                                                    </c:choose>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span12 field-box">
                                            <label>OTP Length:</label>
                                            <div class="ui-select">
                                                <select name="otpLength">
                                                    <c:choose>
                                                        <c:when test="${row.otpLength == '4'}">
                                                            <option value="4" selected="true">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                        </c:when>
                                                        <c:when test="${row.otpLength == '5'}">
                                                            <option value="4">4</option>
                                                            <option value="5" selected="true">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                        </c:when>
                                                        <c:when test="${row.otpLength == 6}">
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6" selected="true">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            yes
                                                        </c:when>
                                                        <c:when test="${row.otpLength == '7'}">
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7" selected="true">7</option>
                                                            <option value="8">8</option>
                                                        </c:when>
                                                        <c:when test="${row.otpLength == '8'}">
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8" selected="true">8</option>
                                                        </c:when>
                                                    </c:choose>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span12 field-box">
                                            <label>OTP Time Zone:</label>
                                            <div class="ui-select">
                                                <select name="otpTimezone">
                                                    <c:choose>
                                                        <c:when test="${row.otpTimezone == 1}">
                                                            <option value="1" selected="true">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 2}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2" selected="true">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 3}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3" selected="true">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 4}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4" selected="true">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 5}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5" selected="true">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 6}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6" selected="true">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 7}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7" selected="true">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 8}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8" selected="true">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 9}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9" selected="true">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 10}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10" selected="true">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 11}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11" selected="true">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 12}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12" selected="true">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 13}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13" selected="true">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 14}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14" selected="true">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 15}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15" selected="true">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 16}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16" selected="true">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 17}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17" selected="true">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 18}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18" selected="true">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 19}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19" selected="true">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 20}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20" selected="true">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 21}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21" selected="true">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 22}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22" selected="true">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 23}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23" selected="true">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 24}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24" selected="true">GMT+11</option>
                                                            <option value="25">GMT+12</option>
                                                        </c:when>
                                                        <c:when test="${row.otpTimezone == 25}">
                                                            <option value="1">GMT-12</option>
                                                            <option value="2">GMT-11</option>
                                                            <option value="3">GMT-10</option>
                                                            <option value="4">GMT-9</option>
                                                            <option value="5">GMT-8</option>
                                                            <option value="6">GMT-7</option>
                                                            <option value="7">GMT-6</option>
                                                            <option value="8">GMT-5</option>
                                                            <option value="9">GMT-4</option>
                                                            <option value="10">GMT-3</option>
                                                            <option value="11">GMT-2</option>
                                                            <option value="12">GMT-1</option>
                                                            <option value="13">GMT</option>
                                                            <option value="14">GMT+1</option>
                                                            <option value="15">GMT+2</option>
                                                            <option value="16">GMT+3</option>
                                                            <option value="17">GMT+4</option>
                                                            <option value="18">GMT+5</option>
                                                            <option value="19">GMT+6</option>
                                                            <option value="20">GMT+7</option>
                                                            <option value="21">GMT+8</option>
                                                            <option value="22">GMT+9</option>
                                                            <option value="23">GMT+10</option>
                                                            <option value="24">GMT+11</option>
                                                            <option value="25" selected="true">GMT+12</option>
                                                        </c:when>
                                                    </c:choose>
                                                </select>
                                            </div>
                                        </div>
                                        <div style="margin-left: 70%;">
                                            <input type="submit" class="btn-flat primary" value="Change Settings">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="container">
                                <form action="FileUploadHandler" Method="POST" enctype="multipart/form-data" >
                                    
                                    <div class="span12 field-box" style="margin-bottom: 10px;">
                                        <img src="${row.image}"/>
                                        <label>App Picture:</label>
                                        <input style="margin-top: 30px; margin-left: 120px;" class="span9" type="file" name="image" />
                                    </div>
                                    
                                    <div style="margin-left: 70%;">
                                        <input type="submit" class="btn-flat primary" value="Change Image"/>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <!-- end main container -->

        <!-- scripts -->
        <script src="js/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
        <script src="js/bootstrap.datepicker.js"></script>

        <!-- call all plugins -->
        <script src="js/theme.js"></script>

        <!-- initialize this page scripts -->
        <script type="text/javascript">
                                            $(function () {
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
                                                $('.slider-button').click(function () {
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