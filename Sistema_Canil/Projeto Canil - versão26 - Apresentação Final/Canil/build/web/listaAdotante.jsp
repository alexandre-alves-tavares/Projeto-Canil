<%@page import="Objetos.Adotante"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<table class="lista">
    <tr id="topo">
        <td>Código </td>
        <td>Nome </td>
        <td>CPF </td>
        <td>Endereço </td>
        <td>Telefone </td>
        <td>E-mail </td>
        <td>Animal </td>
        <td>Data adoção </td>
        <td>Alterar </td>
        <td>Excluir </td>
    <tr>
<%
    Adotante pessoa;
    
    pessoa = new Adotante();
    
    
    ///////////////////////////////////////////////////////////////////PAGINAÇÃO
     
     
     
     if(request.getParameter("pagina") != null){
        NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
     }else{
         NumeroPagina = 1;      
     }
      
     ArrayList<Adotante> pess = pessoa.paginacaoAdotante(3, NumeroPagina);
     
     
    QtdPaginas =  pessoa.contarPaginas(pessoa.contarAdotante(), 3);
    //<a href="?IDPagina=Acompanhamento" alt="Acompanhamento" />
  
     //////////////////////////////////////////////////////////////////////////
   
    int aux;  
    if(pess.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < pess.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux = pess.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td>");
        out.print(pess.get(cont).getCodigo());
        out.print("</td><td>");  
        out.print(pess.get(cont).getNome());
        out.print("</td><td>");  
        out.print(pess.get(cont).getCpf());
        out.print("</td><td>");  
        out.print(pess.get(cont).getEndereco());
        out.print("</td><td>");  
        out.print(pess.get(cont).getTelefone());
        out.print("</td><td>");  
        out.print(pess.get(cont).getEmail());
        out.print("</td><td>");  
        out.print(pess.get(cont).getAnimal());
        out.print("</td><td>");  
        out.print(pess.get(cont).getDataAdocao());
        out.print("</td><td id=\"botao\">");
        out.print("<a href=\"capa.jsp?IDPagina=altAdotante&Adotante=");
        out.print(aux);
        out.print("\"> <img src=\"img/alt.png\" alt=\"Alterar\" /> </a>");
         out.print("</td><td>");
        out.print("<a href=\"capa.jsp?IDPagina=excAdotante&Classe=Adotante&Codigo=");
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
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=cadAdotante&pagina="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=cadAdotante&pagina="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>


