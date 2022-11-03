function addUserSession(idUsuario, nomeUsuario){
    var usuario = {idUsuario, nomeUsuario}
    window.sessionStorage.setItem('usuario', JSON.stringify(usuario))

}