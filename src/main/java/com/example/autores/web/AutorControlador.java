package com.example.autores.web;

import com.example.autores.modelo.Autores;
import com.example.autores.service.AutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/autores")
public class AutorControlador {

    public AutorService autorService;

    @Autowired
    public AutorControlador(AutorService autorService) {
        this.autorService = autorService;
    }

    @GetMapping("/autores")
    public List<Autores> obtenerAutores() {
        return autorService.listaAutores();
    }

    @GetMapping("/buscar/{id}")
    public Autores obtenerAutor(@PathVariable Integer id) {
        return autorService.obtenerAutor(id);
    }

    @PostMapping("/guardar")
    public void guardarAutor(@RequestBody Autores autores) {
        autorService.guardar(autores);
    }

    @DeleteMapping("/eliminar/{id}")
    public void eliminarAutor(@PathVariable Integer id) {
        autorService.eliminar(id);
    }
}
