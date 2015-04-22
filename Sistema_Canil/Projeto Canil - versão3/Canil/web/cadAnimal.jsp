<h3> Cadastro de Animais </h3>


<form method="POST" action="valAnimal"> 
    <fieldset> 
        <h4> Características </h4>
        <p class="barra" > </p>
        <p>
            <label> Código: </label>
            <input type="text" name="codigo" title="codigo" />
        </p>
        <p>
            <label> Nome: </label>
            <input type="text" name="nome" />
        </p>
        <p>
            <label> Data Nascimento: </label>
            <input type="date" name="datanasc" />
        </p>
        <p>
            <label> Tipo: </label>
            <select id="tipo">
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
            <select id="pelagem">
                <option> Curto </option>
                <option> Médio </option>
                <option> Longo </option>
                <option> Outros </option>
            </select>
        </p>
        <p>
            <label> Cor: </label>
            <select id="pelagem">
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
            <input type="radio" name="agressivo" value="0"> Sim
            <input type="radio" name="agressivo" value="1"> Não
        </p> 
         <p>
            <label> Status: </label>
            <select id="status">
                <option id="0"> Ativo </option>
                <option id="1"> Doado </option>
                <option id="2"> Faleceu </option>
                <option id="3"> Outros </option>
            </select>
        </p> 
        
        <h4> Origem </h4>
        <p class="barra" > </p>
        <p>
            <label> Tipo de recolhimento: </label>
            <select id="recolhimento">
                <option> VP </option>
                <option> CM </option>
                <option> PP </option>
                <option> IR </option>
                <option> IC </option>
                <option> Outros </option>
            </select>
        </p>
        <p>
            <label> Endereço: </label>
            <input type="text" name="endereco" />
        </p>
        <p>
            <label> Bairro: </label>
            <input type="text" name="bairro" />
        </p>
        <p>
            <label> Cidade: </label>
            <input type="text" name="cidade" />
        </p>
        <p>
            <label> UF: </label>
            <input type="text" name="uf" />
        </p>
        
        <h4> Adoção </h4>
        <p class="barra" > </p>
        <p>
            <label> Responsável: <label>
            <input type="text" name="responsavel" />    
        </p>
        <p>
            <label> CPF/CNPJ: </label>
            <input type="text" name="cpf" />
        </p>
        <p>
            <label> Endereco: </label>
            <input type="text" name="endereco" />
        </p>
        <p>
            <label> Bairro: </label>
            <input type="text" name="bairro" />
        </p>
         <p>
            <label> Cidade: </label>
            <input type="text" name="cidade" />
        </p>
        <p>
            <label> UF: </label>
            <input type="text" name="uf" />
        </p>
        <p>
            <label> Telefone: </label>
            <input type="text" nmae="telefone" />
        </p>
        <p>
            <label> Celular: </label>
            <input type="text" name="celular" />
        </p>
         <p>
            <label> Anexar Foto: </label>
            <input type="button" name="foto" />
        </p>
        <p>
            <label> Observações: </label>
            <textarea> </textarea>
        </p>
        
       <input type="submit" value="Cadastrar" />
       
        
    </fieldset>
</form>