package com.example.autores.modelo;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Entity
@Data
@Table(schema = "dbo", name = "publishers")
public class Editorial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pub_id")
    private Integer id;
    @Column(name = "pub_name")
    private String editorial;
    @Column(name = "city")
    private String ciudad;
    @Column(name = "state")
    private String estado;
    @Column(name = "country")
    private String pais;

    @OneToMany(mappedBy = "publishers")
    private List<TituloAutor> autorList;
    @OneToMany(mappedBy = "editorial")
    private Collection<TituloAutor> tituloAutor;

    public Collection<TituloAutor> getTituloAutor() {
        return tituloAutor;
    }

    public void setTituloAutor(Collection<TituloAutor> tituloAutor) {
        this.tituloAutor = tituloAutor;
    }
}
