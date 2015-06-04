<%-- 
    Document   : cadaTratamento
    Created on : 14/05/2015, 01:56:50
    Author     : Poliana
--%>
<%@page import="Objetos.Tratamento"%>
<%@page import="Objetos.Animal"%>
<%@page import="Objetos.Medicamento"%>
<%@page import="java.util.ArrayList"%>

   
<h3> Cadastro de Tratamento </h3>

<form method="POST" action="ServletTratamento"> 
<h4> Pesquisar </h4>
        <p class="barra" > </p>
        <p>
            <label> Pesquisar por: </label>
                <select name="tipo">
                    <option> Nome Animal </option>
                    <option> C�digo Animal </option>
                </select><br /><br />
            <input type="text" name="pesquisa" />

        </p>
        <input type="submit" name="acao" value="Pesquisar" />

        <p>
            <!--input type="submit" name="acao" value="Listar" />-->
        </p>
</form>
<br /><br /><br />
<%@include file="listaTratamento.jsp"%>


<form method="POST" action="ServletTratamento"> 
    <fieldset> 
        
         <h5 onclick="Mudarestado('esconde')"> Cadastrar Tratamento </h5>
     
      <div id="esconde">
        <p class="barra" > </p>
        <p>
    
        
            
            <label> Animal: </label>
            
            <select name="codAnimal">
                <option value="2"> Nenhum </option>
                <%
                   Animal animal;
                   animal = new Animal();
                  ArrayList<Animal> lista_animal = animal.listarAnimais();
                    
                   for(int cont=0; cont < lista_animal.size(); cont++){
                       out.print("<option value=\"");
                       out.print(lista_animal.get(cont).getCodigo());
                       out.print("\" >");
                       out.print(lista_animal.get(cont).getNome());
                       out.print("</option>");
                   }
               
              %>
              
            </select>
        </p>
        <p>
            <label> Medicamento: </label>
            
            <select name="codMedicamento">
                <option value="2"> Nenhum </option>
                <%
                   Medicamento medicamento;
                   medicamento = new Medicamento();
                   ArrayList<Medicamento> lista_medicamento = medicamento.listarMedicamentos();
                    
                   for(int cont=0; cont < lista_medicamento.size(); cont++){
                       out.print("<option value=\"");
                       out.print(lista_medicamento.get(cont).getCodigo());
                       out.print("\" >");
                       out.print(lista_medicamento.get(cont).getNome());
                       out.print("</option>");
                   }
               
              %>
              
            </select>
        </p>       
        <p>
            <label> Lote Medicamento: </label>
            <input type="text" name="lote" />
        </p>
        <p>
            <label> Quantidade de aplica��o: </label>
            <input type="text" name="quantidade" />
        </p>
        <p>
            <label> Intervalo entre as aplica��es (em horas): </label>
            <input type="text" name="intervalo" />
        </p>
        <p>
            <label> Dura��o do tratamento (em dias): </label>
            <input type="text" name="duracao" />
        </p>
        <p>
            <label> Observa��o: </label>
            <input type="text" name="observacao" />
        </p>
        <input type="submit" name="acao" value="Cadastrar" />
        
        <br>
        <br>
        <br>

        
      </div>
    </fieldset>
    
</form>
              
