package com.example.autores.repo.dao;

import com.example.autores.modelo.Autores;

import java.util.List;

public interface AutorDao {

    List<Autores> obtenerListaAutores();

    Autores obtenerAutorPorID(Integer id);

    void guardar(Autores autores);

    void eliminar(Integer id);
}
