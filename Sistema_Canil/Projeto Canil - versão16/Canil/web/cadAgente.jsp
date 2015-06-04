<h3> Cadastro Agente </h3>

<form method="POST" action="ServletAgente"> 
    <fieldset> 
        <h4> Características </h4>
        <p class="barra" > </p>
        <p>
            <label> Nome: </label>
            <input type="text" name="nome" title="nome" />
        </p>
        <p>
            <label> CPF: </label>
            <input type="text" name="cpf" />
        </p>
        <p>
            <label> Endereço: </label>
            <input type="text" name="endereco" />
        </p>
        <p>
            <label> Telefone: </label>
            <input type="text" name="telefone" />
        </p>
        <p>
            <label> Email: </label>
            <input type="text" name="email" />
        </p>
        <p>
            <label> Usuário: </label>
            <input type="text" name="usuario" />
        </p>
        <p>
            <label> Senha: </label>
            <input type="password" name="senha" />
        </p>

        <input type="submit" value="Cadastrar" />

    </fieldset>
</form>