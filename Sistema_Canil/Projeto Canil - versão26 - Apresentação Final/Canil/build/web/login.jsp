
<div class="container">
    <div id="login"> 
        <br><br><br><br><br><br>
        <img src="./img/patinhafavicon.png" style=" float: left;margin-top: 7px; margin-right: 7px; margin-bottom: 7px; margin-left: 70px; width: 55px;" alt="">
        <h1 class="form-signin-heading">SisCanil</h1>
        <br><br><br><br><br><br>
        <form method="POST" action="ServletLogin" class="form-signin" >
            <fieldset>
            <h2 class="form-signin-heading">Autenticação</h2>
            <div class="form-group has-feedback red">
                
                    <input type="text" name="usuario" class="form-control" placeholder="Usuário" required="" autofocus=""/> 
                
            </div>
            <div class="form-group has-feedback red">
                
                    <input type="password" name="senha"  class="form-control" placeholder="Password" required="" />
                      <input type="password" name="tipo" value="veterinario" style="display:none;"/>
                
            </div>
            <input type="submit" value="Entrar" class="btn btn-lg btn-warning btn-block"/>
            </fieldset>
        </form>

    </div>
</div>