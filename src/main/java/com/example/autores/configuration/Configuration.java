package com.example.autores.configuration;

import org.springframework.boot.jdbc.DataSourceBuilder;

import javax.sql.DataSource;

@org.springframework.context.annotation.Configuration
public class Configuration {

    public DataSource getDataSource() {
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.url("jdbc:sqlserver://192.168.10.136;databaseName=SCAD;TrustServerCertificate=True;");
        dataSourceBuilder.username("UCEM_IRENE");
        dataSourceBuilder.password("1234");
        return dataSourceBuilder.build();
    }
}
