package com.example.autores.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;

@org.springframework.context.annotation.Configuration
public class Configuration {

    @Value("${usr}")
    private String usr;

    @Value("${pass}")
    private String pass;

    @Bean
    public DataSource getDataSource() {
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.url("jdbc:sqlserver://192.168.10.136;databaseName=SCAD;TrustServerCertificate=True;");
        dataSourceBuilder.username(usr); //UCEM_IRENE
        dataSourceBuilder.password(pass); //1234
        return dataSourceBuilder.build();
    }
}
