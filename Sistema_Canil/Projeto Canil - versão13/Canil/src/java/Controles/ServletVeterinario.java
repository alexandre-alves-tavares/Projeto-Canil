package Controles;

import Objetos.Veterinario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexandre
 */
@WebServlet(name = "ServletVeterinario", urlPatterns = {"/ServletVeterinario"})

public class ServletVeterinario extends HttpServlet {

    private Veterinario veterinario;
    private boolean resultadoCadastro = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {

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

                int crmv = Integer.parseInt(request.getParameter("crmv"));
                veterinario = new Veterinario(nome, cpf, endereco, telefone, email, usuario, senha, crmv);

                try {
                    resultadoCadastro = veterinario.cadastrarVeterinario();
                } catch (SQLException ex) {

                }
            }
        } else if (acao.equals("Listar")) {

            veterinario = new Veterinario();

            try {
                ArrayList<Veterinario> vet = new ArrayList<Veterinario>();

                vet = veterinario.listarVeterinarios();

                request.setAttribute("listar", vet);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarVeterinarios");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }
        } else if (acao.equals("Pesquisar")) {

            String nome = request.getParameter("pesquisa");

            if (!nome.equals("")) {

                veterinario = new Veterinario();

                ArrayList<Veterinario> vet = new ArrayList<Veterinario>();
                try {
                    vet = veterinario.consultarVeterinario(nome);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", vet);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarVeterinarios");
                rd.forward(request, response);
            }
        } else if (acao.equals("Excluir")) {

            veterinario = new Veterinario();

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            try {
                veterinario.deletarVeterinario(codigo);
                response.sendRedirect("/Canil/capa.jsp?IDPagina=cadVeterinario");
            } catch (SQLException ex) {

            }

        }

        /*if (resultadoCadastro == true) {
         //System.out.println("Cadastro efetuado");
         response.sendRedirect("/Canil/capa.jsp?IDPagina=Cadastro");
         } else {
         response.sendRedirect("/Canil/capa.jsp?IDPagina=cadVeterinario");
         }*/
    }

}
