<%-- 
    Document   : cadBaia
    Created on : 03/05/2015, 11:13:52
    Author     : Alexandre
--%>
<h3> Cadastro de baías </h3>
<form  method="POST" action="ServletBaia" />
    <fildset>
        <label> Nome: </label>
        <input type="text" name="nome" required />
        <input type="submit" name="acao" value="Cadastrar" />
    </fieldset>
</form>