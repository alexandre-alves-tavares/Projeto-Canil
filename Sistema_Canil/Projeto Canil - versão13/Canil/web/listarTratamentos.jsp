<%-- 
    Document   : listarTratamentos
    Created on : 14/05/2015, 14:31:58
    Author     : Poliana
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Tratamento"%>
<%@page import="Objetos.Animal"%>
<%@page import="Objetos.Medicamento"%>

<br>
<br>

<h4> Lista de Tratamentos </h4>

<br>
<br>
<table style="border:solid;">
    <tr>
        <td><b>Código Tratamento</b></td> 
        <td><b>Código Animal</b></td>
        <td><b>Código Medicamento</b></td>
        <td><b>Lote Medicamento</b></td>
        <td><b>Quantidade</b></td>
        <td><b>Intervalo de Administração</b></td>
        <td><b>Duracao do Tratamento</b></td>
        <td><b>Observações</b></td>
    </tr>

    <%
        ArrayList<Tratamento> lista_tratamento = (ArrayList<Tratamento>) request.getAttribute("listar");

        for (int cont = 0; cont < lista_tratamento.size(); cont++) {

            out.print("<form method=\"POST\" action=\"ServletTratamento\">");
            
            out.print("<tr>");
            out.print("<td>");
            out.print("<input type=\"radio\" name=\"codigo\" value=\"" + lista_tratamento.get(cont).getCodTratamento() + "\">");
            out.print(lista_tratamento.get(cont).getCodTratamento());
            out.print("</td>");

            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getCodAnimal()
                    + "\"/>" + lista_tratamento.get(cont).getCodAnimal() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getCodMedicamento()
                    + "\"/>" + lista_tratamento.get(cont).getCodMedicamento() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getLote()
                    + "\"/>" + lista_tratamento.get(cont).getLote() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getQuantidade()
                    + "\"/>" + lista_tratamento.get(cont).getQuantidade() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getIntervalo()
                    + "\"/>" + lista_tratamento.get(cont).getIntervalo() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getDuracao()
                    + "\"/>" + lista_tratamento.get(cont).getDuracao() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            out.print("<a " + lista_tratamento.get(cont).getObservacao()
                    + "\"/>" + lista_tratamento.get(cont).getObservacao() + "</a>");
            out.print("</td>");
            
            out.print("<td>");
            //out.print("<input type=\"submit\" name=\"acao\" value=\"Excluir\" >");
            //out.print("<a href=\"/Canil/ServletVeterinario?acao=Excluir&id= " + lista_veterinario.get(cont).getCodigo() + "\"> Excluir </a>");
            out.print("</td>");
            out.print("<tr/>");
        }
    %>
</table>

<%
    out.print("<br>");
    out.print("<input type=\"submit\" name=\"acao\" value=\"Excluir\" >");
    out.print("</form>");
%>
