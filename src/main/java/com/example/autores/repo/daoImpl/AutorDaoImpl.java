package com.example.autores.repo.daoImpl;

import com.example.autores.modelo.Autores;
import com.example.autores.modelo.Mapper.AutorMapper;
import com.example.autores.repo.dao.AutorDao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AutorDaoImpl implements AutorDao {

    private JdbcTemplate jdbcTemplate;

    public AutorDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Autores> obtenerListaAutores() {
        return jdbcTemplate.query("select * from [authors]", new AutorMapper());
    }

    @Override
    public Autores obtenerAutorPorID(Integer id) {
        return jdbcTemplate.queryForObject("select * from [authors] a where a.au_id = ?", new AutorMapper(), id);
    }

    @Override
    public void guardar(Autores autores) {
        jdbcTemplate.update("INSERT INTO [dbo].[authors](au_lname, au_fname, phone, address, city, state, zip, contract) values (?,?,?,?,?,?,?,?)"
        , autores.getApellido(), autores.getNombre(), autores.getTelefono(), autores.getDireccion(), autores.getCiudad(), autores.getDepartamento(), autores.getCodigoPostal(), autores.getEstado());
    }

    @Override
    public void eliminar(Integer id) {
        Map<String, Object> delete = new HashMap<>();
        delete.put("au_id", id);
        jdbcTemplate.update("DELETE FROM [dbo].[authors] WHERE au_id = ?", delete);
    }
}
