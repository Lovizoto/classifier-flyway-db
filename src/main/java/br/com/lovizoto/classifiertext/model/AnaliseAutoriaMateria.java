package br.com.lovizoto.classifiertext.model;

import java.util.Date;

public class AnaliseAutoriaMateria {

    private int codParlamentar;
    private String nomeAutor;
    private int AnoIdentBasica;
    private Date datApresentacao;
    private String txtEmenta;
    private int codMateria;
    private String tipo;
    private String tema;
    private String subtema;

    public int getCodParlamentar() {
        return codParlamentar;
    }

    public void setCodParlamentar(int codParlamentar) {
        this.codParlamentar = codParlamentar;
    }

    public String getNomeAutor() {
        return nomeAutor;
    }

    public void setNomeAutor(String nomeAutor) {
        this.nomeAutor = nomeAutor;
    }

    public int getAnoIdentBasica() {
        return AnoIdentBasica;
    }

    public void setAnoIdentBasica(int anoIdentBasica) {
        AnoIdentBasica = anoIdentBasica;
    }

    public Date getDatApresentacao() {
        return datApresentacao;
    }

    public void setDatApresentacao(Date datApresentacao) {
        this.datApresentacao = datApresentacao;
    }

    public String getTxtEmenta() {
        return txtEmenta;
    }

    public void setTxtEmenta(String txtEmenta) {
        this.txtEmenta = txtEmenta;
    }

    public int getCodMateria() {
        return codMateria;
    }

    public void setCodMateria(int codMateria) {
        this.codMateria = codMateria;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getSubtema() {
        return subtema;
    }

    public void setSubtema(String subtema) {
        this.subtema = subtema;
    }
}
