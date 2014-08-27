/*global $, jQuery, alert*/
$("#step2").hide();
$("#step1-next").attr("disabled","true");

var userCheckup = 0; 
var passwordCheckup = 0; 
var emailCheckup = 0; 

function nextButtonClick() {
    $("#step1").hide();
    $("#step2").show();

    $("#step1-bar").removeClass("active");
    $("#step2-bar").addClass("active");
}

function previousButtonClick() {
    $("#step2").hide();
    $("#step1").show();

    $("#step2-bar").removeClass("active");
    $("#step1-bar").addClass("active");
}

function nextButtonHide(){
    if(userCheckup === 1 && passwordCheckup === 1 && emailCheckup === 1){
        $("#step1-next").attr("disabled","false");
    }else{
        $("#step1-next").attr("disabled","true");
    }
}

function usernameCheck() {
    var username = $("#step1-username").val();

    $("#step1-field-username").removeClass("success");
    $("#step1-field-username").removeClass("error");
    $("#step1-username-msg > i").removeClass("icon-ok-sign");
    $("#step1-username-msg > i").removeClass("icon-remove-sign");

    if (username.length >= 8) {
        $.post("UsernameAvailability", {
            username: username
        }, function (responseText) {
            if (responseText === "success") {
                $("#step1-field-username").addClass("success");
                $("#step1-username-msg > i").addClass("icon-ok-sign");
                $("#step1-username-msg > span").html("Valid Username");
                userCheckup = 1;
            } else {
                $("#step1-field-username").addClass("error");
                $("#step1-username-msg > i").addClass("icon-remove-sign");
                $("#step1-username-msg > span").html("Invalid Username");
                userCheckup = 0;
            }
        });
    } else {
        $("#step1-field-username").addClass("error");
        $("#step1-username-msg > i").addClass("icon-remove-sign");
        $("#step1-username-msg > span").html("User length must be equal or over than 8");
        userCheckup = 0;
    }
    
    nextButtonHide();
}

function passwordCheck() {
    var password1 = $("#step1-password-1").val();
    var password2 = $("#step1-password-2").val();

    $("#step1-field-password-1").removeClass("success");
    $("#step1-field-password-2").removeClass("success");
    $("#step1-field-password-1").removeClass("error");
    $("#step1-field-password-2").removeClass("error");
    $("#step1-password-msg > i").removeClass("icon-ok-sign");
    $("#step1-password-msg > i").removeClass("icon-remove-sign");

    if (password1 === password2) {
        if (password1.length >= 8) {
            $("#step1-field-password-1").addClass("success");
            $("#step1-field-password-2").addClass("success");
            $("#step1-password-msg > i").addClass("icon-ok-sign");
            $("#step1-password-msg > span").html("Valid Password");
            passwordCheckup = 1;
        } else {
            $("#step1-field-password-1").addClass("error");
            $("#step1-field-password-2").addClass("error");
            $("#step1-password-msg > i").addClass("icon-remove-sign");
            $("#step1-password-msg > span").html("Password length must be equal or over than 8");
            passwordCheckup = 0;
        }
    } else {
        $("#step1-field-password-1").addClass("error");
        $("#step1-field-password-2").addClass("error");
        $("#step1-password-msg > i").addClass("icon-remove-sign");
        $("#step1-password-msg > span").html("Password Mismatch");
        passwordCheckup = 0;
    }
    
    nextButtonHide();
}

function emailCheck() {
    var email = $("#step1-email").val();
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    $("#step1-field-email").removeClass("success");
    $("#step1-field-email").removeClass("error");
    $("#step1-email-msg > span").removeClass("icon-ok-sign");
    $("#step1-email-msg > span").removeClass("icon-remove-sign");
    if (re.test(email) !== true) {
        $("#step1-field-email").addClass("error");
        $("#step1-email-msg > i").addClass("icon-remove-sign");
        $("#step1-email-msg > span").html("Your Email is Invalid");
        emailCheckup = 0;
    } else {
        $("#step1-field-email").addClass("success");
        $("#step1-email-msg > i").addClass("icon-ok-sign");
        $("#step1-email-msg > span").html("Your Email is Valid");
        emailCheckup = 1;
    }
    
    nextButtonHide();
}