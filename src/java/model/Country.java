/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author zenology
 */
public class Country {
    private int countryId;
    private String countryName;

    public Country(int countryId, String countryName) {
        this.countryId = countryId;
        this.countryName = countryName;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
    
    // Static Method
    public static ArrayList<Country> getAllCountry() throws ClassNotFoundException, SQLException{
        ArrayList<Country> list = new ArrayList<>();
        String sql = "SELECT * FROM country";
        
        Connection con = ConnectionAgent.getInstance();
        Statement s = con.createStatement();
        ResultSet rs = s.executeQuery(sql);
        
        while(rs.next()){
            Country c = new Country(rs.getInt(1), rs.getString(2));
            list.add(c);
        }
        
        return list;
    }
}
