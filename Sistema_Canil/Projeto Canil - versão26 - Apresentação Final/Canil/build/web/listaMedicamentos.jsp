<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Medicamento"%>
<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<table class="lista">
    <tr id="topo">
        <td>Código: </td>
        <td>Nome: </td>
        <td>Tipo: </td>
        <td>Doses: </td>
        <td>Descricao: </td>
        <td>Alterar: </td>
        <td>Excluir: </td>
            
    <tr>
        
        <%
    Medicamento medicamento;
    
    medicamento = new Medicamento();
    
    if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Medicamento> med = medicamento.paginacaoMedicamento(3, NumeroPagina);
     
     
     QtdPaginas =  medicamento.contarPaginas(medicamento.contarMedicamentos(), 3);
     /*if(QtdPaginas == 0){ //Verificar se isso vai corrigir aquele erro de paginação
         QtdPaginas = 1;
     }*/
     
     int aux;  
    if(med.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < med.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = med.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(med.get(cont).getCodigo());
        out.print("</td><td>");  
        out.print(med.get(cont).getNome());
        out.print("</td><td>");  
        out.print(med.get(cont).getTipo());
        out.print("</td><td>");  
        out.print(med.get(cont).getDoses());
        out.print("</td><td>");  
        out.print(med.get(cont).getDescricao());
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altMedicamento&Medicamento=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excMedicamento&Classe=Medicamento&Codigo=");
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
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadMedicamento&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadMedicamento&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>