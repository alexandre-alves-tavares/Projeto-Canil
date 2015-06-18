/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import Objetos.Baia;
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
@WebServlet(name = "ServletBaia", urlPatterns = {"/ServletBaia"})
public class ServletBaia extends HttpServlet {

    private Baia baia;
    private boolean resultado = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {

            if (nome.equals("")) {

            } else {
                baia = new Baia(nome);
                try {
                    resultado = baia.cadastrarBaia();
                    response.sendRedirect("/Canil/capa.jsp?IDPagina=telaSucesso&IDTela=cadBaia");
                } catch (SQLException ex) {
                    //system.out.println("Erro ao cadastrar baia servlet!");

                }
            }
            
             } else if (acao.equals("Pesquisar")) {

            nome = request.getParameter("pesquisa");

            if (!nome.equals("")) {

                baia = new Baia();

                ArrayList<Baia> b = new ArrayList<Baia>();
                try {
                    b = baia.consultarBaia(nome);
                } catch (SQLException ex) {

                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=pesqBaia&Nome=" + nome);
                rd.forward(request, response);
            }

            } else if (acao.equals("Alterar")) {

            baia = new Baia();
               
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
           
            try {
                 baia.alterarBaia(codigo, nome);
               response.sendRedirect("/Canil/capa.jsp?IDPagina=cadBaia");
            } catch (SQLException ex) {

            }
            
        } else if (acao.equals("Listar")) {
            baia = new Baia();

            try {
                ArrayList<Baia> listabaia = new ArrayList<Baia>();

                listabaia = baia.ListarBaias();

                request.setAttribute("listar", listabaia);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarBaias");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }
        } else {

        }

    }

}
