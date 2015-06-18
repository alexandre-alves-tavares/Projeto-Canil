<%@page import="Objetos.Castracao"%>
<%@page import="Objetos.Veterinario"%>
<%@page import="Objetos.Animal"%>
<%@page import="java.util.ArrayList"%>




<%!
    public int cod;
%>

<%

    cod = Integer.parseInt(request.getParameter("Castracao"));

    Castracao castracao;
    castracao = new Castracao();
    castracao = castracao.buscarCastracao(cod);

%>

<br /><br /><br />

<form method="POST" action="ServletCastracao"> 
    <fieldset> 
        <div class="form-group col-sm-8">
            <br /><br /><br />
            <h3> Alterar Castração </h3>
            <p class="barra" > </p>

            <p>
            <p>
                
            <label class="col-lg-3 control-label"> Código: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="codigo" value="<% out.print(castracao.getCodCastracao());%>" class="form-control"/>
                </div>
            </div >


            <label class="col-lg-3 control-label"> Animal: </label>
             <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <select name="codAnimal" class="form-control">
                <option value="2"> Nenhum </option>
                <%
                    Animal animal;
                    animal = new Animal();
                    ArrayList<Animal> lista_animal = animal.listarAnimais();

                    for (int cont = 0; cont < lista_animal.size(); cont++) {
                        out.print("<option value=\"");
                        out.print(lista_animal.get(cont).getCodigo());
                        out.print("\" >");
                        out.print(lista_animal.get(cont).getNome());
                        out.print("</option>");
                    }
                %>
            </select>    
            </div>
            </div >
            <label class="col-lg-3 control-label"> Veterinário: </label>
             <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <select name="codVeterinario" class="form-control">
                <option value="2"> Nenhum </option>
                <%
                    Veterinario veterinario;
                    veterinario = new Veterinario();
                    ArrayList<Veterinario> lista_veterinario = veterinario.listarVeterinarios();

                    for (int cont = 0; cont < lista_veterinario.size(); cont++) {
                        out.print("<option value=\"");
                        out.print(lista_veterinario.get(cont).getCodigo());
                        out.print("\" >");
                        out.print(lista_veterinario.get(cont).getNome());
                        out.print("</option>");
                    }

                %>
            </select>    
           </div>
            </div >
            <label class="col-lg-3 control-label"> Observação: </label>
             <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="observacao" class="form-control"/>
            </div>
            </div >

            <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block"/>
        </div>
    </fieldset>
</form>