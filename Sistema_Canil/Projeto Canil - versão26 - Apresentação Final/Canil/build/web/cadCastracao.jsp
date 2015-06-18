<%-- 
    Document   : cadCastracao
    Created on : 01/06/2015
    Author     : Poliana
--%>

<%@page import="Objetos.Veterinario"%>
<%@page import="Objetos.Animal"%>
<%@page import="java.util.ArrayList"%>
<h3> Cadastro de Castração </h3>


<form>


    <h4> Pesquisar </h4>
    <p class="barra" > </p>

    <label> Pesquisar por: </label>
    <div class="col-sm-4">
        <div class=" has-feedback form-group">
            <select name="tipo" class="form-control">
                <option value="">Selecione...</option>
                <option> Nome Animal </option>
                <option> Código Animal </option>
            </select>

        </div>
    </div >
    <div class="col-sm-6">
        <div class=" has-feedback form-group">
            <input type="text" name="pesquisa" class="form-control" />
        </div>
    </div>
    <div class="col-sm-2">
        <input type="submit" name="acao" value="Pesquisar" class="form-control btn btn-sm btn-primary" />
    </div>

</form>

<%@include file="listaCastracao.jsp"%>

<h5 onclick="Mudarestado('esconde')"> Cadastrar </h5>

<div id="esconde">


    <form method="POST" action="ServletCastracao"> 
        <fieldset> 

            <p class="barra" > </p>
            <p>
                            <div class="form-group col-sm-8">

            <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Animal: </label>
                    <select name="codAnimal" class="form-control">
                        <option value="2"> Nenhum </option>
                        <%                    Animal animal;
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

            <div class="col-lg-8">
                    <div class=" has-feedback form-group">
            <label class="col-lg-3 control-label"> Veterinário: </label>
             
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

            
             <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Observação: </label>
                    <input type="text" name="observacao" class="form-control" />
                </div>
            </div >

            <input type="submit" name="acao" value="Cadastrar" class="form-control btn btn-sm btn-primary" />
            </div>
            <br>
            <br>
            <br>


        </fieldset>
    </form>

</div>