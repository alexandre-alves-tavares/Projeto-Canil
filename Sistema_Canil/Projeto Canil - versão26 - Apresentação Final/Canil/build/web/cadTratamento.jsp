<%-- 
    Document   : cadaTratamento
    Created on : 14/05/2015, 01:56:50
    Author     : Poliana
--%>
<%@page import="Objetos.Tratamento"%>
<%@page import="Objetos.Animal"%>
<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>


<h3> Cadastro de Tratamento </h3>

<form method="POST" action="ServletTratamento"> 
    <h4> Pesquisar </h4>
    <p class="barra" > </p>
    <p>
    <label> Pesquisar por: </label>
    <div class="col-sm-4">
        <div class=" has-feedback form-group" >
            <select name="tipo"  class="form-control">
                <option value=""> Selecione ... </option>
                <option> Nome Animal </option>
                <option> Código Animal </option>
            </select>
        </div>
    </div >
    <div class="col-sm-6">
        <div class=" has-feedback form-group">
            <input type="text" name="pesquisa"  class="form-control"/>

        </div>
    </div >
    <div class="col-sm-2">
        <input type="submit" name="acao" value="Pesquisar"   class="form-control btn btn-sm btn-primary"/>
    </div>
    <p>
        <!--input type="submit" name="acao" value="Listar" />-->
    </p>
</form>
<br /><br /><br />
<%@include file="listaTratamento.jsp"%>


<form method="POST" action="ServletTratamento"> 
    <fieldset> 

        <h5 onclick="Mudarestado('esconde')"> Cadastrar Tratamento </h5>

        <div id="esconde">
            <p class="barra" > </p>
            <p>
            <div class="form-group col-sm-8">


                <label class="col-lg-3 control-label"> Animal: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <select name="codAnimal"  class="form-control">
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
                <label class="col-lg-3 control-label"> Medicamento: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <select name="codMedicamento"  class="form-control">
                            <option value="2"> Nenhum </option>
                            <%                    Medicamento medicamento;
                                medicamento = new Medicamento();
                                ArrayList<Medicamento> lista_medicamento = medicamento.listarMedicamentos();

                                for (int cont = 0; cont < lista_medicamento.size(); cont++) {
                                    out.print("<option value=\"");
                                    out.print(lista_medicamento.get(cont).getCodigo());
                                    out.print("\" >");
                                    out.print(lista_medicamento.get(cont).getNome());
                                    out.print("</option>");
                                }

                            %>

                        </select>
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Lote Medicamento: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <input type="text" name="lote"  class="form-control" />
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Quantidade de aplicação: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <input type="text" name="quantidade"  class="form-control"/>
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Intervalo entre as aplicações (em horas): </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <input type="text" name="intervalo"  class="form-control"/>
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Duração do tratamento (em dias): </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <input type="text" name="duracao"  class="form-control"/>
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Observação: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <input type="text" name="observacao"  class="form-control"/>
                    </div>
                </div >
                <label class="col-lg-3 control-label"> Status: </label>
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <select id="status" name="status" class="form-control">
                            <option value="1"> Ativo </option>
                            <option value="0"> Finalizado </option>
                        </select>
                    </div>
                </div >
                <input type="submit" name="acao" value="Cadastrar" class="btn btn-primary btn-block"/>
            </div>
            <br>
            <br>
            <br>


        </div>
    </fieldset>

</form>


