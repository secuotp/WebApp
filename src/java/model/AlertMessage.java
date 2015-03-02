package model;

public class AlertMessage {
    public static final String[] SUCCESS = {"alert-success", "icon-ok-sign"};
    public static final String[] INFO = {"alert-info", "icon-exclamation-sign"};
    public static final String[] WARNING = {"", "icon-warning-sign"};
    public static final String[] ERROR = {"alert-error", "icon-remove-sign"};
    
    public static final String SUCCESS_MODE = "alert-success";
    public static final String INFO_MODE = "alert-info";
    public static final String WARNING_MODE = "";
    public static final String ERROR_MODE = "alert-error";
    
    public static final String OK_SIGN = "icon-ok-sign";
    public static final String EXCLAMATION_SIGN = "icon-exclamation-sign";
    public static final String WARNING_SIGN = "icon-exclamation-sign";
    public static final String REMOVE_SIGN = "icon-exclamation-sign";
    
    public static String create(String[] mode, String message){
        String msg = "<div style=\"margin:10px 10px 0 10px\" class=\"alert "+ mode[0] +"\">"
                + "<i class=\""+ mode[1] +"\" ></i>"
                + message
                + "</div>";
        
        return msg;
    }
    
    public static String create(String mode, String icon, String message){
        String msg = "<div style=\"margin:10px 10px 0 10px\" class=\"alert "+ mode +"\">"
                + "<i class=\""+ icon +"\" ></i>"
                + message
                + "</div>";
        return msg;
    }
}
