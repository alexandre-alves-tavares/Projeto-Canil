
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Objetos.Veterinario"%>
<h3> Cadastro Veterinario </h3>


<form method="POST" action="ServletVeterinario"> 
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
<br /> <br /> <br />
<%@include file="listaVeterinario.jsp"%>

<form method="POST" action="ServletVeterinario"> 
    <fieldset> 

        <h5 onclick="Mudarestado('esconde')"> Cadastrar Veterinário </h5>

        <div id="esconde">


            <p class="barra" > </p>
            <div class="form-group col-sm-8">


                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Nome: </label>
                        <input type="text" name="nome" title="nome" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> CPF: </label>
                        <input type="text" name="cpf" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Endereço: </label>
                        <input type="text" name="endereco" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Telefone: </label>
                        <input type="text" name="telefone" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Email: </label>
                        <input type="text" name="email" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> CRMV: </label>
                        <input type="text" name="crmv" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Usuário: </label>
                        <input type="text" name="usuario" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Senha: </label>
                        <input type="password" name="senha" class="form-control" />
                    </div>
                </div >
                <div class="col-lg-8">
                    <div class=" has-feedback form-group">
                        <label class="col-lg-3 control-label"> Repita a Senha: </label>
                        <input type="password" name="confirmasenha" class="form-control" />
                    </div>
                </div >

                <input type="submit" name="acao" value="Cadastrar" class="btn btn-primary btn-block "/>

                <br>
                <br>
                <br>

            </div> 

    </fieldset>
</form>

<hr />