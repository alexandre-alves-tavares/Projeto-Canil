<%-- 
    Document   : cadaTratamento
    Created on : 11/05/2015, 01:56:50
    Author     : Poliana
--%>

<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public String acao;
%>

<h3> Medicamentos </h3>

<form method="POST" action="ServletMedicamento">
    <h4> Pesquisar </h4>
    <p class="barra" > </p>
    <p>
    <label class="col-lg-3 control-label"> Nome do Medicamento: </label>
    <br>
    <div class="col-sm-6">
        <div class=" has-feedback form-group">
            
            <input type="text" name="pesquisa" required="" class="form-control"/>
        </div>
    </div >
    <div class="col-sm-2">
        <input type="submit" name="acao" value="Pesquisar" class="form-control btn btn-sm btn-primary" />
    </div >
    <p>
        <!--<input type="submit" name="acao" value="Listar" />-->
    </p>
</form>
<%


%>


<br /> <br /> <br />
<%@include file="listaMedicamentos.jsp"%>


<form method="POST" action="ServletMedicamento">
    <h5 onclick="Mudarestado('esconde')"> Cadastrar Medicamento </h5>

    <div id="esconde">
        <p class="barra" > </p>
        <div class="form-group col-sm-8">


            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Nome: </label>

                    <input type="text" name="nome" class="form-control" />
                </div>
            </div >

            <div class="col-sm-6">
                <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Tipo: </label>


                    <select id="tipo" name="tipo" class="form-control">
                        <option value=""> Selecione ... </option>
                        <option> Remédio </option>
                        <option> Vacina </option>
                        <option> Outros </option>
                    </select>
                </div>
            </div >
            <div class="col-sm-6">
                <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Doses: </label>
                    <input type="text" name="doses"  class="form-control"/>
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label class="col-lg-3 control-label"> Descrição: </label>
                    <input type="text" name="descricao"  class="form-control"/>
                </div>
            </div >
            <p>
                <input type="submit" name="acao" value="Cadastrar"   class="btn btn-primary btn-block "/>
            </p>
        </div>


</form>