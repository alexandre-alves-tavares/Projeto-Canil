<%@page import="Objetos.Veterinario"%>
<%@page import="java.util.ArrayList"%>
<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

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
    
    if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Veterinario> vet = veterinario.paginacaoVeterinario(3, NumeroPagina);
     
     
     QtdPaginas =  veterinario.contarPaginas(veterinario.contarVeterinario(), 3);
    
    if(QtdPaginas == 0){ //Verificar se isso vai corrigir aquele erro de paginação
         QtdPaginas = 1;
     }
     
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
        aux = vet.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(vet.get(cont).getCodigo());
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
    
    <div id="paginadores">
    <%
    // PAGINADORES
        
      for(int j=1; j<=QtdPaginas; j++){
        if(j==NumeroPagina){
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadVeterinario&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadVeterinario&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>