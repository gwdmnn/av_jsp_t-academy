package com.posts.dao;

import com.posts.entidades.Post;
import com.posts.entidades.Usuario;
import com.posts.utils.Conexão;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class daoUsuario {

    List<Usuario> usuarios = new ArrayList<Usuario>();

    public static String salvar(Usuario u){
        Connection con = Conexão.conectar();
        if(con != null){
            String sql = "INSERT INTO usuarios(nome_usuario, senha_usuario, nivel_acesso)" +
                    "values(?,?,1)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,u.getNomeUsuario());
                stm.setString(2,u.getSenhaUsuario());
                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

    public  static List<Usuario> listar(){
        List<Usuario> lista = new ArrayList<Usuario>();
        Connection con = Conexão.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement("select * from usuarios");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt("id_usuario"));
                    u.setNomeUsuario(rs.getString("nome_usuario"));
                    u.setSenhaUsuario(rs.getString("senha_usuario"));
                    u.setNivelAcesso(rs.getInt("nivel_acesso"));
                    lista.add(u);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }
}
