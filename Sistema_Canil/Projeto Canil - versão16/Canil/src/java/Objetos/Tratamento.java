package Objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//14/05/2015
public class Tratamento {

    private int codigoTratamento;
    private int codMedicamento;
    private int codAnimal;
    private String lote; 
    private int quantidade;
    private int intervalo;
    private int duracao;
    private String observacao;
    
    public Tratamento() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Tratamento(int codAnimal, int codMedicamento, String lote, int quantidade, int intervalo,
            int duracao, String observacao) {
       
        this.codAnimal = codAnimal;
        this.codMedicamento = codMedicamento;
        this.lote = lote;
        this.quantidade = quantidade;
        this.intervalo = intervalo;
        this.duracao = duracao;
        this.observacao = observacao;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastarTratamento() throws SQLException {

        String sql = "INSERT INTO Tratamento (codAnimal, codMedicamento, loteMedicamento, quantidade, intervalo, duracao, observacao)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();
        System.out.println("Conectou");
        //System.out.println("Conectaaaaaa");

        //buscar lista de nome de animal e nome de medicamento e quando selecionar pegar o codigo e mandar para o construtor
        
        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        
        System.out.println("conexao");
        try {
            System.out.println("bloco try");
            
            stmt.setInt(1, this.getCodAnimal());
            stmt.setInt(2, this.getCodMedicamento());
            stmt.setString(3, this.getLote());
            stmt.setInt(4, this.getQuantidade());
            stmt.setInt(5, this.getIntervalo());
            stmt.setInt(6, this.getDuracao());
            stmt.setString(7, this.getObservacao());
            
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
    public ArrayList<Tratamento> listarTratamento() throws SQLException {
        
        ResultSet result;
        ArrayList<Tratamento> lista_tratamento = new ArrayList<Tratamento>();
        Tratamento tratamento;

        String sql = "SELECT * FROM Tratamento";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);
        
        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                tratamento = new Tratamento();
                tratamento.setCodTratamento(result.getInt("codTratamento"));
                tratamento.setCodAnimal(result.getInt("codAnimal"));                
                tratamento.setCodMedicamento(result.getInt("codMedicamento"));
                tratamento.setLote(result.getString("loteMedicamento"));
                tratamento.setQuantidade(result.getInt("quantidade"));
                tratamento.setIntervalo(result.getInt("intervalo"));
                tratamento.setDuracao(result.getInt("duracao"));
                tratamento.setObservacao(result.getString("observacao"));

                lista_tratamento.add(tratamento);
            } while (result.next());
        }
        
        result.close();
        conecta.desconectarBD();

        return lista_tratamento;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Tratamento> consultarTratamento (int codAnimal) throws SQLException {

        ResultSet result;
        ArrayList<Tratamento> lista_tratamento = new ArrayList<Tratamento>();
        Tratamento tratamento;

        String sql = "SELECT * FROM Tratamento where codAnimal = " + codAnimal;

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                tratamento = new Tratamento();

                tratamento.setCodTratamento(result.getInt("codTratamento"));
                tratamento.setCodAnimal(result.getInt("codAnimal"));                
                tratamento.setCodMedicamento(result.getInt("codMedicamento"));
                tratamento.setLote(result.getString("loteMedicamento"));
                tratamento.setQuantidade(result.getInt("quantidade"));
                tratamento.setIntervalo(result.getInt("intervalo"));
                tratamento.setDuracao(result.getInt("duracao"));
                tratamento.setObservacao(result.getString("observacao"));

                lista_tratamento.add(tratamento);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_tratamento;
    }
    
    // 18/05/2015
    /*-------------------------------------------------------------------------------------------------------*/    
    public ArrayList<Tratamento> consultarTratamento (String nomeAnimal) throws SQLException {

        ResultSet result;
        ArrayList<Tratamento> lista_tratamento = new ArrayList<Tratamento>();
        Tratamento tratamento;

        String sql = "SELECT * FROM Tratamento WHERE codAnimal IN "
                + "(SELECT codAnimal FROM Animal WHERE nome LIKE '%' '"+ nomeAnimal +"' '%')";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                tratamento = new Tratamento();
                //ver que dados pegar aqui
                tratamento.setCodTratamento(result.getInt("codTratamento"));
                tratamento.setCodAnimal(result.getInt("codAnimal"));
                tratamento.setCodMedicamento(result.getInt("codMedicamento"));
                tratamento.setLote(result.getString("loteMedicamento"));
                tratamento.setQuantidade(result.getInt("quantidade"));
                tratamento.setIntervalo(result.getInt("intervalo"));
                tratamento.setDuracao(result.getInt("duracao"));
                tratamento.setObservacao(result.getString("observacao"));

                lista_tratamento.add(tratamento);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_tratamento;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
   public boolean alterarTratamento(int cod, int animal, int medicamento, String lote ,int quantidade, int intervalo, int duracao, String observacao) throws SQLException {
       String sql = "UPDATE tratamento SET codAnimal=?, codMedicamento=?, loteMedicamento=?, quantidade=?, intervalo=?, duracao=?, observacao=? WHERE codTratamento="+cod+";";
        
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        try{
            stmt.setInt(1, animal);
            stmt.setInt(2, medicamento);
            stmt.setString(3, lote);
            stmt.setInt(4, quantidade);
            stmt.setInt(5, intervalo);
            stmt.setInt(6, duracao);
            stmt.setString(7, observacao);
           
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
    public boolean deletarTratamento(int codTratamento) throws SQLException {

        String sql = "DELETE FROM Tratamento WHERE codTratamento = ?";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {
            stmt.setInt(1, codTratamento);

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
    public int contarTratamento() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM Tratamento;";
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
        return qtdpaginas;
    }
    
  /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Tratamento> paginacaoTratamento(int qtdporpagina, int numeroPagina) throws SQLException{
      //public ArrayList<Animal> paginacaoAnimais(int pagina, int totalAnimais) throws SQLException{
        int totalTratamento = contarTratamento();
       int qtdpaginas = contarPaginas(totalTratamento, qtdporpagina); //
       
       //$pagina = max(min($this->qtdregistros, $pagina), 1);
      
       numeroPagina = Math.max(Math.min(totalTratamento, numeroPagina),1);
       int inicio = (numeroPagina - 1) * (qtdpaginas-1);
        
        ResultSet result;
        ArrayList<Tratamento> lista_tratamento = new ArrayList<Tratamento>();
        Tratamento trat;
        System.out.println("Inicio: "+inicio);
        System.out.println("Fim: "+qtdporpagina);
        System.out.println("numeroPagina: "+numeroPagina);
        // String sql = "SELECT * FROM Animal LIMIT "+qtdporpagina+","+totalAnimais;
        String sql = "SELECT * FROM Tratamento LIMIT "+inicio+","+qtdporpagina;
        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
            do {
                trat = new Tratamento();
                trat.setCodTratamento(result.getInt("codTratamento"));
                trat.setCodAnimal(result.getInt("codAnimal"));
                trat.setCodMedicamento(result.getInt("codMedicamento"));
                trat.setLote(result.getString("loteMedicamento"));
                trat.setQuantidade(result.getInt("quantidade"));
                trat.setIntervalo(result.getInt("intervalo"));
                trat.setDuracao(result.getInt("duracao"));
                trat.setObservacao(result.getString("observacao"));

               lista_tratamento.add(trat);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_tratamento;
    }
      
    /*-------------------------------------------------------------------------------------------------------*/

    public Tratamento buscarTratamento(int cod) throws SQLException {
        ResultSet result;
        Tratamento trat = null;
        String sql = "SELECT * FROM tratamento WHERE codTratamento=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {

                trat = new Tratamento();
                trat.setCodTratamento(result.getInt("codTratamento"));
                trat.setCodAnimal(result.getInt("codAnimal"));
                trat.setCodMedicamento(result.getInt("codMedicamento"));
                trat.setLote(result.getString("loteMedicamento"));
                trat.setQuantidade(result.getInt("quantidade"));
                trat.setIntervalo(result.getInt("intervalo"));
                trat.setDuracao(result.getInt("duracao"));
                trat.setObservacao(result.getString("observacao"));
        }

        result.close();
        conecta.desconectarBD();

        return trat;
    }

    
    
    public int getCodTratamento() {
        return codigoTratamento;
    }

    public void setCodTratamento(int codigoTratamento) {
        this.codigoTratamento = codigoTratamento;
    }

    public int getCodAnimal() {
        return codAnimal;
    }

    public void setCodAnimal(int codAnimal) {
        this.codAnimal = codAnimal;
    }

    public int getCodMedicamento() {
        return codMedicamento;
    }

    public void setCodMedicamento(int codMedicamento) {
        this.codMedicamento = codMedicamento;
    }
    
    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getIntervalo() {
        return intervalo;
    }

    public void setIntervalo(int intervalo) {
        this.intervalo = intervalo;
    }

    
    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

}
