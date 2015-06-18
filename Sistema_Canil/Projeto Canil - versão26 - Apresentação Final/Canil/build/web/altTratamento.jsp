<%@page import="Objetos.Tratamento"%>
<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int cod;
    public int verifica = -1; // verifica qual radiobox deve ser checked
%>

<%

    cod = Integer.parseInt(request.getParameter("Tratamento"));
   
   
    Tratamento tratamento;
    tratamento = new Tratamento();
    tratamento = tratamento.buscarTratamento(cod);
    
%>

<form method="POST" action="ServletTratamento"> 
    <fieldset> 
       
        <br /><br /><br />
         <h3> Alterar Tratamento </h3>
        <!--<h4> Características </h4>-->
        <p class="barra" > </p>
        <div class="form-group col-sm-8">
        <p>
            <label class="col-lg-3 control-label"> Código: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="codigo" value="<%out.print(tratamento.getCodTratamento());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Animal: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="animal" value="<%out.print(tratamento.getCodAnimal());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Medicamento: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="medicamento" value="<%out.print(tratamento.getCodMedicamento());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Lote Medicamento: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="lote" value="<%out.print(tratamento.getLote());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Quantidade de aplicação: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="quantidade" value="<%out.print(tratamento.getQuantidade());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Intervalo entre as aplicações (em horas): </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="intervalo" value="<%out.print(tratamento.getIntervalo());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Duração do tratamento (em dias): </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="duracao" value="<%out.print(tratamento.getDuracao());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Observação:: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="observacao" value="<%out.print(tratamento.getObservacao());%>" class="form-control"/>
        </div>
            </div >
        
        <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block"/>
    </div>
    
        <br>
        <br>
        <br>

        

    </fieldset>
</form>