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
        
        <p>
            <label> Codigo: </label>
            <input type="text" name="codigo" value="<%out.print(tratamento.getCodTratamento());%>"/>
        </p>
        
        <p>
            <label> Animal: </label>
            <input type="text" name="animal" value="<%out.print(tratamento.getCodAnimal());%>"/>
        </p>
        
        
          <p>
            <label> Medicamento: </label>
            <input type="text" name="medicamento" value="<%out.print(tratamento.getCodMedicamento());%>" />
        </p>
        
         <p>
            <label> Lote Medicamento: </label>
            <input type="text" name="lote" value="<%out.print(tratamento.getLote());%>"/>
        </p>

        <p>
            <label> Quantidade de aplicação: </label>
            <input type="text" name="quantidade" value="<%out.print(tratamento.getQuantidade());%>" />
        </p>
        <p>
            <label> Intervalo entre as aplicações (em horas): </label>
            <input type="text" name="intervalo" value="<%out.print(tratamento.getIntervalo());%>" />
        </p>
        <p>
            <label> Duração do tratamento (em dias): </label>
            <input type="text" name="duracao" value="<%out.print(tratamento.getDuracao());%>" />
        </p>
        <p>
            <label> Observação:: </label>
            <input type="text" name="observacao" value="<%out.print(tratamento.getObservacao());%>" />
        </p>
        
        <input type="submit" name="acao" value="Alterar" />

        <br>
        <br>
        <br>

        

    </fieldset>
</form>