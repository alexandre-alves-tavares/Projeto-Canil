<%@page import="Objetos.Baia"%>
<%@page import="java.util.ArrayList"%>
<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<table class="lista">
    <tr id="topo">
        <td>Código: </td>
        <td>Nome: </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
    <tr>
        
        <%
    Baia baia;
    
    baia = new Baia();
    
    if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Baia> b = baia.paginacaoBaia(3, NumeroPagina);
     
      QtdPaginas =  baia.contarPaginas(baia.contarBaia(), 3);
  
     
     int aux;  
    if(b.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < b.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = b.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(b.get(cont).getCodigo());
        out.print("</td><td>");  
        out.print(b.get(cont).getNome());      
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altBaia&Baia=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excBaia&Classe=Baia&Codigo=");
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
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadBaia&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadBaia&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>