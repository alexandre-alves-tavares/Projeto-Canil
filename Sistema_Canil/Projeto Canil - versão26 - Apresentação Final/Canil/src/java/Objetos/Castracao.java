/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Poliana
 */
public class Castracao {
    
    private int codCastracao;
    private int codAnimal;
    private Date dataCastracao; 
    private int codVeterinario;
    private String observacao;
    
    public Castracao() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Castracao(int codAnimal, int codVeterinario, String observacao) {
       
        this.codAnimal = codAnimal;
        
        this.dataCastracao = new Date();
        
        this.codVeterinario = codVeterinario;
        this.observacao = observacao;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastrarCastracao() throws SQLException {

        System.out.println("antes do sql");
        
        String sql = "INSERT INTO Castracao (codAnimal, dataCastracao ,codVeterinario, observacao)"
                + " VALUES(?, ?, ?, ?)";

        
        System.out.println("antes de conectar");
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        System.out.println("Conectaaaaaa");
    
        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        
        System.out.println("conexao");
        try {
            System.out.println("bloco try");
            
            stmt.setInt(1, this.getCodAnimal());
            stmt.setDate(2, new java.sql.Date(this.getDataCastracao().getTime()));
            stmt.setInt(3, this.getCodVeterinario());
            stmt.setString(4, this.getObservacao());
            
            System.out.println("antes do execute");
            stmt.execute();
            System.out.println("antes de fechar a conexão");
            stmt.close();

            conecta.desconectarBD();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Erro");

            stmt.close();
            conecta.desconectarBD();
        }

        return true;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Castracao> listarCastracao() throws SQLException {
        
        ResultSet result;
        ArrayList<Castracao> lista_castracao = new ArrayList<Castracao>();
        Castracao castracao;

        String sql = "SELECT * FROM Castracao";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        System.out.println("antes de entrar no banco");
        result = conecta.comandoSQL(sql);
        System.out.println("depois de entrar no banco");
        
        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                castracao = new Castracao();
                castracao.setCodCastracao(result.getInt("codCastracao"));
                castracao.setCodAnimal(result.getInt("codAnimal"));                
                castracao.setDataCastracao(result.getDate("dataCastracao"));
                castracao.setCodVeterinario(result.getInt("codVeterinario"));
                castracao.setObservacao(result.getString("observacao"));

                lista_castracao.add(castracao);
            } while (result.next());
        }
        
        result.close();
        conecta.desconectarBD();

        return lista_castracao;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Castracao> consultarCastracao (int codAnimal) throws SQLException {

        ResultSet result;
        ArrayList<Castracao> lista_castracao = new ArrayList<Castracao>();
        Castracao castracao;

        String sql = "SELECT * FROM Castracao where codAnimal = " + codAnimal;

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                castracao = new Castracao();

                castracao.setCodCastracao(result.getInt("codCastracao"));
                castracao.setCodAnimal(result.getInt("codAnimal"));                
                castracao.setDataCastracao(result.getDate("dataCastracao"));
                castracao.setCodVeterinario(result.getInt("codVeterinario"));
                castracao.setObservacao(result.getString("observacao"));

                lista_castracao.add(castracao);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_castracao;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/    
    public ArrayList<Castracao> consultarCastracaoNomeAnimal (String nomeAnimal) throws SQLException {

        ResultSet result;
        ArrayList<Castracao> lista_castracao = new ArrayList<Castracao>();
        Castracao castracao;

        String sql = "SELECT * FROM Castracao WHERE codAnimal IN "
                + "(SELECT codAnimal FROM Animal WHERE nome LIKE '%' '"+ nomeAnimal +"' '%')";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                castracao = new Castracao();
                //ver que dados pegar aqui
                castracao.setCodCastracao(result.getInt("codCastracao"));
                castracao.setCodAnimal(result.getInt("codAnimal"));                
                castracao.setDataCastracao(result.getDate("dataCastracao"));
                castracao.setCodVeterinario(result.getInt("codVeterinario"));
                castracao.setObservacao(result.getString("observacao"));

                lista_castracao.add(castracao);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_castracao;
    }
    /*-------------------------------------------------------------------------------------------------------*/
    public int contarCastracao() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM castracao;";
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        ResultSet result = conecta.comandoSQL(sql);
        
         if (result.first()) {
             quantidade = result.getInt("qtd");
         }
        return quantidade;
    }
      /*-------------------------------------------------------------------------------------------------------*/
    public int contarPaginas(int qtdregistros, int qtd){
        int qtdpaginas = 0;
        if((qtdregistros/qtd) > 0){
           qtdpaginas = (qtdregistros / qtd) + 1;
           
        }else{
            qtdpaginas = qtdregistros/qtd;
           
        }
        System.out.println("contarPaginas: "+ qtdpaginas);
        return qtdpaginas;
    }
    
  /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Castracao> paginacaoCastracao(int qtdporpagina, int numeroPagina) throws SQLException{
        int totalCastracao = contarCastracao();
       int qtdpaginas = contarPaginas(totalCastracao, qtdporpagina);   
      
       numeroPagina = Math.max(Math.min(totalCastracao, numeroPagina),1);
       int inicio = (numeroPagina - 1) * (qtdpaginas-1);
        ResultSet result;
        ArrayList<Castracao> lista_castracao = new ArrayList<Castracao>();
        Castracao castracao;
     
        String sql = "SELECT * FROM castracao LIMIT "+inicio+","+qtdporpagina;
        System.out.println("Inicio: "+ inicio);
        System.out.println("Fim: "+ qtdporpagina);
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
           
            do {
                castracao = new Castracao();
                castracao.setCodCastracao(result.getInt("codCastracao"));
                castracao.setCodAnimal(result.getInt("codAnimal"));
                castracao.setDataCastracao(result.getDate("dataCastracao"));
                castracao.setCodVeterinario(result.getInt("codVeterinario"));
                castracao.setObservacao(result.getString("observacao"));
               lista_castracao.add(castracao);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_castracao;
        }
    
    
    /*-------------------------------------------------------------------------------------------------------*/


    public Castracao buscarCastracao(int cod) throws SQLException {
        ResultSet result;
        Castracao castracao = null;
        String sql = "SELECT * FROM castracao WHERE codCastracao=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {
            castracao = new Castracao();
            castracao.setCodCastracao(result.getInt("codCastracao"));
            castracao.setCodAnimal(result.getInt("codAnimal"));
            castracao.setDataCastracao(result.getDate("dataCastracao"));
            castracao.setCodVeterinario(result.getInt("codVeterinario"));
            castracao.setObservacao(result.getString("observacao"));
        }

        result.close();
        conecta.desconectarBD();

        return castracao;
    }
   
    
    /*-------------------------------------------------------------------------------------------------------*/
    public boolean alterarCastracao(int cod, int animal, int veterinario, String obs) throws SQLException {
         String sql = "UPDATE castracao SET codAnimal=?, codVeterinario=?, observacao=? WHERE codCastracao="+cod+";";
        
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        try{
            stmt.setInt(1, animal);
            stmt.setInt(2, veterinario);
            stmt.setString(3, obs);
           
            stmt.execute();
            stmt.close();

            conecta.desconectarBD();
            
        }catch (SQLException ex){
            System.out.println("Erro");

            stmt.close();
            conecta.desconectarBD();
        }

        return false;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public boolean deletarCastracao(int codCastracao) throws SQLException {

        String sql = "DELETE FROM Castracao WHERE codCastracao = ?";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {
            stmt.setInt(1, codCastracao);

            stmt.execute();
            stmt.close();

            conecta.desconectarBD();

        } catch (SQLException ex) {

            System.out.println("Erro");

            stmt.close();
            conecta.desconectarBD();
        }

        return false;
    }
      
    /*-------------------------------------------------------------------------------------------------------*/
    
    public int getCodCastracao() {
        return codCastracao;
    }

    public void setCodCastracao(int codigoCastracao) {
        this.codCastracao = codigoCastracao;
    }

    public int getCodAnimal() {
        return codAnimal;
    }

    public void setCodAnimal(int codAnimal) {
        this.codAnimal = codAnimal;
    }

    public Date getDataCastracao() {
        return dataCastracao;
    }

    public void setDataCastracao(Date dataCastracao) {
        this.dataCastracao = dataCastracao;
    }
    
    public int getCodVeterinario() {
        return codVeterinario;
    }

    public void setCodVeterinario(int codVeterinario) {
        this.codVeterinario = codCastracao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    
}
