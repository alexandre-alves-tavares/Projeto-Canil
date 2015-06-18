<%@page import="Objetos.Veterinario"%>
<%@page import="java.util.ArrayList"%>
<%!
    public String nome;
%>
<br /><br /><br />
<table class="lista">
    <tr id="topo">
        <td>Código: </td>
        <td>Nome: </td>
        <td>Telefone: </td>
        <td>Email: </td>
        <td>CRMV: </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
            
    <tr>
        
        <%
    Veterinario veterinario;
    
    veterinario = new Veterinario();   
      
    nome = request.getParameter("Nome");
     
      ArrayList<Veterinario> vet = new ArrayList<Veterinario>();
       
      vet = veterinario.consultarVeterinario(nome);  
      
     
     int aux;  
    if(vet.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < vet.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = vet.get(cont).getCod();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(vet.get(cont).getCod());
        out.print("</td><td>");  
        out.print(vet.get(cont).getNome());
        out.print("</td><td>");  
        out.print(vet.get(cont).getTelefone());
        out.print("</td><td>");  
        out.print(vet.get(cont).getEmail());
        out.print("</td><td>");  
        out.print(vet.get(cont).getCrmv());
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altVeterinario&Veterinario=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excVeterinario&Classe=Veterinario&Codigo=");
        out.print(aux);
        out.print("\"> <img src=\"img/exc.png\" alt=\"Alterar\" /> </a>");
        out.print("</td></tr>"); 
        auxCor++;
    }
    }
    
    %>   
        
</table>
