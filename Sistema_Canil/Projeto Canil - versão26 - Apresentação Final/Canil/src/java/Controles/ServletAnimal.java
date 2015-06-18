package Controles;

import Objetos.Animal;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Alteração Alexandre
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

//Alexandre
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;

import org.apache.log4j.Logger;


/**
 *
 * @author Alexandre
 */
@WebServlet(name = "ServletAnimal", urlPatterns = {"/ServletAnimal"})
//@WebServlet(urlPatterns = "/fileUpload")
//@WebServlet(urlPatterns = "/ServletAnimal")
@MultipartConfig


public class ServletAnimal extends HttpServlet {
    private static Logger logger = Logger.getLogger(ServletAnimal.class);
    private Animal animal;
    private boolean resultadoCadastro = false;
    private String site = "seu_login";
    private String caminhoTemp = "/home/" + site + "/tmp/";
    private String pasta = "/home/" + site + "/public_html/upload/";
    public String nomeFoto;
    
    
      protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
          
    for (Part part : request.getParts()) {
      logger.info(part.getName());
      InputStream is = request.getPart(part.getName()).getInputStream();
      int i = is.available();
      byte[] b  = new byte[i];
      is.read(b);
      logger.info("Length : " + b.length);
      String fileName = (String) getFileName(part);
     if(fileName == null){
          
          
      }else{
             nomeFoto = fileName;
          
      }
  
      logger.info("File name : " + fileName);
     // FileOutputStream os = new FileOutputStream("c:/fotos/" + fileName);
      FileOutputStream os = new FileOutputStream("C:/Users/Alexandre/Desktop/Canil/web/fotos/" + fileName);

      os.write(b);
      is.close();
    }
    
     

  }

      private String getFileName(Part part) {
    String partHeader = part.getHeader("content-disposition");
    logger.info("Part Header = " + partHeader);
    for (String cd : part.getHeader("content-disposition").split(";")) {
      if (cd.trim().startsWith("filename")) {
        return cd.substring(cd.indexOf('=') + 1).trim()
            .replace("\"", "");
      }
    }
    return null;

  }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            

        String acao = request.getParameter("acao");

        if (acao.equals("Cadastrar")) {
             doGet(request, response);
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            String nome = request.getParameter("nome");
            String bairroRecolhimento = request.getParameter("bairro");
            String sexo = request.getParameter("sexo");
            String tipo = request.getParameter("tipo");
            float peso = Float.parseFloat(request.getParameter("peso"));
            String idade = request.getParameter("idade");
            String cor = request.getParameter("cor");
            String pelagem = request.getParameter("pelagem");
            String raca = request.getParameter("raca");
            String agressor = request.getParameter("agressivo");
            String racao = request.getParameter("racao");
            String observacao = request.getParameter("observacao");
            int baia = Integer.parseInt(request.getParameter("baia"));
            //String urlFoto = request.getParameter("foto");
            //System.out.println("URLFOTO:" + urlFoto);
            //urlFoto = nomeFoto;
           // System.out.println("Nome da foto4:" + nomeFoto);
             String  urlFoto = nomeFoto;
            // System.out.println("Nome da foto2:" + nomeFoto);
            
            //System.out.println("Pegou do form");
            animal = new Animal(nome, bairroRecolhimento, sexo, tipo, peso, idade, cor, pelagem, raca, agressor, racao, observacao, baia, urlFoto, date);

            try {
                resultadoCadastro = animal.cadastarAnimal();
                response.sendRedirect("/Canil/capa.jsp?IDPagina=telaSucesso&IDTela=cadAnimal");
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
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/capa.jsp?IDPagina=pesqAnimal&Nome=" + nome);
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

        } else if (acao.equals("Alterar")) {

            animal = new Animal();

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String bairro = request.getParameter("bairro");
            String sexo = request.getParameter("sexo");
            String tipo = request.getParameter("tipo");
            float peso = Float.parseFloat(request.getParameter("peso"));
            int idade = Integer.parseInt(request.getParameter("idade"));
            String cor = request.getParameter("cor");
            String pelagem = request.getParameter("pelagem");
            String raca = request.getParameter("raca");
            String agressor = request.getParameter("agressivo");
            String racao = request.getParameter("racao");
            String obs = request.getParameter("observacao");
            int baia = Integer.parseInt(request.getParameter("baia"));
            String foto = request.getParameter("foto");
            foto = nomeFoto;
            try {
                //animal.alterarAnimal(codigo, nome, bairro, sexo, tipo, peso, idade, cor, pelagem, raca, agressor, racao, obs, baia, foto);
                animal.alterarAnimal(codigo, nome, bairro, sexo, tipo, peso, idade, cor, pelagem, raca, agressor, racao, obs, baia, foto);
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
