<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Veterinario"%>
<%@page import="Objetos.Veterinario"%>


<br>
<br>

<h4> Lista de Veterinarios </h4>

<table style="border:solid;">
    <tr>
        <td>Código:</td>
        <td>Nome:</td>
    </tr>

    <%
        ArrayList<Veterinario> lista_veterinario = (ArrayList<Veterinario>) request.getAttribute("listar");

        for (int cont = 0; cont < lista_veterinario.size(); cont++) {

            out.print("<form method=\"POST\" action=\"ServletVeterinario\">");
            out.print("<tr>");
            out.print("<td>");
            out.print("<input type=\"radio\" name=\"codigo\" value=\"" + lista_veterinario.get(cont).getCodigo() + "\">");
            out.print(lista_veterinario.get(cont).getCodigo());
            out.print("</td>");

            out.print("<td>");
            out.print("<a href=\"#" + lista_veterinario.get(cont).getCodigo()
                    + "\"/>" + lista_veterinario.get(cont).getNome() + "</a>");
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
