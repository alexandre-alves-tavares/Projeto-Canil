/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import Objetos.Adotante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "ServletAdotante", urlPatterns = {"/ServletAdotante"})
public class ServletAdotante extends HttpServlet {
 private Adotante adotante;
 private boolean resultado;
 private String nome;
   
  
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
            int animal = Integer.parseInt(request.getParameter("animal"));
            
            
            adotante = new Adotante(nome, cpf, endereco, telefone, email, animal);
            
            resultado = adotante.cadastrarAdotante();
            response.sendRedirect("/Canil/capa.jsp?IDPagina=telaSucesso&IDTela=cadAdotante");
            
            
             } else if (acao.equals("Pesquisar")) {

            nome = request.getParameter("pesquisa");

            if (!nome.equals("")) {

                adotante = new Adotante();

                ArrayList<Adotante> adot = new ArrayList<Adotante>();
                try {
                    adot = adotante.consultarAdotante(nome);
                } catch (SQLException ex) {

                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=pesqAdotante&Nome=" + nome);
                rd.forward(request, response);
            }

            } else if (acao.equals("Alterar")) {

            adotante = new Adotante();
               
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
           
           /* try {
                 adotante.alterarAdotante(codigo, nome);
              // response.sendRedirect("/Canil/capa.jsp?IDPagina=cadAdotante");
            } catch (SQLException ex) {

            }*/
            
        } else if (acao.equals("Listar")) {
            adotante = new Adotante();

           /* try {
                ArrayList<Adotante> listaadotante = new ArrayList<Adotante>();

              //  listaadotante = adotante.ListarAdotante();

                request.setAttribute("listar", listaadotante);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=listarAdotante");
                rd.forward(request, response);

            } catch (SQLException ex) {

            }*/
        } else {

        }

    }

    

   

}
