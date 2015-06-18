
<%@page import="Objetos.Castracao"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");

             Castracao castracao;
             castracao = new Castracao();
             castracao.deletarCastracao(cod);
   
%>