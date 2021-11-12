package com.elstr.exmpl;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class City {
    private Long id;
    private String name;
    private Collection<Address> addressesById;
    private Collection<Country> countriesById;

    @Id
    @Column(name = "ID", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        City city = (City) o;
        return Objects.equals(id, city.id) && Objects.equals(name, city.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @OneToMany(mappedBy = "cityByCityId")
    public Collection<Address> getAddressesById() {
        return addressesById;
    }

    public void setAddressesById(Collection<Address> addressesById) {
        this.addressesById = addressesById;
    }

    @OneToMany(mappedBy = "cityByCityId")
    public Collection<Country> getCountriesById() {
        return countriesById;
    }

    public void setCountriesById(Collection<Country> countriesById) {
        this.countriesById = countriesById;
    }
}
