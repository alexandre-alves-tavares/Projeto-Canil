





<%

String IDPagina = request.getParameter("IDPagina");

out.println(IDPagina);
    
  if (IDPagina == "Inicial"){
     %>
     <jsp:include page="inicial.jsp"/>
      <%
    
      
  }
        
    
   
%>

