package Controles;

import Objetos.Tratamento;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//14/05/2015
/** 
 *
 * @author Poliana
 */
@WebServlet(name = "ServletTratamento", urlPatterns = {"/ServletTratamento"})
public class ServletTratamento extends HttpServlet {

    private Tratamento tratamento;
    private boolean resultadoCadastro = false;
    private String site="seu_login";
    private String caminhoTemp="/home/"+site+"/tmp/";
    private String pasta="/home/"+site+"/public_html/upload/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {

            int codAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codMedicamento = Integer.parseInt(request.getParameter("codMedicamento"));
            String lote = request.getParameter("lote");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int intervalo = Integer.parseInt(request.getParameter("intervalo"));
            int duracao = Integer.parseInt(request.getParameter("duracao"));
            String observacao = request.getParameter("observacao");
            int status = Integer.parseInt(request.getParameter("status"));

            

            //System.out.println("Pegou do form");
            tratamento = new Tratamento(codAnimal, codMedicamento, lote, quantidade, intervalo, duracao, observacao, status);
           
            try {
                resultadoCadastro = tratamento.cadastarTratamento();
                response.sendRedirect("/Canil/capa.jsp?IDPagina=telaSucesso&IDTela=cadTratamento");
            } catch (SQLException ex) {

            }
        } else if (acao.equals("Listar")) {

            tratamento = new Tratamento();

            try {
                ArrayList<Tratamento> trat = new ArrayList<Tratamento>();

                trat = tratamento.listarTratamento();

                request.setAttribute("listar", trat);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarTratamentos");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }

//esta dando problema aqui
        } else if (acao.equals("Pesquisar")) {

            String opcao = request.getParameter("tipo");
            
            if (opcao.equals("Código Animal")) {
            
                int codAnimal = Integer.parseInt(request.getParameter("pesquisa"));

                tratamento = new Tratamento();

                ArrayList<Tratamento> trat = new ArrayList<Tratamento>();
                try {
                    trat = tratamento.consultarTratamento(codAnimal);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", trat);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listaTratamento");
                rd.forward(request, response);
            }
            
            else if (opcao.equals("Nome Animal")){
                
                String nomeAnimal = request.getParameter("pesquisa");

                tratamento = new Tratamento();

                ArrayList<Tratamento> trat = new ArrayList<Tratamento>();
                try {
                    trat = tratamento.consultarTratamento(nomeAnimal);
                } catch (SQLException ex) {

                }

                request.setAttribute("listar", trat);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listaTratamento");
                rd.forward(request, response);    
            }
            
             } else if (acao.equals("Alterar")) {

            tratamento = new Tratamento();
               
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int animal = Integer.parseInt(request.getParameter("animal"));
            String lote = request.getParameter("lote");
            int medicamento = Integer.parseInt(request.getParameter("medicamento"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int intervalo = Integer.parseInt(request.getParameter("intervalo"));
            int duracao = Integer.parseInt(request.getParameter("duracao"));
            String observacao = request.getParameter("observacao");
            int status = Integer.parseInt(request.getParameter("status"));

           
            try {
                 tratamento.alterarTratamento(codigo, animal, medicamento, lote, quantidade, intervalo, duracao, observacao, status);
               response.sendRedirect("/Canil/capa.jsp?IDPagina=cadTratamento");
            } catch (SQLException ex) {

            }
            
            
        }else if (acao.equals("Excluir")) {

            tratamento = new Tratamento();

            int codigoTratamento = Integer.parseInt(request.getParameter("codigoTratamento"));

            try {
                tratamento.deletarTratamento(codigoTratamento);
                response.sendRedirect("/Canil/capa.jsp?IDPagina=cadTratamento");
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
            out.println("<title>Servlet ServletTratamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletTratamento at " + request.getContextPath() + "</h1>");
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
