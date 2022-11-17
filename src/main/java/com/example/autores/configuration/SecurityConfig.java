package com.example.autores.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.SqlReturnType;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
public class SecurityConfig {

    @Value("${secUser}")
    private String secureUser;

    @Value("${secPass}")
    private String securePass;


    @Bean
    public InMemoryUserDetailsManager config() {
        UserDetails userDetails = User.withDefaultPasswordEncoder()
                .username(secureUser) //123
                .password(securePass) //123
                .roles("ADMIN").build();
        return new InMemoryUserDetailsManager(userDetails);
    }

    @Bean
    public SecurityFilterChain configure(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .csrf()
                .disable()
                .authorizeRequests()
                .antMatchers("autores/swagger-ui/**")
                .authenticated()
                .and()
                .httpBasic(Customizer.withDefaults()).build();
    }

    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/custom/notSecurity/notSecure");
    }
}
