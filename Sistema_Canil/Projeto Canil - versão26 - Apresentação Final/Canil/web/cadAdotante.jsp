<%@page import="Objetos.Animal"%>

<h3> Cadastro Adotante </h3>



<%@include file="listaAdotante.jsp"%>


<form method="POST" action="ServletAgente"> 
    <fieldset> 
        <h4> Características </h4>
        <p class="barra" > </p>
        <div class="form-group col-sm-8">


            <div class="col-lg-8">
                <div class=" has-feedback form-group">

                    <label> Nome: </label>
                    <input type="text" name="nome" title="nome" class="form-control" />
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label> CPF: </label>
                    <input type="text" name="cpf" class="form-control" />
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label> Endereço: </label>
                    <input type="text" name="endereco" class="form-control" />
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label> Telefone: </label>
                    <input type="text" name="telefone" class="form-control"/>
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label> Email: </label>
                    <input type="text" name="email" class="form-control"/>
                </div>
            </div >
            <div class="col-lg-8">
                <div class=" has-feedback form-group">
                    <label> Código do Animal: </label>
                    <select name="codAnimal" class="form-control">
                        <option value="2"> Nenhum </option>
                        <%                    Animal animal;
                            animal = new Animal();
                            ArrayList<Animal> lista_animal = animal.listarAnimais();

                            for (int cont = 0; cont < lista_animal.size(); cont++) {
                                out.print("<option value=\"");
                                out.print(lista_animal.get(cont).getCodigo());
                                out.print("\" >");
                                out.print(lista_animal.get(cont).getNome());
                                out.print("</option>");
                            }

                        %>

                    </select>
                </div>
            </div >
            <input type="submit" value="Cadastrar" class="btn btn-primary btn-block "/>
        </div>
    </fieldset>
</form>