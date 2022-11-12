package com.example.autores.modelo;

import lombok.Data;

@Data
public class Autores {

    private Integer id;
    private String nombre;
    private String apellido;
    private String telefono;
    private String direccion;
    private String ciudad;
    private String departamento;
    private String codigoPostal;
    private Boolean estado;
}
