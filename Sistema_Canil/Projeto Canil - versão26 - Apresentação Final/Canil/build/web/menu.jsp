<!--<nav id="menuHeader">
    <ul>
        <li>
            <a href="?IDPagina=Inicial" alt="Inicial" /> Inicial </a>
        </li>
        <li>
            <a href="?IDPagina=Cadastro" alt="Cadastro" /> Cadastros </a>
        </li>
    </ul>
</nav>-->



<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

            </button>
            <img src="./img/patinhaLogo.png" style="width: 46px;height: 35px; float: left;margin: 7px;" alt="">
            <a class="navbar-brand" href="#">SisCanil</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="?IDPagina=Inicial" alt="Inicial" /> Inicial </a>
                </li>
                <li>
                    <a id="dropdownMenu1" href="#" alt="Cadastro" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" /> Administração </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"  style="margin-top:3px">
                        <li><a href="?IDPagina=cadAnimal" alt="Animal" />Animal</a></li>
                        <li><a href="?IDPagina=cadTratamento" alt="Tratamento" />Tratamento</a></li>
                        <li><a href="?IDPagina=cadCastracao" alt="Castração" />Castração</a></li>
                        <li><a href="?IDPagina=cadMedicamento" alt="Medicamento" />Medicamento</a></li>
                        <li><a href="?IDPagina=cadBaia" alt="Baia" />Baia</a></li>
                        <li><a href="?IDPagina=cadVeterinario" alt="Veterinário" />Veterinario</a></li>
                        <!--<li><a href="?IDPagina=cadAgente" alt="Agente" />Agente</a></li>-->
                        <li><a href="?IDPagina=cadAdotante" alt="Adotante" />Adotante</a></li>
                    </ul>
                </li>

            </ul>
            </li>
            </ul>
            <form name="logout" action="ServletLogout" method="POST">
                <input type="submit" value="SAIR" name="sair" class="btn btn-sm btn-danger" style=" float: right;  margin: 10px; "/>
            </form>
        </div><!--/.nav-collapse -->

    </div>
</nav>
