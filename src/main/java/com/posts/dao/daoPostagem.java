package com.posts.dao;

import com.posts.entidades.Post;
import com.posts.utils.Conexão;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class daoPostagem {
    public static List<Post> postagens = new ArrayList<Post>();

    public static String testarConexao(){
        if (Conexão.conectar() != null){
            return "conectado";

        }
        return "erro de conexão";
    }


    public static String salvar(Post p){
        Connection con = Conexão.conectar();
        if(con != null){
            String sql = "INSERT INTO posts(titulo_post, conteudo_post, moderadores_id_moderador)" +
                    "values(?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,p.getTitulo());
                stm.setString(2,p.getConteudo());
                stm.setInt(3, p.getIdModerador());
                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

    public  static List<Post> listar(){
        List<Post> lista = new ArrayList<Post>();
        Connection con = Conexão.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from posts ORDER BY id_post DESC LIMIT 10");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Post p = new Post();
                    p.setIdPost(rs.getInt("id_post"));
                    p.setTitulo(rs.getString("titulo_post"));
                    p.setConteudo(rs.getString("conteudo_post"));
                    p.setIdModerador(rs.getInt("moderadores_id_moderador"));
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Post consultar(int id){
        Connection con = Conexão.conectar();
        Post p = new Post();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("SELECT * FROM posts WHERE id_post = ?");
                stm.setInt(1,id);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    p.setIdPost(rs.getInt("id_post"));
                    p.setTitulo(rs.getString("titulo_post"));
                    p.setConteudo(rs.getString("conteudo_post"));
                    p.setIdModerador(rs.getInt("moderadores_id_moderador"));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }

}
