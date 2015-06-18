<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Medicamento"%>
<%!
    public String nome;
%>
<br /><br />
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
     nome = request.getParameter("Nome");
   
    ArrayList<Medicamento> med = new ArrayList<Medicamento>();
               
    med = medicamento.consultarMedicamento(nome);

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
