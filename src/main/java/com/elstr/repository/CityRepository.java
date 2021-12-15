package com.elstr.repository;

import com.elstr.entities.address.City;
import com.elstr.entities.address.Country;
import com.elstr.entities.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CityRepository extends JpaRepository<City, Long> {

    City findByCityName(String cityName);

}
