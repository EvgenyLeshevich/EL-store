package com.elstr.services;

import com.elstr.entities.address.Address;
import com.elstr.entities.address.City;
import com.elstr.entities.address.Country;
import com.elstr.entities.user.Role;
import com.elstr.entities.user.User;
import com.elstr.exceptions.UserPasswordException;
import com.elstr.repository.CityRepository;
import com.elstr.repository.CountryRepository;
import com.elstr.repository.UserRepository;
import lombok.SneakyThrows;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    CityRepository cityRepository;

    @MockBean
    CountryRepository countryRepository;

    @MockBean
    PasswordEncoder passwordEncoder;

    @MockBean
    MainSenderService mailSender;


    @org.junit.Test
    public void addUser() {
        User user = new User();
        Address address = new Address();
        Country country = new Country();
        City city = new City();

        user.setEmail("some@mail.com");

        String isUserCreated = userService.addUser(address, user, country, city);

        Assert.assertEquals("additionSuccessful", isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));
        Mockito.verify(userRepository, Mockito.times(1)).save(user);
        Mockito.verify(mailSender, Mockito.times(1))
                .send(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    public void addUserFailTest() {
        User user = new User();
        Address address = new Address();
        Country country = new Country();
        City city = new City();

        user.setUsername("admin");
        user.setEmail("some@mail.com");

        Mockito.doReturn(user)
                .when(userRepository)
                .findByUsernameOrEmail("admin", "some@mail.com");

        String isUserCreated = userService.addUser(address, user, country, city);

        Assert.assertEquals("errorUsernameAndEmail", isUserCreated);
        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
        Mockito.verify(mailSender, Mockito.times(0))
                .send(
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    public void activateUser() {
        User user = new User();

        user.setActivationCode("some activation code");

        Mockito.doReturn(user)
                .when(userRepository)
                .findByActivationCode("activate");

        boolean isUserActivated = userService.activateUser("activate");

        Assert.assertTrue(isUserActivated);
        Assert.assertNull(user.getActivationCode());
        Assert.assertTrue(user.isActive());
        Mockito.verify(userRepository, Mockito.times(1)).save(user);
    }

    @Test
    public void activateUserFailTest() {
        boolean isUserActivated = userService.activateUser("activate");

        Assert.assertFalse(isUserActivated);
        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
    }
}