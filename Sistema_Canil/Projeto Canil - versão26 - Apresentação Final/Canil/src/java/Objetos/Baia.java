package Objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alexandre
 */
public class Baia {

    private int codigo;
    private String nome;

    public Baia(String nome) {
        this.nome = nome;
    }

    public Baia() {
        
    }

    public boolean cadastrarBaia() throws SQLException {
        String sql = "INSERT INTO Baia (nomeBaia)" + " VALUES(?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {
            stmt.setString(1, this.getNome());

            stmt.execute();
            stmt.close();

            conecta.desconectarBD();

        } catch (SQLException ex) {
            System.out.println("Erro ao inserir baía java!");
            stmt.close();
            conecta.desconectarBD();
        }

        return false;

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Baia> ListarBaias() throws SQLException {

        ResultSet result;
        ArrayList<Baia> lista_baia = new ArrayList<Baia>();
        Baia baia;

        String sql = "SELECT * FROM Baia";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                baia = new Baia();
                baia.setCodigo(result.getInt("codBaia"));
                baia.setNome(result.getString("nomeBaia"));

                lista_baia.add(baia);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_baia;
    }
    
    
    
    /*-------------------------------------------------------------------------------------------------------*/
    public int contarBaia() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM baia;";
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
        float teste = 0;
        teste = (float)(qtdregistros % qtd);
        if(teste > 0){
           if(teste == 0){
               qtdpaginas = (qtdregistros / qtd);
           }else{
              qtdpaginas = (qtdregistros / qtd) + 1;
               
           }
            
           
        }else{
            qtdpaginas = qtdregistros/qtd;
           
        }
        return qtdpaginas;
    }
    
  /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Baia> paginacaoBaia(int qtdporpagina, int numeroPagina) throws SQLException{
        int totalMedicamentos = contarBaia();
       int qtdpaginas = contarPaginas(totalMedicamentos, qtdporpagina);   
      
       numeroPagina = Math.max(Math.min(totalMedicamentos, numeroPagina),1);
        int inicio = (numeroPagina * qtdporpagina) - qtdporpagina;
        ResultSet result;
        ArrayList<Baia> lista_baia = new ArrayList<Baia>();
        Baia baia;
     
        String sql = "SELECT * FROM baia LIMIT "+inicio+","+qtdporpagina;
        System.out.println("Inicio: "+ inicio);
        System.out.println("Fim: "+ qtdporpagina);
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
           
            do {
                baia = new Baia();
                baia.setCodigo(result.getInt("codBaia"));
                baia.setNome(result.getString("nomeBaia"));
               lista_baia.add(baia);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_baia;
        }
    
    
    /*-------------------------------------------------------------------------------------------------------*/


    public Baia buscarBaia(int cod) throws SQLException {
        ResultSet result;
        Baia baia = null;
        String sql = "SELECT * FROM baia WHERE codBaia=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {

            baia = new Baia();
            baia.setCodigo(result.getInt("codBaia"));
            baia.setNome(result.getString("nomeBaia"));
        }

        result.close();
        conecta.desconectarBD();

        return baia;
    }
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Baia> consultarBaia(String nome) throws SQLException {

        ResultSet result;
        ArrayList<Baia> lista_baia = new ArrayList<Baia>();
        Baia baia;

        String sql = "SELECT * FROM baia where nomeBaia like '%" + nome + "%'";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        if (result.first()) {
            do {
                baia = new Baia();
                baia.setCodigo(result.getInt("codBaia"));
                baia.setNome(result.getString("nomeBaia"));

                lista_baia.add(baia);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_baia;
    }
     /*-------------------------------------------------------------------------------------------------------*/
    public boolean deletarBaia(int codigo) throws SQLException {

        String sql = "DELETE FROM baia WHERE codBaia = ?";

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
   public boolean alterarBaia(int cod, String nome) throws SQLException {
       String sql = "UPDATE baia SET nomeBaia=? WHERE codBaia="+cod+";";
        
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        try{
            stmt.setString(1, nome);
           
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
    
    

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
