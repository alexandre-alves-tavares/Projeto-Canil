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
        
        <p>
            <label> Codigo: </label>
            <input type="text" name="codigo" value="<%out.print(medicamento.getCodigo());%>"/>
        </p>
        
        <p>
            <label> Nome: </label>
            <input type="text" name="nome" value="<%out.print(medicamento.getNome());%>"/>
        </p>
        
        <p>
            <label> Tipo: </label>
            <% if(medicamento.getTipo()=="Remédio"){
                     verifica = 0;
                 }else if(medicamento.getTipo()=="Vacina"){
                     verifica = 1;
                 }else {
                     verifica=2;
                 }
            
            %>
           
            <select id="tipo" name="tipo">
                <option <% if (verifica==0){ out.print("selected"); } %>> Remédio </option>
                <option <% if (verifica==1){ out.print("selected"); } %>> Vacina </option>
                <option <% if (verifica==2){ out.print("selected"); } %>> Outros </option>
            </select>
        </p>
        <p>
            <label> Doses: </label>
            <input type="text" name="doses" value="<%out.print(medicamento.getDoses());%>" />
        </p>
        <p>
            <label> Descrição: </label>
            <input type="text" name="descricao" value="<%out.print(medicamento.getDescricao());%>" />
        </p>
        
        <input type="submit" name="acao" value="Alterar" />

        <br>
        <br>
        <br>

        

    </fieldset>
</form>