
<%@page import="java.util.ArrayList"%>
<%@page import="Objetos.Animal"%>
<%@include file="pesquisarAnimal.jsp"%> 
<div id="inicial">
<section id="listaAnimais">
<table class="tabelaAnimais">
    <tr>
        <td name="codigo">Codigo</td>
        <td name="nome">Nome</td>
        <td name="baia">Baia</td>
    </tr>
    <%
        Animal animal;
                   animal = new Animal();
                   ArrayList<Animal> lista_animal = animal.listarAnimais();
                    
                   for(int cont=0; cont < lista_animal.size(); cont++){
                       out.print("<tr><td>");
                       out.print(lista_animal.get(cont).getCodigo());
                       out.print("</td><td>");
                       out.print(lista_animal.get(cont).getNome());
                       out.print("</td><td>");
                       
                       
                      
                   
                   
    %>
    
    
    <%
    
                   out.print(lista_animal.get(cont).getBaia());
                       out.print("</td></tr>");
                       
                       }
                   
    %>

     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>
</section>
<section id="perfil">
    <div id="foto">
       <img src="img/perfil.jpg" />
    </div>
    <div>
        <p>
            <label> Nome: </label> Mussarela
        </p>
        <p>
            <label> Sexo: </label> Masculino
        </p>
        <p>
            <label> Idade: </label> 8 anos
        </p>
        <p>
            <label> Raça: </label> Sem raça definida
        </p>
        <p>
            <label> Alimentação: </label> Média
        </p>
        <hr id="divisoria">
        <table>
            <tr>
                <td> </td>
                <td> Último </td>
                <td> Próximo </td>
            </tr>
             <tr>
                <td> Banho </td>
                <td> </td>
                <td> </td>
            </tr>
             <tr>
                <td> Tosa </td>
                <td> </td>
                <td> </td>
            </tr>
             <tr>
                <td> Medicamento </td>
                <td> </td>
                <td> </td>
            </tr>
             <tr>
                <td>Vacina </td>
                <td> </td>
                <td> </td>
            </tr>
        </table>
        <input type="button" id="botao1" value="Ver mais..." />
        <input type="button" id="botao1" value="Alterar" />
    </div>
</section>
</div>

  <%@include file="agenda.jsp"%> 