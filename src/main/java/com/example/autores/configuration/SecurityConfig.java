package com.example.autores.configuration;

import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@EnableWebSecurity
public class SecurityConfig {

    public InMemoryUserDetailsManager config() {
        UserDetails userDetails = User.withDefaultPasswordEncoder()
                .username("12345")
                .password("12345")
                .roles("ADMIN").build();
        return new InMemoryUserDetailsManager(userDetails);
    }
}
