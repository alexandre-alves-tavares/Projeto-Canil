<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Animal"%>
<%!
    public String nome;
%>
<br /><br />
<table class="lista">
    <tr id="topo">
        <td>Código: </td>
        <td>Nome: </td>
        <td>Tipo: </td>
        <td>Sexo: </td>
        <td>Baia: </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
    <tr>
<%
    Animal animal;
    
    animal = new Animal();
   
    
     nome = request.getParameter("Nome");
   
       ArrayList<Animal> ani = new ArrayList<Animal>();
               
          ani = animal.consultarAnimal(nome);
   
    int aux;  
    if(ani.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < ani.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = ani.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(ani.get(cont).getCodigo());
        out.print("</td><td>");  
        out.print(ani.get(cont).getNome());
        out.print("</td><td>");  
        out.print(ani.get(cont).getTipo());
        out.print("</td><td>");  
        out.print(ani.get(cont).getSexo());
        out.print("</td><td>");  
        out.print(ani.get(cont).getBaia());
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altAnimal&Animal=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excAnimal&Classe=Animal&Codigo=");
        out.print(aux);
        out.print("\"> <img src=\"img/exc.png\" alt=\"Alterar\" /> </a>");
        out.print("</td></tr>"); 
        auxCor++;
    }
    }  

    %>
  </table>  
  


