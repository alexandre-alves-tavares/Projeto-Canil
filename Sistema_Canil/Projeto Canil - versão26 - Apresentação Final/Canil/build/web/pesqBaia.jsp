<%@page import="Objetos.Baia"%>
<%@page import="java.util.ArrayList"%>
<%!
    public String nome;
%>
<br /><br />
<table class="lista">
    <tr id="topo">
        <td>Código </td>
        <td>Nome </td>
        <td>Animal </td>
        <td>Alterar </td>
        <td>Excluir </td>
    <tr>
        
        <%
    Baia baia;
    
    baia = new Baia();
    
    nome = request.getParameter("Nome");
     
    ArrayList<Baia> b = new ArrayList<Baia>();
               
    b = baia.consultarBaia(nome);
    
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
        out.print("</td><td>");
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
