package model;

public class Address {
    String address;
    String city;
    int country_id;
    String postal_code;

    public Address() {
    }

    public Address(String address, String city, int country_id, String postal_code) {
        this.address = address;
        this.city = city;
        this.country_id = country_id;
        this.postal_code = postal_code;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getCountry_id() {
        return country_id;
    }

    public void setCountry_id(int country_id) {
        this.country_id = country_id;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }
    
    
}
