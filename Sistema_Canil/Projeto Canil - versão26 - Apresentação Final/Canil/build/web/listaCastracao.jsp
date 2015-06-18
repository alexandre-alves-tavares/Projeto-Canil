
<%@page import="Objetos.Castracao"%>
<%@page import="java.util.ArrayList"%>
<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<table class="lista">
    <tr id="topo">
        <td>Código </td>
        <td>Animal </td>
        <td>Data </td>
        <td>Veterinário </td>
        <td>Observações </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
    <tr>
        
        <%
    Castracao castracao;
    
    castracao = new Castracao();
    
    if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Castracao> c = castracao.paginacaoCastracao(2, NumeroPagina);
  
     
     int aux;  
    if(c.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < c.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = c.get(cont).getCodCastracao();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(c.get(cont).getCodCastracao());
        out.print("</td><td>");  
        out.print(c.get(cont).getCodAnimal());    
        out.print("</td><td>");  
        out.print(c.get(cont).getDataCastracao()); 
        out.print("</td><td>");  
        out.print(c.get(cont).getCodVeterinario()); 
        out.print("</td><td>");  
        out.print(c.get(cont).getObservacao()); 
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altCastracao&Castracao=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excCastracao&Classe=Castracao&Codigo=");
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
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadCastracao&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadCastracao&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>