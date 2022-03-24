package com.elstr.services;

import com.elstr.dto.UserDto;
import com.elstr.entities.address.Address;
import com.elstr.entities.address.City;
import com.elstr.entities.address.Country;
import com.elstr.entities.user.Role;
import com.elstr.entities.user.User;
import com.elstr.exceptions.UserAlreadyExistException;
import com.elstr.exceptions.UserPasswordException;
import com.elstr.repository.CityRepository;
import com.elstr.repository.CountryRepository;
import com.elstr.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private CityRepository cityRepository;

    @Autowired
    private MainSenderService mainSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public String addUser(Address address, User user, Country country, City city) {
        User userFromDb = userRepository.findByUsernameOrEmail(user.getUsername(), user.getEmail());
        String result = null;
        try {
            if (userFromDb.getUsername().equals(user.getUsername()) && userFromDb.getEmail().equals(user.getEmail())) {
                return "errorUsernameAndEmail";
            } else if (userFromDb.getEmail().equals(user.getEmail())) {
                return "errorEmail";
            } else if (userFromDb.getUsername().equals(user.getUsername())) {
                return "errorUsername";
            }
        } catch (NullPointerException ex) {
            City cityFromDB = cityRepository.findByCityName(city.getCityName());
            address.setCity(cityFromDB);

            Country countryFromDB = countryRepository.findByCountryName(country.getCountryName());
            address.setCountry(countryFromDB);

            user.setAddress(address);
            user.setActive(false);
            user.setRoles(Collections.singleton(Role.USER));
            user.setActivationCode(UUID.randomUUID().toString());
            user.setPassword(passwordEncoder.encode(user.getPassword()));

            userRepository.save(user);

            sendMessage(user);

            result = "additionSuccessful";
        }
        return result;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to EL-store. Please next link: http://34.159.8.40/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mainSender.send(user.getEmail(), "Activation code", message);
        }
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);

        userRepository.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    public void updateProfileGeneralInfo(User userSession, UserDto userDto) throws UserAlreadyExistException {
        if (!userSession.getName().equals(userDto.getName())
                || !userSession.getSurname().equals(userDto.getSurname())
                || !userSession.getPhoneNumber().equals(userDto.getPhoneNumber())
                || !userSession.getEmail().equals(userDto.getEmail())
                || !userSession.getAddress().getCountry().getCountryName().equals(userDto.getCountryName())
                || !userSession.getAddress().getCity().getCityName().equals(userDto.getCityName())
                || !userSession.getAddress().getPostcode().equals(userDto.getPostcode())
                || !userSession.getAddress().getApartmentAddress().equals(userDto.getApartmentAddress()))
        {
            userSession.setName(userDto.getName());
            userSession.setSurname(userDto.getSurname());
            userSession.setPhoneNumber(userDto.getPhoneNumber());
            userSession.setEmail(userDto.getEmail());
            userSession.getAddress().setCountry(countryRepository.findByCountryName(userDto.getCountryName()));
            userSession.getAddress().setCity(cityRepository.findByCityName(userDto.getCityName()));
            userSession.getAddress().setPostcode(userDto.getPostcode());
            userSession.getAddress().setApartmentAddress(userDto.getApartmentAddress());

            userRepository.save(userSession);
        } else {
            throw new UserAlreadyExistException("Пользователь уже существует!");
        }
    }

    public void updateProfilePassword(User userSession, String oldPassword, String newPassword) throws UserPasswordException {

        String userSessionPassword = userSession.getPassword();
        if (!oldPassword.isEmpty() && passwordEncoder.matches(oldPassword, userSessionPassword) && !newPassword.isEmpty()) {
            userSession.setPassword(passwordEncoder.encode(newPassword));
            userRepository.save(userSession);
        } else if (newPassword.isEmpty() && !oldPassword .isEmpty()) {
            throw new UserPasswordException("Данное поле не может быть пустым!");
        } else if (!passwordEncoder.matches(oldPassword, userSessionPassword)) {
            throw new UserPasswordException("Введенный пароль не совпадает с вашим!");
        }
    }
}
