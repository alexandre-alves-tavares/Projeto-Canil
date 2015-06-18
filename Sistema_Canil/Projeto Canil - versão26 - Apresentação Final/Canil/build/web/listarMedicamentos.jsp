<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Medicamento"%>
<%@page import="Objetos.Medicamento"%>


<br>
<br>

<h4> Lista de Medicamentos </h4>

<table style="border:solid;">
    <tr>
        <td>Código:</td>
        <td>Nome:</td>
    </tr>

    <%
        ArrayList<Medicamento> lista_medicamento = (ArrayList<Medicamento>) request.getAttribute("listar");

        for (int cont = 0; cont < lista_medicamento.size(); cont++) {

            out.print("<form method=\"POST\" action=\"ServletMedicamento\">");
            out.print("<tr>");
            out.print("<td>");
            out.print("<input type=\"radio\" name=\"codigo\" value=\"" + lista_medicamento.get(cont).getCodigo() + "\">");
            out.print(lista_medicamento.get(cont).getCodigo());
            out.print("</td>");

            out.print("<td>");
            out.print("<a href=\"#" + lista_medicamento.get(cont).getCodigo()
                    + "\"/>" + lista_medicamento.get(cont).getNome() + "</a>");
            out.print("</td>");

            out.print("<td>");
       
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

