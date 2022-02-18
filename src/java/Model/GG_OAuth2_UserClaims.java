package Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ADMIN
 */
public class GG_OAuth2_UserClaims {

    private String sub;
    private String email;
    private boolean email_verified;
    private String name;
    private String given_name;
    private String family_name;
    private String profile;
    private String picture;
    private String locale;
    private String hd;

    public GG_OAuth2_UserClaims() {
    }

    public GG_OAuth2_UserClaims(String sub, String email, boolean email_verified, String name, String given_name, String family_name, String profile, String picture, String locale, String hd) {
        this.sub = sub;
        this.email = email;    
        this.email_verified = email_verified;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.profile = profile;
        this.picture = picture;
        this.locale = locale;
        this.hd = hd;
    }

    public GG_OAuth2_UserClaims(String sub, String email, boolean email_verified, String name, String given_name, String family_name, String profile, String picture, String locale) {
        this.sub = sub;
        this.email = email;
        this.email_verified = email_verified;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.profile = profile;
        this.picture = picture;
        this.locale = locale;
    }

    public String getHd() {
        return hd;
    }

    public void setHd(String hd) {
        this.hd = hd;
    }

   

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEmail_verified() {
        return email_verified;
    }

    public void setEmail_verified(boolean email_verified) {
        this.email_verified = email_verified;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    @Override
    public String toString() {
        return "GG_OAuth2_UserClaims{" + "sub=" + sub + ", email=" + email + ", email_verified=" + email_verified + ", name=" + name + ", given_name=" + given_name + ", family_name=" + family_name + ", profile=" + profile + ", picture=" + picture + ", locale=" + locale + ", hd=" + hd + '}';
    }

    
    
    
}
