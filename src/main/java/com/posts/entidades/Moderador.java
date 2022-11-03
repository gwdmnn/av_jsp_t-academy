package com.posts.entidades;

public class Moderador {
    private int idModerador;
    private String nomeModerador;
    private String senhaModerador;

    public Moderador() {
    }

    public Moderador(int idModerador, String nomeModerador, String senhaModerador) {
        this.idModerador = idModerador;
        this.nomeModerador = nomeModerador;
        this.senhaModerador = senhaModerador;
    }

    public int getIdModerador() {
        return idModerador;
    }

    public void setIdModerador(int idModerador) {
        this.idModerador = idModerador;
    }

    public String getNomeModerador() {
        return nomeModerador;
    }

    public void setNomeModerador(String nomeModerador) {
        this.nomeModerador = nomeModerador;
    }

    public String getSenhaModerador() {
        return senhaModerador;
    }

    public void setSenhaModerador(String senhaModerador) {
        this.senhaModerador = senhaModerador;
    }
}
