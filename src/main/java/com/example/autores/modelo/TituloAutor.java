package com.example.autores.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(schema = "dbo", name = "titleauthor")
public class TituloAutor {

    @EmbeddedId
    private TituloAutorPK tituloAutorPK;

    @Column(name = "au_ord")
    private Integer autorOrden;

    @Column(name = "royaltyper")
    private Integer royalTyper;

    @ManyToOne
    @MapsId("titleID")
    @JsonManagedReference
    @JoinColumn(name = "title_id", insertable = false, updatable = false )
    private Titulos titulos;

    @ManyToOne
    @JoinColumn(name = "title_id", insertable = false, updatable = false )
    private Editorial editorial;
}
