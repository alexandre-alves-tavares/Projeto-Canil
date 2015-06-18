<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int cod;
    public int verifica = -1; // verifica qual radiobox deve ser checked
%>

<%

    cod = Integer.parseInt(request.getParameter("Medicamento"));
   
   
    Medicamento medicamento;
    medicamento = new Medicamento();
    medicamento = medicamento.buscarMedicamento(cod);
    
%>

<form method="POST" action="ServletMedicamento"> 
    <fieldset> 
       
        <br /><br /><br />
         <h3> Alterar Medicamento </h3>
        <!--<h4> Características </h4>-->
        <p class="barra" > </p>
        <div class="form-group col-sm-8">
        <p>
            <label  class="col-lg-3 control-label"> Codigo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="codigo" value="<%out.print(medicamento.getCodigo());%>" class="form-control"/>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Nome: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="nome" value="<%out.print(medicamento.getNome());%>" class="form-control"/>
       </div>
            </div >
            <label class="col-lg-3 control-label"> Tipo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <% if(medicamento.getTipo()=="Remédio"){
                     verifica = 0;
                 }else if(medicamento.getTipo()=="Vacina"){
                     verifica = 1;
                 }else {
                     verifica=2;
                 }
            
            %>
           
            <select id="tipo" name="tipo" class="form-control">
                <option <% if (verifica==0){ out.print("selected"); } %>> Remédio </option>
                <option <% if (verifica==1){ out.print("selected"); } %>> Vacina </option>
                <option <% if (verifica==2){ out.print("selected"); } %>> Outros </option>
            </select>
        </div>
            </div >
            <label class="col-lg-3 control-label"> Doses: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="doses" value="<%out.print(medicamento.getDoses());%>" class="form-control" />
        </div>
            </div >
            <label class="col-lg-3 control-label"> Descrição: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="descricao" value="<%out.print(medicamento.getDescricao());%>" class="form-control"/>
       </div>
            </div >
            <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block"/>
       </div>
        

        <br>
        <br>
        <br>

        

    </fieldset>
</form>