<%@page import="Objetos.Adotante"%>
<h3> Cadastro Adotante </h3>



<%!
    public int cod;
%>

<%

    cod = Integer.parseInt(request.getParameter("Adotante"));

    Adotante adot;
    adot = new Adotante();
    adot = adot.buscarAdotante(cod);

%>


<form method="POST" action="ServletAdotante"> 
    <fieldset> 
        <h4> Características </h4>
        <p class="barra" > </p>

        <p>
        <div class="form-group col-sm-8">
            <label  class="col-lg-3 control-label"> Código: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="codigo" title="nome" value="<% out.print(adot.getCodigo());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> Nome: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="nome" title="nome" value="<% out.print(adot.getNome());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> CPF: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="cpf" value="<% out.print(adot.getCpf());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> Endereço: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="endereco" value="<% out.print(adot.getEndereco());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> Telefone: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="telefone" value="<% out.print(adot.getTelefone());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> Email: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="email" value="<% out.print(adot.getEmail());%>" class="form-control"/>
                </div>
            </div >
            <label  class="col-lg-3 control-label"> Código animal: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <input type="text" name="animal" value="<% out.print(adot.getAnimal());%>" class="form-control"/>
                </div>
            </div >
        <input type="submit" value="Cadastrar" class="btn btn-primary btn-block"/>
        </div>

        

    </fieldset>
</form>