<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Animal"%>
<%!
    public int cod;
    public int verifica = -1; // verifica qual radiobox deve ser checked
%>

<%

    cod = Integer.parseInt(request.getParameter("Animal"));
   
   
    Animal animal;
    animal = new Animal();
    animal = animal.buscarAnimal(cod);
    
%>

<form method="POST" action="ServletAnimal"> 
    <fieldset> 
       
        <br /><br /><br />
         <h3> Alterar Animal </h3>
        <!--<h4> Características </h4>-->
        <p class="barra" > </p>
        
        <p>
            <label> Codigo: </label>
            <input type="text" name="codigo" value="<%out.print(animal.getCodigo());%>"/>
        </p>
        
        <p>
            <label> Nome: </label>
            <input type="text" name="nome" value="<%out.print(animal.getNome());%>"/>
        </p>
       
        <p>
            <label> Idade: </label>
            <input type="text" name="idade" value="<%out.print(animal.getIdade());%>"/>
        </p>
        <p>
            <label> Tipo: </label>
              <% if(animal.getTipo()=="Cachorro"){
                     verifica = 0;
                 }else if(animal.getPelagem()=="Gato"){
                     verifica = 1;
                 }else {
                     verifica=3;
                 }
           out.print(animal.getTipo()); 
            %>
            <select id="tipo" name="tipo" selected="2">
                <option value="1"> Cachorro </option>
                <option id="2"> Gato </option>
                <option value="3"> Outros </option>
            </select>
        </p>
        <p>
            <label> Raça: </label>
            <input type="text" name="raca" value="<%out.print(animal.getRaca());%>" />
        </p>
        <p>
            <label> Pelagem: </label>
            <% if(animal.getPelagem()=="Curto"){
                     verifica = 0;
                 }else if(animal.getPelagem()=="Medio"){
                     verifica = 1;
                 }else if(animal.getPelagem()=="Longa"){
                     verifica = 2;
                 }else {
                     verifica=3;
                 }
            
            %>
           
            <select id="pelagem" name="pelagem">
                <option <% if (verifica==0){ out.print("selected"); } %>> Curto </option>
                <option <% if (verifica==1){ out.print("selected"); } %>> Médio </option>
                <option <% if (verifica==2){ out.print("selected"); } %>> Longo </option>
                <option <% if (verifica==3){ out.print("selected"); } %>> Outros </option>
            </select>
        </p>
        <p>
            <label> Cor: </label>
            <select id="pelagem" name="cor" value="<%out.print(animal.getCor());%>">
                <option> Branco </option>
                <option> Bege </option>
                <option> Cinza </option>
                <option> Marrom </option>
                <option> Preto </option>
                <option> Tricolor </option>
                <option> Outros </option>
            </select>
        </p>
        <p>
            <label> Sexo: </label>
            <% if(animal.getSexo()=="macho"){
                     verifica = 0;
                 }else{
                     verifica = 1;
                 }
            %>
            <input type="radio" name="sexo" value="macho" <% if (verifica==0){ out.print("checked"); } %>> Macho
            <input type="radio" name="sexo" value="femea" <% if (verifica==1){ out.print("checked"); } %>> Fêmea
        </p> 
        <p>
            <label> Peso: </label>
            <input type="text" name="peso" value="<%out.print(animal.getPeso());%>" />
        </p>
        <p>
            <label> Animal agressivo? </label>
             <% if(animal.getAgressor()=="Sim"){
                     verifica = 0;
                 }else{
                     verifica = 1;
                 }
            %>
            <input type="radio" name="agressivo" value="sim" <% if (verifica==0){ out.print("checked"); } %>> Sim
            <input type="radio" name="agressivo" value="nao" <% if (verifica==1){ out.print("checked"); } %>> Não
        </p>
        <p>
            <label> Ração: </label>
            <input type="text" name="racao" value="<%out.print(animal.getRacao());%>" />
        </p>

        <p>
            <label> Bairro do recolhimento: </label>
            <input type="text" name="bairro" value="<%out.print(animal.getBairroRecolhimento());%>"/>
        </p>
         <p>
            <label> Baia: </label>
            
            <select name="baia">
                <option value="2"> Nenhuma </option>
                
            </select>
        </p>
        <p>
            <label> Anexar Foto: </label>
            <input type="file" name="foto"   />
        </p>
        <p>
            <label> Observações: </label>
            <textarea name="observacao" value="<%out.print(animal.getObservacao());%>"> </textarea>
        </p>
        <input type="submit" name="acao" value="Alterar" />

        <br>
        <br>
        <br>

        

    </fieldset>
</form>