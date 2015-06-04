package Controles;

import Objetos.Agente;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexandre
 */
@WebServlet(name = "ServletAgente", urlPatterns = {"/ServletAgente"})

public class ServletAgente extends HttpServlet {

    private Agente agente;
    private boolean resultadoCadastro = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String endereco = request.getParameter("endereco");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        //System.out.println("Pegou do form");
        if (nome.equals("") || email.equals("") || usuario.equals("") || senha.equals("")) {

        } else {

            agente = new Agente(nome, cpf, endereco, telefone, email, usuario, senha);

            try {
                resultadoCadastro = agente.cadastrarAgente();
            } catch (SQLException ex) {
                
            }
        }

        if (resultadoCadastro == true) {
            //System.out.println("Cadastro efetuado");
            response.sendRedirect("/Canil/capa.jsp?IDPagina=Cadastro");
        } else {
            response.sendRedirect("/Canil/capa.jsp?IDPagina=cadAgente");
        }

    }

}