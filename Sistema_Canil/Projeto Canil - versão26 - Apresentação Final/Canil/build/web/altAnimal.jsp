<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Animal"%>
<%!
    public int cod;
    public int verifica = -1; // verifica qual radiobox deve ser checked
%>

<%

    cod = Integer.parseInt(request.getParameter("Animal"));

    Animal animal;
    animal = new Animal();
    animal = animal.buscarAnimal(cod);

%>

<form method="POST" action="ServletAnimal" enctype="multipart/form-data"> 

    <fieldset> 
        <div class="form-group col-sm-8">
            <br /><br /><br />
            <h3> Alterar Animal </h3>
            <!--<h4> Características </h4>-->
            <p class="barra" > </p>


            <label class="col-lg-3 control-label"> Codigo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="codigo" value="<%out.print(animal.getCodigo());%>" class="form-control"/>

                </div>
            </div >
            <label class="col-lg-3 control-label"> Nome: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="nome" value="<%out.print(animal.getNome());%>" class="form-control"/>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Idade: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="idade" value="<%out.print(animal.getIdade());%>" class="form-control"/>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Tipo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">

                    <% if (animal.getTipo() == "Cachorro") {
                            verifica = 0;
                        } else if (animal.getPelagem() == "Gato") {
                            verifica = 1;
                        } else {
                            verifica = 3;
                        }

                    %>
                    <select id="tipo" name="tipo" selected="2" class="form-control">
                        <option value="1"> Cachorro </option>
                        <option id="2"> Gato </option>
                        <option value="3"> Outros </option>
                    </select>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Raça: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="raca" value="<%out.print(animal.getRaca());%>" class="form-control" />
                </div>
            </div >
            <label class="col-lg-3 control-label"> Pelagem: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">

                    <% if (animal.getPelagem() == "Curto") {
                            verifica = 0;
                        } else if (animal.getPelagem() == "Medio") {
                            verifica = 1;
                        } else if (animal.getPelagem() == "Longa") {
                            verifica = 2;
                        } else {
                            verifica = 3;
                        }

                    %>

                    <select id="pelagem" name="pelagem" class="form-control">
                        <option <% if (verifica == 0) {
                                out.print("selected");
                            } %>> Curto </option>
                        <option <% if (verifica == 1) {
                                out.print("selected");
                            } %>> Médio </option>
                        <option <% if (verifica == 2) {
                                out.print("selected");
                            } %>> Longo </option>
                        <option <% if (verifica == 3) {
                                out.print("selected");
                            } %>> Outros </option>
                    </select>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Cor: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <select id="pelagem" name="cor" value="<%out.print(animal.getCor());%>" class="form-control">
                        <option> Branco </option>
                        <option> Bege </option>
                        <option> Cinza </option>
                        <option> Marrom </option>
                        <option> Preto </option>
                        <option> Tricolor </option>
                        <option> Outros </option>
                    </select>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Sexo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <% if (animal.getSexo() == "macho") {
                            verifica = 0;
                        } else {
                            verifica = 1;
                        }
                    %>
                    <label><input type="radio" name="sexo" value="macho" <% if (verifica == 0) {
                            out.print("checked");
                        } %> > Macho </label>
                    <label><input type="radio" name="sexo" value="femea" <% if (verifica == 1) {
                            out.print("checked");
                        } %>> Fêmea </label>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Peso: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="peso" value="<%out.print(animal.getPeso());%>" class="form-control"/>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Animal agressivo? </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                               <% if (animal.getAgressor() == "Sim") {
                                       verifica = 0;
                                   } else {
                                       verifica = 1;
                                   }
                               %>
                               <label> <input type="radio" name="agressivo" value="sim" <% if (verifica == 0) {
                            out.print("checked");
                        } %> > Sim </label>
                    <label><input type="radio" name="agressivo" value="nao" <% if (verifica == 1) {
                            out.print("checked");
                        } %> > Não </label>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Ração: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="racao" value="<%out.print(animal.getRacao());%>" class="form-control"/>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Bairro do recolhimento: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="bairro" value="<%out.print(animal.getBairroRecolhimento());%>" class="form-control"/>
                </div>
            </div >
            <label class="col-lg-3 control-label"> Baia: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">

                    <select name="baia" class="form-control">
                        <option value="2"> Nenhuma </option>

                    </select>
                </div>
            </div >
           <!-- <label class="col-lg-3 control-label"> Anexar Foto: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="file" name="foto"  class="form-control" />
                </div>
            </div >-->
            <label class="col-lg-3 control-label"> Observações: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <textarea name="observacao" value="<%out.print(animal.getObservacao());%>" class="form-control"> </textarea>
                </div>
            </div >
        </div>
        <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block" />

        <br>
        



    </fieldset>

</form>