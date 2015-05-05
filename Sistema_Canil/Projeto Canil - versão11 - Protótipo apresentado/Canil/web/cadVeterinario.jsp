<%@page import="Objetos.Animal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Objetos.Veterinario"%>
<h3> Cadastro Veterinario </h3>

<form method="POST" action="ServletVeterinario"> 
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
            <label> CRMV: </label>
            <input type="text" name="crmv" />
        </p>
        <p>
            <label> Usuário: </label>
            <input type="text" name="usuario" />
        </p>
        <p>
            <label> Senha: </label>
            <input type="password" name="senha" />
        </p>
        <input type="submit" name="acao" value="Cadastrar" />

        <br>
        <br>
        <br>

        <h4> Pesquisar </h4>
        <p class="barra" > </p>
        <p>
            <label> Nome do Veterinário: </label>
            <input type="text" name="pesquisa" />
        </p>
        
        <input type="submit" name="acao" value="Pesquisar" />
        <p>
            <input type="submit" name="acao" value="Listar" />
        </p>

    </fieldset>
</form>

<hr />