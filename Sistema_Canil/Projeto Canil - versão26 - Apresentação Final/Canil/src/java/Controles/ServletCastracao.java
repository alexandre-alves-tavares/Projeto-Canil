package Controles;

import Objetos.Castracao;
import com.mysql.fabric.xmlrpc.base.Data;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Poliana
 */
@WebServlet(name = "ServletCastracao", urlPatterns = {"/ServletCastracao"})
public class ServletCastracao extends HttpServlet {

    private Castracao castracao;
    private boolean resultadoCadastro = false;
//    private String site="seu_login";
//    private String caminhoTemp="/home/"+site+"/tmp/";
//    private String pasta="/home/"+site+"/public_html/upload/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {

            int codAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codVeterinario = Integer.parseInt(request.getParameter("codVeterinario"));
            String observacao = request.getParameter("observacao");
            

            castracao = new Castracao(codAnimal, codVeterinario, observacao);
           
            try {
                resultadoCadastro = castracao.cadastrarCastracao();
                response.sendRedirect("/Canil/capa.jsp?IDPagina=telaSucesso&IDTela=cadCastracao");
            
            } catch (SQLException ex) {
                Logger.getLogger(ServletCastracao.class.getName()).log(Level.SEVERE, null, ex);
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=cadCastracao&&Resultado=1");
        
        
        } else if (acao.equals("Listar")) {

            castracao = new Castracao();

            try {
                ArrayList<Castracao> cast = new ArrayList<Castracao>();

                cast = castracao.listarCastracao();

                request.setAttribute("listar", cast);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarCastracoes");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }


        } else if (acao.equals("Pesquisar")) {

            String opcao = request.getParameter("tipo");
            
            if (opcao.equals("Código Animal")) {
            
                int codAnimal = Integer.parseInt(request.getParameter("pesquisa"));

                castracao = new Castracao();

                ArrayList<Castracao> cast = new ArrayList<Castracao>();
                try {
                    cast = castracao.consultarCastracao(codAnimal);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", cast);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarCastracoes");
                rd.forward(request, response);
            }
            
            else if (opcao.equals("Nome Animal")){
                
                String nomeAnimal = request.getParameter("pesquisa");

                castracao = new Castracao();

                ArrayList<Castracao> cast = new ArrayList<Castracao>();
                try {
                    cast = castracao.consultarCastracaoNomeAnimal(nomeAnimal);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", cast);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarCastracoes");
                rd.forward(request, response);    
            }
        } 
        else if (acao.equals("Alterar")) {

            castracao = new Castracao();
               
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int codAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codVeterinario = Integer.parseInt(request.getParameter("codVeterinario"));
            String observacao = request.getParameter("observacao");
           
            try {
                 castracao.alterarCastracao(codigo, codAnimal, codVeterinario, observacao);
               response.sendRedirect("/Canil/capa.jsp?IDPagina=cadCastracao");
            } catch (SQLException ex) {

            }
        }
        else if (acao.equals("Excluir")) {

            castracao = new Castracao();

            int codCastracao = Integer.parseInt(request.getParameter("codCastracao"));

            try {
                castracao.deletarCastracao(codCastracao);
                response.sendRedirect("/Canil/capa.jsp?IDPagina=cadCastracao");
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
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCastracao</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCastracao at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
