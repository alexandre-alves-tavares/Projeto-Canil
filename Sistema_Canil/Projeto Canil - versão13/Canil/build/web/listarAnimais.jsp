<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Animal"%>
<%@page import="Objetos.Animal"%>

<br>
<br>

<h4> Lista de Animais </h4>

<table style="border:solid;">
    <tr>
        <td>Código:</td>
        <td>Nome:</td>
    </tr>

    <%
        ArrayList<Animal> lista_animal = (ArrayList<Animal>) request.getAttribute("listar");

        for (int cont = 0; cont < lista_animal.size(); cont++) {

            out.print("<form method=\"POST\" action=\"ServletAnimal\">");
            out.print("<tr>");
            out.print("<td>");
            out.print("<input type=\"radio\" name=\"codigo\" value=\"" + lista_animal.get(cont).getCodigo() + "\">");
            out.print(lista_animal.get(cont).getCodigo());
            out.print("</td>");

            out.print("<td>");
            out.print("<a href=\"#" + lista_animal.get(cont).getCodigo()
                    + "\"/>" + lista_animal.get(cont).getNome() + "</a>");
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