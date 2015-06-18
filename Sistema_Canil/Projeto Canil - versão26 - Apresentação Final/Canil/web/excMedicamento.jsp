<%@page import="Objetos.Medicamento"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");

             Medicamento medicamento;
             medicamento = new Medicamento();
             medicamento.deletarMedicamento(cod);
   
%>