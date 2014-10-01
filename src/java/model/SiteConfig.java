/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author zenology
 */
public class SiteConfig {
    private int siteConfigId;
    private String pattern;
    private int length;
    private boolean siteCanDisabled;
    private String timeZone;

    public int getSiteConfigId() {
        return siteConfigId;
    }

    public void setSiteConfigId(int siteConfigId) {
        this.siteConfigId = siteConfigId;
    }

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public boolean isSiteCanDisabled() {
        return siteCanDisabled;
    }

    public void setSiteCanDisabled(boolean siteCanDisabled) {
        this.siteCanDisabled = siteCanDisabled;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    
}
