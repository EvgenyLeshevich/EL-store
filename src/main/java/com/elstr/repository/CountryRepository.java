package com.elstr.repository;

import com.elstr.entities.address.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Long> {

    Country findByCountryName(String countryName);
}
