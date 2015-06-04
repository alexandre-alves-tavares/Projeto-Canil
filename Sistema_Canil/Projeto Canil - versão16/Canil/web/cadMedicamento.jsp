<%-- 
    Document   : cadaTratamento
    Created on : 11/05/2015, 01:56:50
    Author     : Poliana
--%>

<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

<%!
    public String acao;
%>

<h3> Medicamentos </h3>

<form method="POST" action="ServletMedicamento">
 <h4> Pesquisar </h4>
    <p class="barra" > </p>
    <p>
    <label> Nome do Medicamento: </label>
    <input type="text" name="pesquisa" required/>
    </p>
        
    <input type="submit" name="acao" value="Pesquisar"/>
    <p>
    <!--<input type="submit" name="acao" value="Listar" />-->
    </p>
</form>
<%
     
  
%>


<br /> <br /> <br />
<%@include file="listaMedicamentos.jsp"%>


<form method="POST" action="ServletMedicamento">
     <h5 onclick="Mudarestado('esconde')"> Cadastrar Medicamento </h5>
     
      <div id="esconde">
        <p class="barra" > </p>
        <p>
     
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
    </div>

   
</form>