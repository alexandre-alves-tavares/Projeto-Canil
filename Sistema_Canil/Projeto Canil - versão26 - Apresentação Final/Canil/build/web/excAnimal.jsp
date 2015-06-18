<%@page import="Objetos.Animal"%>
<%!
    public int cod;
    public String classe;
   
%>

<%
    cod = Integer.parseInt(request.getParameter("Codigo"));
    classe = request.getParameter("Classe");
    //if(classe=="Animal"){
             Animal animal;
             animal = new Animal();
             animal.deletarAnimal(cod);
   // }
   
%>