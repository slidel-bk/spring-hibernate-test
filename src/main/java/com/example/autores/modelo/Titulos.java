package com.example.autores.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Table(schema = "dbo", name = "titles")
public class Titulos {
    @Id
    @Column(name = "title_id")
    private Integer titleID;
    @Column(name = "title")
    private String titulo;
    @Column(name = "type")
    private String tipo;
    @ManyToOne
    @JoinColumn(name = "pub_id", referencedColumnName = "pub_id")
    private Editorial editorial;
    @Column(name = "price")
    private Double precio;

    @OneToMany(mappedBy = "titulos", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<TituloAutor> tituloAutorLista;
}
