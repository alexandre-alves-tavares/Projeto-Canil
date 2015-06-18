

<h2> Animal </h2>


<%@page import="Objetos.Baia"%>
<%@page import="java.util.ArrayList"%>

<form method="POST" action="ServletAnimal"> 
    <fieldset>
        <h4> Pesquisar </h4>
        <p class="barra" > </p>
        <p>


        <label> Nome do Animal: </label>
        </p>
        <div class="form-inline">
            <div class="form-group has-feedback col-sm-8"  >
                <input type="text" name="pesquisa" class="form-control form-horizontal" style="width: 95%"  />
            </div>
            <div class="col-sm-3">
                <input type="submit" name="acao" value="Pesquisar" class="form-control btn btn-sm btn-primary" />
            </div>
        </div>
    </fieldset>
</form>


<%@include file="listaAnimais.jsp"%>




<form method="POST" action="ServletAnimal" enctype="multipart/form-data"> 
    <fieldset>
        <h5 onclick="Mudarestado('esconde')"> Cadastrar Animal </h5>

        <div id="esconde">
            <p class="barra" > </p>
            <div class="form-group col-sm-8">
                <label> Nome: </label>
                <div class="form-group">
                    <div class=" has-feedback  "  >
                        <input type="text" name="nome" class="form-control" required="" />
                    </div>
                </div>


                <label> Idade: </label>
                <div class=" has-feedback form-group " >
                    <input type="text" name="idade" class="form-control"  />
                </div>

                <label> Tipo: </label>
                <div class=" has-feedback form-group " >
                    <select id="tipo" name="tipo" class="form-control">
                        <option value=""> Selecione ... </option>
                        <option> Cachorro </option>
                        <option> Gato </option>
                        <option> Outros </option>
                    </select>
                </div>

                <label> Raça: </label>
                <div class=" has-feedback form-group"   >
                    <input type="text" name="raca" class="form-control" />
                </div>


                <label> Pelagem: </label>
                <div class=" has-feedback form-group"   >
                    <select id="pelagem" name="pelagem" class="form-control">
                        <option value=""> Selecione ... </option>
                        <option> Curto </option>
                        <option> Médio </option>
                        <option> Longo </option>
                        <option> Outros </option>
                    </select>
                </div>

                <label> Cor: </label>
                <div class=" has-feedback form-group"   >
                    <select id="pelagem" name="cor" class="form-control">
                        <option value=""> Selecione ... </option>
                        <option> Branco </option>
                        <option> Bege </option>
                        <option> Cinza </option>
                        <option> Marrom </option>
                        <option> Preto </option>
                        <option> Tricolor </option>
                        <option> Outros </option>
                    </select>
                </div>

                <label> Sexo: </label>
                <div class=" has-feedback form-group"   >
                    <label><input type="radio" name="sexo" value="macho"> Macho</label>
                    <label><input type="radio" name="sexo" value="femea"> Fêmea</label>

                </div> 

                <label> Peso (Kg): </label>
                <div class=" has-feedback form-group"   >
                    <input type="text" name="peso" class="form-control" />
                </div>


                <label> Animal agressivo? </label>
                <div class=" has-feedback form-group"   >
                    <label><input type="radio" name="agressivo" value="agressivo"> Sim</label>
                    <label><input type="radio" name="agressivo" value="naoagressivo"> Não</label>
                </div>

                <label> Ração: </label>
                <div class=" has-feedback form-group"   >
                    <input type="text" name="racao" class="form-control" />
                </div>



                <label> Bairro do recolhimento: </label>
                <div class=" has-feedback form-group"   >
                    <input type="text" name="bairro" class="form-control" />
                </div>

                <label> Baia: </label>
                <div class=" has-feedback form-group"   >
                    <select name="baia" class="form-control">
                        <option value="2"> Nenhuma </option>
                        <%                    Baia baia;
                            baia = new Baia();
                            ArrayList<Baia> lista_baia = baia.ListarBaias();

                            for (int cont = 0; cont < lista_baia.size(); cont++) {
                                out.print("<label><option value=\"");
                                out.print(lista_baia.get(cont).getCodigo());
                                out.print("\" >");
                                out.print(lista_baia.get(cont).getNome());
                                out.print("</option></label>");
                            }

                        %>

                    </select>
                </div>
                <p>

                <label> Anexar Foto: </label>
                <div class=" has-feedback form-group"   >
                    <input type="file" name="foto" class="form-control" />
                    <input type="text" name="foto" />
                   <!-- <input type="file" name="foto" class="form-control" />-->
                </div>

                <label> Observações: </label>
                <div class="has-feedback form-group">
                    <textarea name="observacao" class="form-control"> </textarea>
                </div>

            </div>
            <input type="submit" name="acao" value="Cadastrar" class="btn btn-primary btn-block "/>
        </div>

    </fieldset>
</form>