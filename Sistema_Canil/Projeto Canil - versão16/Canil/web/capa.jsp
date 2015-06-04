<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" text="text/css" href="css/formatacao.css" />
        <script src="script/jquery-2.1.3.js" type="text/javascript"></script>  
        <script src="script/funcoes.js" type="text/javascript"></script>  
        
        
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
        
        <title>JSP Page</title>
    </head>

<div class="container">

<%@include file="cabecalho.jsp"%>
 <%@include file="menu.jsp"%>  
 <%@include file="if.jsp"%> 
 <%@include file="rodape.jsp"%>   
 
</div>