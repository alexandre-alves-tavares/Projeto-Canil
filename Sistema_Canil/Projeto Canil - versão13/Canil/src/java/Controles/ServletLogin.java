package Controles;

import Objetos.Agente;
import Objetos.Veterinario;
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

    //private Conectar conecta;
    private boolean resultadoPesquisa = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo");

        //request.setAttribute("usuario", usuario);
        //request.setAttribute("senha", senha);
        //Veterinario vet = new Veterinario();
        if (tipo.equals("Agente")) {
            Agente age = new Agente();
            resultadoPesquisa = age.realizarLogin(usuario, senha);
        } else {
            Veterinario vet = new Veterinario();
            resultadoPesquisa = vet.realizarLogin(usuario, senha);
        }

        if (resultadoPesquisa == true) {

            resultadoPesquisa = false;
            response.sendRedirect("capa.jsp");

        } else {
            response.sendRedirect("index.jsp");
        }
    }

}
