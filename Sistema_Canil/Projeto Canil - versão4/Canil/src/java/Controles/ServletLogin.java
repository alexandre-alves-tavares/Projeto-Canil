package Controles;

import Objetos.Conectar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexandre
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})

public class ServletLogin extends HttpServlet {

    private Conectar conecta;
    private boolean resultadoPesquisa = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        request.setAttribute("usuario", usuario);
        request.setAttribute("senha", senha);

        /*if (resultadoPesquisa == false) {

            conecta = new Conectar();
            conecta.conectarBD();
        }

        resultadoPesquisa = conecta.validarLogin(usuario, senha);

        if (resultadoPesquisa == true) {
            
            resultadoPesquisa = false;
            response.sendRedirect("capa.jsp");
            conecta.desconectarBD();
        } else {
            response.sendRedirect("index.jsp");
        }*/
    }

}
