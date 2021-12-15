package com.elstr.dto;


//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
public class CountryDto {

    private Long id;
    private String countryName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
