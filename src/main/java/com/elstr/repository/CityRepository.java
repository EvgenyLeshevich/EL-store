package com.elstr.repository;

import com.elstr.entities.address.City;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CityRepository extends JpaRepository<City, Long> {

    City findByCityName(String cityName);

}
