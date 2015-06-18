<%!
    public String IDPagina;
%>

<%
    IDPagina = request.getParameter("IDPagina");

    if (IDPagina != null && IDPagina.equals("Inicial")) {

%>

<jsp:include page="inicial.jsp"/>

<%    } else if (IDPagina != null && IDPagina.equals("Cadastro")) {
%>

<jsp:include page="cadastro.jsp"/>  


<%    } else if (IDPagina != null && IDPagina.equals("Acompanhamento")) {
%>

<jsp:include page="acompanhamento.jsp"/>  

<%    } else if (IDPagina != null && IDPagina.equals("Ajuda")) {
%>

<jsp:include page="ajuda.jsp"/>  

<%    } else if (IDPagina != null && IDPagina.equals("cadAnimal")) {
%>
<jsp:include page="animal.jsp"/>  

<%    } else if (IDPagina != null && IDPagina.equals("cadProntuario")) {
%>
<jsp:include page="cadProntuario.jsp"/>

<%    } else if (IDPagina != null && IDPagina.equals("cadCastracao")) {
%>
<jsp:include page="cadCastracao.jsp"/>

<%    } else if (IDPagina != null && IDPagina.equals("cadMedicamento")) {
%>
<jsp:include page="cadMedicamento.jsp"/>

<%  } else if (IDPagina != null && IDPagina.equals("cadVeterinario")) {
%>
<jsp:include page="cadVeterinario.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("cadAgente")) {
%>
<jsp:include page="cadAgente.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("cadAdotante")) {
%>
<jsp:include page="cadAdotante.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("listarVeterinarios")) {
%>
<jsp:include page="listarVeterinarios.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("listarAnimais")) {
%>
<jsp:include page="listarAnimais.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("cadBaia")) {
%>
<jsp:include page="cadBaia.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("altAnimal")) {
%>
<jsp:include page="altAnimal.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("excAnimal")) {
%>
<jsp:include page="excAnimal.jsp"/>


<!-- 14/05/2015-->
<%    } else if (IDPagina != null && IDPagina.equals("cadMedicamento")) {
%>
<jsp:include page="cadMedicamento.jsp"/>

<%    } else if (IDPagina != null && IDPagina.equals("cadTratamento")) {
%>
<jsp:include page="cadTratamento.jsp"/>

<%
} else if (IDPagina != null && IDPagina.equals("listarTratamentos")) {
%>
<jsp:include page="listarTratamentos.jsp"/>

<%
} else if (IDPagina != null && IDPagina.equals("listarMedicamentos")) {
%>
<jsp:include page="listarMedicamentos.jsp"/>
<!-- 03/06/2015  -->
<%
} else if (IDPagina != null && IDPagina.equals("altMedicamento")) {
%>
<jsp:include page="altMedicamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("excMedicamento")) {
%>
<jsp:include page="excMedicamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("pesqMedicamento")) {
%>
<jsp:include page="pesqMedicamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("pesqAnimal")) {
%>
<jsp:include page="pesqAnimal.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("altTratamento")) {
%>
<jsp:include page="altTratamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("excTratamento")) {
%>
<jsp:include page="excTratamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("pesqTratamento")) {
%>
<jsp:include page="pesqTratamento.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("listaTratamento")) {
%>
<jsp:include page="listaTratamento.jsp"/>

<!-- 04/06/2015 -->
<%
} else if (IDPagina != null && IDPagina.equals("pesqVeterinario")) {
%>
<jsp:include page="pesqVeterinario.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("altVeterinario")) {
%>
<jsp:include page="altVeterinario.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("excVeterinario")) {
%>
<jsp:include page="excVeterinario.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("pesqVeterinario")) {
%>
<jsp:include page="pesqVeterinario.jsp"/>
<!-- 06-06-2015 -->
<%
} else if (IDPagina != null && IDPagina.equals("excBaia")) {
%>
<jsp:include page="excBaia.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("altBaia")) {
%>
<jsp:include page="altBaia.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("pesqBaia")) {
%>
<jsp:include page="pesqBaia.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("altAdotante")) {
%>
<jsp:include page="altAdotante.jsp"/>
<!-- 08/06/2015 -->
<%
} else if (IDPagina != null && IDPagina.equals("altCastracao")) {
%>
<jsp:include page="altCastracao.jsp"/>
<%
} else if (IDPagina != null && IDPagina.equals("excCastracao")) {
%>
<jsp:include page="excCastracao.jsp"/>

<%
} else if (IDPagina != null && IDPagina.equals("telaSucesso")) {
%>
<jsp:include page="telaSucesso.jsp"/>

<%
} else {
%>


<jsp:include page="inicial.jsp"/>
<%
    }
%>










