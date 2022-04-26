package com.elstr.dto;


//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
public class CityDto {

    private Long id;
    private String cityName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
}
