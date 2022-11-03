<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.posts.dao.daoUsuario" %>
<%@ page import="com.posts.entidades.Usuario" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script>
        function addUserSession(idUsuario, nomeUsuario, nivelAcesso){
            var usuario = {idUsuario, nomeUsuario, nivelAcesso}
            window.sessionStorage.setItem('usuario', JSON.stringify(usuario))
        }
    </script>



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

    <form action="login.jsp" method="POST">
        <div class="mb-3" style="width: 400px; margin: auto; font-size: medium;">
          <label for="exampleInputEmail1" class="form-label">Email address</label>
          <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="nome@email.com">
        </div>
        <div class="mb-3" style="width: 400px; margin: auto; font-size: medium;">
          <label for="exampleInputPassword1" class="form-label">Password</label>
          <input type="password" class="form-control" id="senha" name="senha">
        </div>
        <div  style="text-align: center; margin: auto;">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <div class="mb-3" style="width: 400px; margin: auto; font-size: smaller; text-align: center;">
            <a href="cadastro.jsp" style="margin:auto">Criar conta</a>
        </div>

      </form>

      <%
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if(email != null && !email.isEmpty()){
            if (senha != null && !senha.isEmpty()){
                Usuario x = new Usuario (email, senha);

                List<Usuario> lista = daoUsuario.listar();
                for (Usuario y : lista){
                   if (x.getNomeUsuario().equals(y.getNomeUsuario())){
                        if (x.getSenhaUsuario().equals(y.getSenhaUsuario())){
                            out.write("<script>");
                            out.write("addUserSession("+y.getIdUsuario()+",'"+ y.getNomeUsuario()+"',"+ y.getNivelAcesso() +")");
                            out.write("</script>");

                        }
                   }
                }

            }
        }

      %>
</body>
</html>