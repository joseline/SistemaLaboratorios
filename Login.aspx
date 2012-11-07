<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
    <link href="css/LoginCss.css" rel="Stylesheet" type="text/css"/>
    <link href="css/MenuHorizontalcss.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <%--<form id="form1" runat="server">
    <div>--%>
    <div id = "pagina">
        <div id="cssmenu">
            <ul>
            </ul>
        </div>
        <div class="login">
        <div class="titulo">Acceso Usuario</div>
        <form action="#" method="post" enctype="application/x-www-form-urlencoded">
            <input type="text" required title="Usuario Requerido" placeholder="Usuario" data-icon="U">
            <input type="password" required title="Password Requerido" placeholder="Password" data-icon="x">
            <div class="olvido">
                <div class="col"><a href="#" title="Ver Carásteres">A ~ ***</a></div>
                <div class="col"><a href="#" title="Recuperar Password">Recuperar?</a></div>
            </div>
            <a href="#" class="enviar">Entrar</a>
        </form>
  </div>​
    </div>
    <%--</div>
    </form>--%>
</body>
</html>
