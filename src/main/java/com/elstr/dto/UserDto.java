package com.elstr.dto;

import com.elstr.entities.user.Role;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Set;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
public class UserDto {

    private Long id;
    @Size(min = 2, max = 30, message = "Name should be between 2 and 30 characters")
    private String name;
    private String surname;
    @NotEmpty(message = "Phone number should not be empty")
    private String phoneNumber;
    @NotEmpty(message = "Email should not be empty")
    @Email(message = "Please enter a valid e-mail address")
    private String email;
    @NotEmpty(message = "Address should not be empty")
    private String apartmentAddress;
    @NotEmpty(message = "Post code should not be empty")
    private String postcode;
    @NotEmpty(message = "Country should not be empty")
    private String countryName;
    @NotEmpty(message = "City should not be empty")
    private String cityName;
    private Set<Role> roles;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getApartmentAddress() {
        return apartmentAddress;
    }

    public void setApartmentAddress(String apartmentAddress) {
        this.apartmentAddress = apartmentAddress;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
