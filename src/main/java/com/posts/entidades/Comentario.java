package com.posts.entidades;

public class Comentario {
    private int idComentario;
    private String conteudoComentario;
    private int idUsuario;
    private String nomeUsuario;
    private int idPost;
    private String comentarioLiberado;

    public Comentario() {
    }

    public Comentario(int idComentario, String conteudoComentario, int idUsuario, String nomeUsuario, int idPost, String comentarioLiberado) {
        this.idComentario = idComentario;
        this.conteudoComentario = conteudoComentario;
        this.idUsuario = idUsuario;
        this.nomeUsuario = nomeUsuario;
        this.idPost = idPost;
        this.comentarioLiberado = comentarioLiberado;
    }

    public Comentario(String conteudoComentario, int idUsuario, int idPost) {
        this.conteudoComentario = conteudoComentario;
        this.idUsuario = idUsuario;
        this.idPost = idPost;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getConteudoComentario() {
        return conteudoComentario;
    }

    public void setConteudoComentario(String conteudoComentario) {
        this.conteudoComentario = conteudoComentario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public String getComentarioLiberado() {
        return comentarioLiberado;
    }

    public void setComentarioLiberado(String comentarioLiberado) {
        this.comentarioLiberado = comentarioLiberado;
    }
}
