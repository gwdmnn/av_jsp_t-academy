package com.posts.entidades;

public class Post {
    private int idPost;
    private String titulo;
    private String conteudo;
    private int idModerador;

    public Post(String titulo, String conteudo, int idModerador) {;
        this.titulo = titulo;
        this.conteudo = conteudo;
        this.idModerador = idModerador;
    }

    public Post() {
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public int getIdModerador() {
        return (idModerador);
    }

    public void setIdModerador(int idModerador) {
        this.idModerador = idModerador;
    }
}


