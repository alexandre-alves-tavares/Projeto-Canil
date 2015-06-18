
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<%!
    public String IDTela;
%>

<%
    IDTela = request.getParameter("IDTela");

    if (IDTela != null && IDTela.equals("cadTratamento")) {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadTratamento"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadAnimal")) {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadAnimal"><img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<%    } else if (IDTela != null && IDTela.equals("cadMedicamento")) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadMedicamento"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadBaia")) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadBaia"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadVeterinario")) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadVeterinario"> <img src="fotos/voltar.jpg"> </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadAgente")) {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadAgente"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadAdotante")) {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadAdotante"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% } else if (IDTela != null && IDTela.equals("cadCastracao")) {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrado com Sucesso !!!</title>
    </head>
    <body>
        <a id="Voltar" href="?IDPagina=cadCastracao"> <img src="fotos/voltar.jpg">  </a>
        <img src="fotos/sucesso.jpg">
    </body>
</html>

<% }

%>
