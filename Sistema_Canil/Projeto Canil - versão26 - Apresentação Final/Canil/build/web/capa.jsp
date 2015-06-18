<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" text="text/css" href="css/formatacao.css" />

        <script src="script/jquery-2.1.3.js" type="text/javascript"></script>  
        <script src="script/funcoes.js" type="text/javascript"></script> 
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="script/validacao.js"  type="text/javascript" charset="UTF-8"></script>
    
    <script src="js/bootstrapValidator.js" type="text/javascript" charset="utf-8"></script>
    <link rel="icon" type="image/png" href="./img/patinhafavicon.png"/>
    <script>
        function exibe(){
    document.getElementById("esconde").style.display = "block";
    alert("deu certo");
        }
    </script>
        
	<script>
		$(function(){   
			var nav = $('#menuHeader');   
			$(window).scroll(function () { 
				if ($(this).scrollTop() > 150) { 
					nav.addClass("menu-fixo"); 
				} else { 
					nav.removeClass("menu-fixo"); 
				} 
			});  
		});
	</script>
        
        <title>SisCanil</title>
    </head>
 <%@include file="menu.jsp"%> 
 <br /><br /><br />
<div class="container">

 
 <%@include file="if.jsp"%> 
 <%@include file="rodape.jsp"%>   
 
</div>