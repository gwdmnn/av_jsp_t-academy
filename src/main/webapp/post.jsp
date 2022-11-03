<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.posts.entidades.Post" %>
<%@ page import="com.posts.dao.daoPostagem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.posts.dao.daoComentarios" %>
<%@ page import="com.posts.entidades.Comentario" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script>

      function setUser(){
        if(JSON.parse(sessionStorage.getItem('usuario')) != null){
        var user = JSON.parse(sessionStorage.getItem('usuario')).nomeUsuario
        user = user.substr(0, (user).indexOf("@"))
        var id = JSON.parse(sessionStorage.getItem('usuario')).idUsuario
        document.getElementById("userNovoComentario").placeholder = user + "#" + id;

        }
      }

      function disableField(){
        if(JSON.parse(sessionStorage.getItem('usuario')) == null){
          document.getElementById("CommentField").disabled = true;
          document.getElementById("botaoEnviarComentario").disabled = true;
          document.getElementById("CommentField").placeholder = "Fazer login para comentar"
        }

      }
      
    </script>

    <title>Document</title>
</head>
<body onload="setUser(), disableField()">

    <div>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="index.jsp">Home</a>
                  <a class="nav-link" href="login.jsp">Login</a>
                </div>
              </div>
            </div>
          </nav>
    </div>

<%
    String idPost = request.getParameter("id");
    Post p = daoPostagem.consultar(Integer.parseInt(idPost));
%>

<div class="container">
    <%
        out.write("<div class='card'>");
        out.write("<div class='card-header'>");
        out.write("</div>");
        out.write("<div class='card-body'>");
        out.write("<h5 class='card-title'>"+p.getTitulo()+"</h5>");
        out.write("<p class='card-text'>"+p.getConteudo()+"</p>");
        out.write(" </div>");
        out.write("</div> <hr>");

        out.write("<div class='card'>");
        out.write("<div class='card-header'>");
        out.write("Comentários");
        out.write("</div>");

        List<Comentario> lista = daoComentarios.listar(Integer.parseInt(idPost));
        for(Comentario c : lista){
        out.write("<div class='card-body'>");
        out.write("<blockquote class='blockquote mb-0'>");
        out.write("<p class='h6': 'medium'>'"+ c.getConteudoComentario()+"'</p>");
        out.write("<br>");
        out.write("<h6><footer class='blockquote-footer'>" + c.getNomeUsuario() + "<cite title='Source Title'>Source Title</cite></footer></h6>");
        out.write("</blockquote>");
        out.write("</div>");
        out.write("<hr>");
        out.write("</div>");
        }

        String comentario = "";
        String usuario = "";

%>

        <div class='card'>
            <div class='card-header'>Escrever comentário</div>
        <%
        out.write("<form action='post.jsp?id=" + idPost + "' method='POST'>");
        %>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Usuário</label>
            <input type="email" class="form-control" id="userNovoComentario" name="usuario" disabled>

          </div>
          <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Comentário</label>
            <textarea class="form-control" id="CommentField" rows="3" name="comentario"></textarea>
          </div>
        
          <button class="btn btn-primary" type="submit" id="botaoEnviarComentario">Enviar</button>

        </form>
<%
        comentario = request.getParameter("comentario");
        usuario = request.getParameter("usuario");


        if (usuario != null && !usuario.isEmpty()){
            String[] arr = usuario.split("#");
            String idUsuario = arr[1];

                   if(comentario != null && !comentario.isEmpty()){

                       Comentario c = new Comentario(comentario, Integer.parseInt(idUsuario), Integer.parseInt(idPost));
                       String retorno = daoComentarios.salvar(c);
                       response.sendRedirect("index.jsp");
                   }

        }





%>

 
        </div>

</body>
</html>