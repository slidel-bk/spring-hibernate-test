package com.example.autores.modelo;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class TituloAutorPK implements Serializable {

    @Column(name = "au_id")
    private Integer autorId;

    @Column(name = "title_id")
    private Integer tituloId;

    public Integer getAutorId() {
        return autorId;
    }

    public void setAutorId(Integer autorId) {
        this.autorId = autorId;
    }

    public Integer getTituloId() {
        return tituloId;
    }

    public void setTituloId(Integer tituloId) {
        this.tituloId = tituloId;
    }

    @Override
    public String toString() {
        return "TituloAutorPK{" +
                "autorId=" + autorId +
                ", tituloId=" + tituloId +
                '}';
    }
}
