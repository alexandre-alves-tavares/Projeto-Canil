<%@page import="Objetos.Tratamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int NumeroPagina;
    public int QtdPaginas;
%>

<br></br>
<h3> Agenda: </h3>

<table class="lista">
    <tr id="topo">
    <td>Animal: </td>
    <td>Data: </td>
    <td>Descrição: </td>
    <td>Status: </td>     
    <tr>

        <%
            Tratamento tratamento;

            tratamento = new Tratamento();

            if (request.getParameter("pagina") != null) {
                NumeroPagina = Integer.parseInt(request.getParameter("pagina"));
            } else {
                NumeroPagina = 1;
            }

            ArrayList<Tratamento> trat = tratamento.paginacaoTratamento(15, NumeroPagina);

            QtdPaginas = tratamento.contarPaginas(tratamento.contarTratamento(), 15);
            /*if(QtdPaginas == 0){ //Verificar se isso vai corrigir aquele erro de paginação
             QtdPaginas = 1;
             }*/

            int aux;
            if (trat.isEmpty()) {

            } else {
                int auxCor = 0;
                String cor = "";
                for (int cont = 0; cont < trat.size(); cont++) {
                    if (auxCor % 2 == 0) {
                        cor = "par";
                    } else {
                        cor = "impar";
                    }
                    aux = trat.get(cont).getCodTratamento();
                    out.print("<tr id=\"" + cor + "\"><td>");
                    out.print(trat.get(cont).getNomeAnimal());
                    out.print("</td><td>");
                    out.print(trat.get(cont).formatarData());
                    out.print("</td><td>");
                    out.print(trat.get(cont).getObservacao());
                    out.print("</td><td>");

                    if (trat.get(cont).getStatus() == 1) {
                        out.print("Ativo");
                    } else {
                        out.print("Finalizado");
                    }
                    out.print("</td>");
                     out.print("</td></tr>");
                    auxCor++;
                }
            }

        %>   

</table>

<div id="paginadores">
    <%    // PAGINADORES
       /* for (int j = 1; j <= QtdPaginas; j++) {
            if (j == NumeroPagina) {
                out.print(" <a id=\"selecionado\" href=\"?IDPagina=Inicial&pagina=" + j + "\" /> " + j + " </a>");
            } else {
                out.print(" <a href=\"?IDPagina=Inicial&pagina=" + j + "\" /> " + j + " </a>");
            }
        }*/

    %>
</div>

