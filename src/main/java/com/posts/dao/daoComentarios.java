package com.posts.dao;

import com.posts.entidades.Comentario;
import com.posts.utils.Conexão;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class daoComentarios {

    List<Comentario> comentarios = new ArrayList<Comentario>();


    public  static List<Comentario> listar(int idPost){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexão.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement("SELECT * FROM comentarios" + "INNER JOIN usuarios"+
                                "ON comentarios.usuarios_id_usuario = usuarios.id_usuario" + "WHERE posts_id_post = ?");
                stm.setInt(1, idPost);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Comentario c = new Comentario();
                    c.setIdComentario(rs.getInt("id_comentario"));
                    c.setConteudoComentario(rs.getString("conteudo_comentario"));
                    c.setIdPost(rs.getInt("posts_id_post"));
                    c.setNomeUsuario(rs.getString("nome_usuario"));
                    c.setComentarioLiberado(rs.getString("comentario_liberado"));
                    lista.add(c);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static String salvar(Comentario c){
        Connection con = Conexão.conectar();
        if(con != null){
            String sql = "INSERT INTO comentarios (conteudo_comentario, usuarios_id_usuario, posts_id_post, comentario_liberado)" +
                    "values(?,?,?,'não')";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,c.getConteudoComentario());
                stm.setInt(2,c.getIdUsuario());
                stm.setInt(3, c.getIdPost());
                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

}
