<%-- 
    Document   : cadaTratamento
    Created on : 11/05/2015, 01:56:50
    Author     : Poliana
--%>

<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

<h3> Medicamentos </h3>
<form method="POST" action="ServletMedicamento">

    <p>
        <label> Nome: </label>
        <input type="text" name="nome" />
    </p>
    <p>
        <label> Tipo: </label>
            <select id="tipo" name="tipo">
                <option> Remédio </option>
                <option> Vacina </option>
                <option> Outros </option>
            </select>
    </p>
    <p>
        <label> Doses: </label>
        <input type="text" name="doses" />
    </p>
    <p>
        <label> Descrição: </label>
        <input type="text" name="descricao" />
    </p>
    <p>
        <input type="submit" name="acao" value="Cadastrar" />
    </p>
    
    
    <br>
    <br>
    <br>

    <h4> Pesquisar </h4>
    <p class="barra" > </p>
    <p>
    <label> Nome do Medicamento: </label>
    <input type="text" name="pesquisa" />
    </p>
        
    <input type="submit" name="acao" value="Pesquisar" />
    <p>
    <input type="submit" name="acao" value="Listar" />
    </p>
    
</form>