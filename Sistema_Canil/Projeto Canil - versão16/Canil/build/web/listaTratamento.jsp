<%@page import="Objetos.Tratamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<table class="lista">
    <tr id="topo">
        <td>Código: </td>
        <td>Animal: </td>
        <td>Medicamento: </td>
        <td>Lote: </td>
        <td>Quantidade: </td>
        <td>Intervalo: </td>
        <td>Duracao: </td>
        <td>Observacao: </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
            
    <tr>
        
        <%
    Tratamento tratamento;
    
    tratamento = new Tratamento();
    
    if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Tratamento> trat = tratamento.paginacaoTratamento(3, NumeroPagina);
     
     
     QtdPaginas =  tratamento.contarPaginas(tratamento.contarTratamento(), 3);
     /*if(QtdPaginas == 0){ //Verificar se isso vai corrigir aquele erro de paginação
         QtdPaginas = 1;
     }*/
     
     int aux;  
    if(trat.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < trat.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = trat.get(cont).getCodTratamento();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(trat.get(cont).getCodTratamento());
        out.print("</td><td>");  
        out.print(trat.get(cont).getCodAnimal());
        out.print("</td><td>");  
        out.print(trat.get(cont).getCodMedicamento());
        out.print("</td><td>");  
        out.print(trat.get(cont).getLote());
        out.print("</td><td>");  
        out.print(trat.get(cont).getQuantidade());
        out.print("</td><td>");  
        out.print(trat.get(cont).getIntervalo());
        out.print("</td><td>");  
        out.print(trat.get(cont).getDuracao());
        out.print("</td><td>");  
        out.print(trat.get(cont).getObservacao());
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altTratamento&Tratamento=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excTratamento&Classe=Trataemnto&Codigo=");
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
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadTratamento&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadTratamento&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>