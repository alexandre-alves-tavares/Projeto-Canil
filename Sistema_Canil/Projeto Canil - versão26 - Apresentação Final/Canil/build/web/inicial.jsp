
<%@page import="Objetos.Animal"%>
<br /><br />
<!--<form method="POST" action="ServletAnimal"> 
    <fieldset>
    <h4> Pesquisar Animal</h4>
    <p class="barra" > </p>
      
        <input type="text" name="pesquisa" style="float:left"/>
        <input type="submit" name="acao" value="Pesquisar" style="float:left" />
    </fieldset>
</form>-->

<form method="POST" action="ServletAnimal" enctype="multipart/form-data"> 
    <fieldset>
        <h4> Pesquisar </h4>
        <p class="barra" > </p>
        <p>


        <label> Nome do Animal: </label>
        </p>
        <div class="form-inline">
            <div class="form-group has-feedback col-sm-8"  >
                <input type="text" name="pesquisa" class="form-control form-horizontal" style="width: 95%"  />
            </div>
            <div class="col-sm-3">
                <input type="submit" name="acao" value="Pesquisar" class="form-control btn btn-sm btn-primary" />
            </div>
        </div>
    </fieldset>
</form>



<%!
    public int Npaginas;
    public int qPaginas;
    public int cod;
    public int qtdPorPagina = 40;
    //public int aux1=0;
    //Spublic int aux2=0;
%>
<div id="inicial">
<section id="listaAnimais">
<table class="tabelaAnimais">
    <tr>
        <td name="codigo"> Codigo </td>
        <td name="nome"> Nome </td>
        <td name="baia"> Baia </td>
    </tr>
    
    <%   
        Animal animal;
        animal = new Animal();
        
      if(request.getParameter("pagin") != null){
        Npaginas = Integer.parseInt(request.getParameter("pagin"));
     }else{
         Npaginas = 1;      
     }
      
       if(request.getParameter("cod") != null){
        cod = Integer.parseInt(request.getParameter("cod"));
     }else{
           cod = 0;
       }
        

        ArrayList<Animal> ani = animal.paginacaoAnimais(qtdPorPagina, Npaginas);
        qPaginas =  animal.contarPaginas(animal.contarAnimais(),qtdPorPagina);
        
    int aux2 = 0;
    /*int aux2 = (Npaginas * 3) - 3;    
    if (aux2 == 3 && Npaginas !=1){
        aux2 = (Npaginas * 3) - 2;
        
    }*/
    int aux1 = 0;  
    if(ani.isEmpty()){
        
    }else{
        int auxCor = 0;
        String cor = "";
    for(int cont=0; cont < ani.size(); cont++){
        if(auxCor % 2 == 0){
            cor = "par";            
        }
        else{
            cor = "impar";
        }
        aux1 = ani.get(cont).getCodigo();
        out.print("<tr id=\""+ cor +"\"><td><a href=\"?IDPagina=Inicial&pagin="+ Npaginas +"&cod="+ aux2 +"\" >");
        out.print("<label>" + ani.get(cont).getCodigo()+ "</label>");
        out.print("</a></td><td><a href=\"?IDPagina=Inicial&pagin="+ Npaginas +"&cod="+ aux2 +"\" ><label>");  
        out.print(ani.get(cont).getNome());
        out.print("</label></a></td><td><a href=\"?IDPagina=Inicial&pagin="+ Npaginas +"&cod="+ aux2 +"\" ><label>");  
        out.print(ani.get(cont).getBaia());
        out.print("</label></a></td></tr>   "); 
        auxCor++;
        
        aux2++;
    }
    }          
    %>
    <tr>
    <td>
<div id="paginadores">
                
    <%
    // PAGINADORES
        
      for(int j=1; j<=qPaginas; j++){
        if(j==Npaginas){
             out.print(" <a id=\"selecionado\" href=\"?IDPagina=Inicial&pagin="+j+"\" /> "+j+" </a>");
        }else{
        out.print(" <a href=\"?IDPagina=Inicial&pagin="+j+"\" /> "+j+" </a>");
        }
    }
    
    %>
</div>
    </td>
    </tr>
   
</table>
 

</section>
<section id="perfil">
    <div id="foto">
        
        <% out.print("<img src=\"fotos/" + ani.get(cod).getUrlFoto() + "\"/>"); %>
        
        
    </div>
    <div>
        <p>
            <label> Nome: </label> <% out.print(ani.get(cod).getNome()); %>
        </p>
        <p>
            <label> Sexo: </label> <% out.print(ani.get(cod).getSexo()); %>
        </p>
        <p>
            <label> Idade: </label> <% out.print(ani.get(1).getIdade()); %>
        </p>
        <p>
            <label> Raça: </label> <% out.print(ani.get(cod).getRaca()); %>
        </p>
        <p>
            <label> Alimentação: </label> <% out.print(ani.get(cod).getRacao()); %>
        </p>
        <hr id="divisoria">
       <!-- <table>
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
        </table>-->
        <a href="capa.jsp?IDPagina=altAnimal&Animal=<% out.print(ani.get(cod).getCodigo()); %>" /> <input type="button" id="botao1" value="Alterar/Ver mais..." /> </a> 
    </div>
</section>
</div>

  <%@include file="agenda.jsp"%> 