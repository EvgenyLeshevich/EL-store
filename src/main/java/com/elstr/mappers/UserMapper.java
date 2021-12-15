package com.elstr.mappers;

import com.elstr.dto.UserDto;
import com.elstr.entities.user.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserMapper {

    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    @Mapping(target = "apartmentAddress", source = "user.address.apartmentAddress")
    @Mapping(target = "postcode", source = "user.address.postcode")
    @Mapping(target = "countryName", source = "user.address.country.countryName")
    @Mapping(target = "cityName", source = "user.address.city.cityName")
    UserDto toDto(User user);

    @Mapping(target = "address.apartmentAddress", source = "apartmentAddress")
    @Mapping(target = "address.postcode", source = "postcode")
    @Mapping(target = "address.country.countryName", source = "countryName")
    @Mapping(target = "address.city.cityName", source = "cityName")
    User toEntity(UserDto userDto);

}
