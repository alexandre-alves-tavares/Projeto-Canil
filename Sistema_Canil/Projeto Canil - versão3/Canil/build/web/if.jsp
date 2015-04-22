<%!
    public String IDPagina;
%>

<%
    IDPagina = request.getParameter("IDPagina");

    if (IDPagina != null && IDPagina.equals("Inicial")) {

%>

<jsp:include page="inicial.jsp"/>

<%    }
    
    else if (IDPagina != null && IDPagina.equals("Cadastro")) {
 %>
 
<jsp:include page="cadastro.jsp"/>  


<%    }
    
    else if (IDPagina != null && IDPagina.equals("Acompanhamento")) {
 %>
 
<jsp:include page="acompanhamento.jsp"/>  

<%    }
    
    else if (IDPagina != null && IDPagina.equals("Ajuda")) {
 %>
 
<jsp:include page="ajuda.jsp"/>  

<%    }
    
    else if (IDPagina != null && IDPagina.equals("cadAnimal")) {
 %>
 <jsp:include page="cadAnimal.jsp"/>  
 
 <%    }
    
    else if (IDPagina != null && IDPagina.equals("cadProntuario")) {
 %>
 <jsp:include page="cadProntuario.jsp"/>

 <%    }
    
    else if (IDPagina != null && IDPagina.equals("cadCastracao")) {
 %>
 <jsp:include page="cadCastracao.jsp"/>
 
 <%    }
    
    else if (IDPagina != null && IDPagina.equals("cadMedicamento")) {
 %>
 <jsp:include page="cadMedicamento.jsp"/>
 
 <%  
     }else{
 %>
 
 <jsp:include page="inicial.jsp"/>
 
 
 <%
   }
%>










