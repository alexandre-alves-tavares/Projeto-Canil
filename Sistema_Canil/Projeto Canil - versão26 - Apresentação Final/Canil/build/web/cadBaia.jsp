<%!
    public String acao;
%>

<h3> Baias </h3>


<form method="POST" action="ServletBaia">
    <h4> Pesquisar </h4>
    <p class="barra" > </p>
    <p>
    <label class="col-lg-3 control-label"> Nome da baia: </label>
    <br>
    <div class="col-sm-6">
        <div class=" has-feedback form-group">
            <input type="text" name="pesquisa" required="" class="form-control" />
        </div>
    </div >
    <div class="col-sm-2">
        <input type="submit" name="acao" value="Pesquisar"  class="form-control btn btn-sm btn-primary"/>
    </div >
</form>


<%@include file="listaBaia.jsp"%>

<h5 onclick="Mudarestado('esconde')"> Cadastrar </h5>

<div id="esconde">
    <p class="barra" > </p>

    <form  method="POST" action="ServletBaia" />
    <div class="form-group col-sm-8">


        <div class="col-lg-8">
            <div class=" has-feedback form-group">

                <label class="col-lg-3 control-label"> Nome: </label>

                <input type="text" name="nome" required="" class="form-control" />
            </div>
        </div>

        <input type="submit" name="acao" value="Cadastrar"    class="btn btn-primary btn-block " />

    </div>


</form>
</div>
