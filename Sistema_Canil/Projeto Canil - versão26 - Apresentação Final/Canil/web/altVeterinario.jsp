<%@page import="Objetos.Veterinario"%>
<%@page import="Objetos.Tratamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int cod;
    public int verifica = -1; // verifica qual radiobox deve ser checked
%>

<%

    cod = Integer.parseInt(request.getParameter("Veterinario"));
   
 
    Veterinario veterinario;
    veterinario = new Veterinario();
    veterinario = veterinario.buscarVeterinario(cod);
    
%>

<form method="POST" action="ServletTratamento"> 
    <fieldset> 
       
        <br /><br /><br />
         <h3> Alterar Veterinário </h3>
        
        <p class="barra" > </p>
        <div class="form-group col-sm-8">
        <p>
            <label class="col-lg-3 control-label"> Código: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="codigo" value="<%out.print(veterinario.getCod());%>"  class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Nome: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="nome" value="<%out.print(veterinario.getNome());%>"  class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> CRMV: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="crmv" value="<%out.print(veterinario.getCrmv());%>"  class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Endereço: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="endereco" value="<%out.print(veterinario.getEndereco());%>"  class="form-control"/>
       </div>
            </div >
            <label class="col-lg-3 control-label"> Telefone: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="telefone" value="<%out.print(veterinario.getTelefone());%>"  class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> E-mail: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="email" value="<%out.print(veterinario.getEmail());%>"  class="form-control"/>
        </div>
            </div >
       
        
        <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block" />
</div>

        

    </fieldset>
</form>