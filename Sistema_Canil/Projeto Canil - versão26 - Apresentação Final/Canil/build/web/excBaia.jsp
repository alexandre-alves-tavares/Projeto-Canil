
<%@page import="Objetos.Baia"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");

             Baia baia;
             baia = new Baia();
             baia.deletarBaia(cod);
   
%>