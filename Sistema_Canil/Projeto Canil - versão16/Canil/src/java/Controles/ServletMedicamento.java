/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import Objetos.Medicamento;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 11/05/2015
 *
 * @author Poliana
 */
@WebServlet(name = "ServletMedicamento", urlPatterns = {"/ServletMedicamento"})

public class ServletMedicamento extends HttpServlet {

    private Medicamento medicamento;
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
            String tipo = request.getParameter("tipo");
            int doses = Integer.parseInt(request.getParameter("doses"));
            String descricao = request.getParameter("descricao");
            //System.out.println("Pegou do form");
            medicamento = new Medicamento(nome, tipo, doses, descricao);
            
            try {
                resultadoCadastro = medicamento.cadastrarMedicamento();
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=cadMedicamento");
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=cadMedicamento");
            } catch (SQLException ex) {

            }
        } else if (acao.equals("Listar")) {

            medicamento = new Medicamento();

            try {
                ArrayList<Medicamento> medi = new ArrayList<Medicamento>();

                medi = medicamento.listarMedicamentos();

                request.setAttribute("listar", medi);
                //response.sendRedirect("/Canil/capa.jsp?IDPagina=teste");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarMedicamentos");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }
        } else if (acao.equals("Pesquisar")) {

            String nome = request.getParameter("pesquisa");

            if (!nome.equals("")) {

                medicamento = new Medicamento();

                ArrayList<Medicamento> medi = new ArrayList<Medicamento>();
                try {
                    medi = medicamento.consultarMedicamento(nome);
                } catch (SQLException ex) {

                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=pesqMedicamento&Nome=" + nome);
                rd.forward(request, response);
            }
            
            } else if (acao.equals("Alterar")) {

            medicamento = new Medicamento();
               
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String tipo = request.getParameter("tipo");
            int doses = Integer.parseInt(request.getParameter("doses"));
            String descricao = request.getParameter("descricao");
           
            try {
                //animal.alterarAnimal(codigo, nome, bairro, sexo, tipo, peso, idade, cor, pelagem, raca, agressor, racao, obs, baia, foto);
                 medicamento.alterarMedicamento(codigo, nome, tipo, doses, descricao);
               response.sendRedirect("/Canil/capa.jsp?IDPagina=cadMedicamento");
            } catch (SQLException ex) {

            }
        
        } else if (acao.equals("Excluir")) {

            medicamento = new Medicamento();

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            try {
                medicamento.deletarMedicamento(codigo);
                response.sendRedirect("/Canil/capa.jsp?IDPagina=cadMedicamento");
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

//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response){
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
