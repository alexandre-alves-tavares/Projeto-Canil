<%@page import="Objetos.Tratamento"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");

             Tratamento trat;
             trat = new Tratamento();
             trat.deletarTratamento(cod);
   
%>