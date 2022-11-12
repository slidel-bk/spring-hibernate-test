package com.example.autores.modelo.Mapper;

import com.example.autores.modelo.Autores;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;


public class AutorMapper implements RowMapper<Autores> {

    @Override
    public Autores mapRow(ResultSet rs, int rowNum) throws SQLException {
        Autores autores = new Autores();
        autores.setNombre(rs.getString("au_lname"));
        autores.setApellido(rs.getString("au_fname"));
        autores.setTelefono(rs.getString("phone"));
        autores.setDireccion(rs.getString("address"));
        autores.setCiudad(rs.getString("city"));
        autores.setDepartamento(rs.getString("state"));
        autores.setCodigoPostal(rs.getString("zip"));
        autores.setEstado(rs.getBoolean("contract"));
        return autores;
    }
}
