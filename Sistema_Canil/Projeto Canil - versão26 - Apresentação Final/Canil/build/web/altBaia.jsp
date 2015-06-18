<%@page import="Objetos.Baia"%>
<%@page import="java.util.ArrayList"%>

<%!
    public int cod;
%>

<%

    cod = Integer.parseInt(request.getParameter("Baia"));
   
   
    Baia baia;
    baia = new Baia();
    baia = baia.buscarBaia(cod);
    
%>

<form method="POST" action="ServletBaia"> 
    <fieldset> 
       
        <br /><br /><br />
         <h3> Alterar Baia </h3>
        <p class="barra" > </p>
        <div class="form-group col-sm-8">
        <p>
            <label class="col-lg-3 control-label"> Codigo: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="codigo" value="<% out.print(baia.getCodigo());%>" class="form-control"/>
          </div>
            </div >
            <label class="col-lg-3 control-label"> Nome: </label>
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
            <input type="text" name="nome" value="<% out.print(baia.getNome());%>" class="form-control"/>
          </div>
            </div >
            <input type="submit" name="acao" value="Alterar" class="btn btn-primary btn-block" />
          </div>
           
       
       
        <br>
        <br>
        <br>

        

    </fieldset>
</form>