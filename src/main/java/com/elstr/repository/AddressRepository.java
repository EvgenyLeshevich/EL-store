package com.elstr.repository;

import com.elstr.entities.address.Address;
import com.elstr.entities.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, Long> {
}
