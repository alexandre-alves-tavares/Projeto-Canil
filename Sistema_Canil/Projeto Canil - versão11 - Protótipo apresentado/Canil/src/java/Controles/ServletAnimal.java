package Controles;

import Objetos.Animal;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.apache.tomcat.util.http.fileupload.RequestContext;

/**
 *
 * @author Alexandre
 */
@WebServlet(name = "ServletAnimal", urlPatterns = {"/ServletAnimal"})

public class ServletAnimal extends HttpServlet {

    private Animal animal;
    private boolean resultadoCadastro = false;
    private String site="seu_login";
    private String caminhoTemp="/home/"+site+"/tmp/";
    private String pasta="/home/"+site+"/public_html/upload/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {

            String nome = request.getParameter("nome");
            String bairroRecolhimento = request.getParameter("bairro");
            String sexo = request.getParameter("sexo");
            String tipo = request.getParameter("tipo");
            float peso = Float.parseFloat(request.getParameter("peso"));
            int idade = Integer.parseInt(request.getParameter("idade"));
            String cor = request.getParameter("cor");
            String pelagem = request.getParameter("pelagem");
            String raca = request.getParameter("raca");
            String agressor = request.getParameter("agressivo");
            String racao = request.getParameter("racao");
            String observacao = request.getParameter("observacao");
            
            //02/05/2015
            int baia = Integer.parseInt(request.getParameter("baia"));
            

            //System.out.println("Pegou do form");
            animal = new Animal(nome, bairroRecolhimento, sexo, tipo, peso, idade, cor, pelagem, raca, agressor, racao, observacao, baia);
           
            try {
                resultadoCadastro = animal.cadastarAnimal();
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=cadAniaml&&Resultado=1");
            } catch (SQLException ex) {

            }
        } else if (acao.equals("Listar")) {

            animal = new Animal();

            try {
                ArrayList<Animal> ani = new ArrayList<Animal>();

                ani = animal.listarAnimais();

                request.setAttribute("listar", ani);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarAnimais");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }
        } else if (acao.equals("Pesquisar")) {

            String nome = request.getParameter("pesquisa");

            if (!nome.equals("")) {

                animal = new Animal();

                ArrayList<Animal> ani = new ArrayList<Animal>();
                try {
                    ani = animal.consultarAnimal(nome);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", ani);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarAnimais");
                rd.forward(request, response);
            }
        } else if (acao.equals("Excluir")) {

            animal = new Animal();

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            try {
                animal.deletarAnimal(codigo);
                response.sendRedirect("/Canil/capa.jsp?IDPagina=cadAnimal");
            } catch (SQLException ex) {

            }
        }

        /*if (resultadoCadastro == true) {
         //System.out.println("Cadastro efetuado");
         response.sendRedirect("/Canil/capa.jsp?IDPagina=Cadastro");
         } else {
         response.sendRedirect("/Canil/capa.jsp?IDPagina=cadAnimal");
         }*/
    }

}
