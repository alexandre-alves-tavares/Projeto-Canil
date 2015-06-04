

<h2> Animal </h2>


<%@page import="Objetos.Baia"%>
<%@page import="java.util.ArrayList"%>

<form method="POST" action="ServletAnimal"> 
    <fieldset>
    <h4> Pesquisar </h4>
        <p class="barra" > </p>
        <p>
            
           
            <label> Nome do Animal: </label>
        </p><p>
             
              <input type="text" name="pesquisa" />
              
        </p>
       <input type="submit" name="acao" value="Pesquisar" />

    </fieldset>
</form>


<%@include file="listaAnimais.jsp"%>




<form method="POST" action="ServletAnimal"> 
    <fieldset>
         <h5 onclick="Mudarestado('esconde')"> Cadastrar Animal </h5>
        
        <div id="esconde">
        <p class="barra" > </p>
        <p>
            <label> Nome: </label>
            <input type="text" name="nome" />
        </p>
        <p>
            <label> Idade: </label>
            <input type="text" name="idade" />
        </p>
        <p>
            <label> Tipo: </label>
            <select id="tipo" name="tipo">
                <option> Cachorro </option>
                <option> Gato </option>
                <option> Outros </option>
            </select>
        </p>
        <p>
            <label> Raça: </label>
            <input type="text" name="raca" />
        </p>
        <p>
            <label> Pelagem: </label>
            <select id="pelagem" name="pelagem">
                <option> Curto </option>
                <option> Médio </option>
                <option> Longo </option>
                <option> Outros </option>
            </select>
        </p>
        <p>
            <label> Cor: </label>
            <select id="pelagem" name="cor">
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
            <input type="radio" name="sexo" value="macho"> Macho
            <input type="radio" name="sexo" value="femea"> Fêmea
        </p> 
        <p>
            <label> Peso: </label>
            <input type="text" name="peso" />
        </p>
        <p>
            <label> Animal agressivo? </label>
            <input type="radio" name="agressivo" value="agressivo"> Sim
            <input type="radio" name="agressivo" value="naoagressivo"> Não
        </p>
        <p>
            <label> Ração: </label>
            <input type="text" name="racao" />
        </p>

        <p>
            <label> Bairro do recolhimento: </label>
            <input type="text" name="bairro" />
        </p>
         <p>
            <label> Baia: </label>
            
            <select name="baia">
                <option value="2"> Nenhuma </option>
                <%
                   Baia baia;
                   baia = new Baia();
                   ArrayList<Baia> lista_baia = baia.ListarBaias();
                    
                   for(int cont=0; cont < lista_baia.size(); cont++){
                       out.print("<option value=\"");
                       out.print(lista_baia.get(cont).getCodigo());
                       out.print("\" >");
                       out.print(lista_baia.get(cont).getNome());
                       out.print("</option>");
                   }
               
              %>
              
            </select>
        </p>
        <p>
            <label> Anexar Foto: </label>
            <input type="file" name="foto" value="c:/" />
        </p>
        <p>
            <label> Observações: </label>
            <textarea name="observacao"> </textarea>
        </p>
        <input type="submit" name="acao" value="Cadastrar" />
        </div>
        
    </fieldset>
</form>