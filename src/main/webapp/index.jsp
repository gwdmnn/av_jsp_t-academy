<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.posts.entidades.Post" %>
<%@ page import="com.posts.dao.daoPostagem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/av.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
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
    <div class="container">
        <%
        String retorno = daoPostagem.testarConexao();
        out.write(retorno);
        %>
    </div>

    <div class="container">
        <%
            List<Post> lista = daoPostagem.listar();
            for (Post p : lista){
                out.write("<div class='card'>");
                out.write("<div class='card-header'>");
                out.write("</div>");
                out.write("<div class='card-body'>");
                out.write("<h5 class='card-title'>"+p.getTitulo()+"</h5>");
                out.write("<p class='card-text'>"+p.getConteudo().substring(0,15)+"...</p>");
                out.write("<a href='post.jsp?id="+p.getIdPost()+"' class='btn btn-primary'>Ver publicação completa</a>");
                out.write(" </div>");
                out.write("</div> <hr>");
            }




          %>
    </div>
    
</body>
</html>
