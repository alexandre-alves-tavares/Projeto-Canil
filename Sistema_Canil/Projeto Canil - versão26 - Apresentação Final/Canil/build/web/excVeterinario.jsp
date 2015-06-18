<%@page import="Objetos.Veterinario"%>
<%@page import="Objetos.Tratamento"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");

             Veterinario vet;
             vet = new Veterinario();
             vet.deletarVeterinario(cod);
   
%>