/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/** 11/05/2015
 *
 * @author Poliana
 */
public class Medicamento {
    
    private int codigo;
    private String nome;
    private String tipo;
    private int doses;
    private String descricao;

    public Medicamento() {
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Medicamento(String nome, String tipo, int doses , String descricao) {

        this.nome = nome;
        this.tipo = tipo;
        this.doses = doses;
        this.descricao = descricao;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastrarMedicamento() throws SQLException {

        String sql = "INSERT INTO Medicamento (nomeMedicamento, tipo, doses, descricao)"
                + " VALUES(?, ?, ?, ?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();
        //System.out.println("Conectaaaaaa");

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {

            stmt.setString(1, this.getNome());
            stmt.setString(2, this.getTipo());
            stmt.setInt(3, this.getDoses());
            stmt.setString(4, this.getDescricao());
            
            stmt.execute();
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
    public ArrayList<Medicamento> listarMedicamentos() throws SQLException {

        ResultSet result;
        ArrayList<Medicamento> lista_medicamento = new ArrayList<Medicamento>();
        Medicamento medicamento;

        String sql = "SELECT * FROM Medicamento";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                medicamento = new Medicamento();
                medicamento.setCodigo(result.getInt("codMedicamento"));
                medicamento.setNome(result.getString("nomeMedicamento"));

                lista_medicamento.add(medicamento);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_medicamento;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Medicamento> consultarMedicamento(String nome) throws SQLException {

        ResultSet result;
        ArrayList<Medicamento> lista_medicamento = new ArrayList<Medicamento>();
        Medicamento medicamento;

        String sql = "SELECT * FROM Medicamento where nomeMedicamento like '%" + nome + "%'";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                medicamento = new Medicamento();
                medicamento.setCodigo(result.getInt("codMedicamento"));
                medicamento.setNome(result.getString("nomeMedicamento"));

                lista_medicamento.add(medicamento);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_medicamento;
    }

    /*-------------------------------------------------------------------------------------------------------*/
   public boolean alterarMedicamento(int cod, String nome, String tipo, int doses ,String descricao) throws SQLException {
       String sql = "UPDATE medicamento SET nomeMedicamento=?, tipo=?, doses=?, descricao=? WHERE codMedicamento="+cod+";";
        
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        try{
            stmt.setString(1, nome);
            stmt.setString(2, tipo);
            stmt.setInt(3, doses);
            stmt.setString(4, descricao);
           
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
    public boolean deletarMedicamento(int codigo) throws SQLException {

        String sql = "DELETE FROM Medicamento WHERE codMedicamento = ?";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {
            stmt.setInt(1, codigo);

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
    public int contarMedicamentos() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM medicamento;";
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        ResultSet result = conecta.comandoSQL(sql);
        
         if (result.first()) {
             quantidade = result.getInt("qtd");
         }
         System.out.println("contarMedicamentos: "+ quantidade);
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
    public ArrayList<Medicamento> paginacaoMedicamento(int qtdporpagina, int numeroPagina) throws SQLException{
      //public ArrayList<Animal> paginacaoAnimais(int pagina, int totalAnimais) throws SQLException{
        System.out.println("Pagina: "+ numeroPagina);
        int totalMedicamentos = contarMedicamentos();
       int qtdpaginas = contarPaginas(totalMedicamentos, qtdporpagina); //4
      System.out.println("QtdPaginas: "+ qtdpaginas);
       //$pagina = max(min($this->qtdregistros, $pagina), 1);
      
       numeroPagina = Math.max(Math.min(totalMedicamentos, numeroPagina),1);
       int inicio = (numeroPagina - 1) * (qtdpaginas-1);
        System.out.println("numeroPagina: "+ numeroPagina);
        ResultSet result;
        ArrayList<Medicamento> lista_medicamentos = new ArrayList<Medicamento>();
        Medicamento med;
      
        // String sql = "SELECT * FROM Animal LIMIT "+qtdporpagina+","+totalAnimais;
        String sql = "SELECT * FROM medicamento LIMIT "+inicio+","+qtdporpagina;
        System.out.println("Inicio: "+ inicio);
        System.out.println("Fim: "+ qtdporpagina);
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
           
            do {
                med = new Medicamento();
                med.setCodigo(result.getInt("codMedicamento"));
                med.setNome(result.getString("nomeMedicamento"));
                med.setTipo(result.getString("tipo"));
                med.setDoses(result.getInt("doses"));
                med.setDescricao(result.getString("descricao"));
                System.out.println("Nome: " + med.getNome());
               lista_medicamentos.add(med);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_medicamentos;
    }
    /*-------------------------------------------------------------------------------------------------------*/


    public Medicamento buscarMedicamento(int cod) throws SQLException {
        ResultSet result;
        Medicamento medicamento = null;
        String sql = "SELECT * FROM medicamento WHERE codMedicamento=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {

            medicamento = new Medicamento();
            medicamento.setCodigo(result.getInt("codMedicamento"));
            medicamento.setNome(result.getString("nomeMedicamento"));
            medicamento.setTipo(result.getString("tipo"));
            medicamento.setDoses(result.getInt("doses"));
            medicamento.setDescricao(result.getString("descricao"));
        }

        result.close();
        conecta.desconectarBD();

        return medicamento;
    }

     /*-------------------------------------------------------------------------------------------------------*/   
    
    public int getCodigo(){
        return codigo;
    }
    
    public void setCodigo(int codigo){
        this.codigo = codigo;
    }
        
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getDoses() {
        return doses;
    }
    
    public void setDoses(int doses){
        this.doses = doses;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

}
