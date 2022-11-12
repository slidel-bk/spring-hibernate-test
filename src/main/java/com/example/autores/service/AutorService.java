package com.example.autores.service;

import com.example.autores.modelo.Autores;
import com.example.autores.repo.dao.AutorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AutorService {

    public AutorDao autorDao;

    @Autowired
    public AutorService(AutorDao autorDao) {
        this.autorDao = autorDao;
    }

    public List<Autores> listaAutores () {
        return autorDao.obtenerListaAutores();
    }

    public Autores obtenerAutor(Integer id) {
        return autorDao.obtenerAutorPorID(id);
    }

    public void guardar(Autores autores) {
        autorDao.guardar(autores);
    }

    public void eliminar(Integer id) {
        autorDao.eliminar(id);
    }


}
