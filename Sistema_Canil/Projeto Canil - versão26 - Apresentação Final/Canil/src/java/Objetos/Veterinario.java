package Objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class Veterinario extends Pessoa implements Login {

    private int cod;
    private String usuario;
    private String senha;
    private String crmv;
    private Date dataContratacao;

    public Veterinario() {
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Veterinario(String nome, String cpf, String endereco, String telefone, String email,
            String usuario, String senha, String crmv) {

        super(nome, cpf, endereco, telefone, email);

        this.usuario = usuario;
        this.senha = senha;
        this.crmv = crmv;
        this.dataContratacao = new Date();
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastrarVeterinario() throws SQLException {

        String sql = "INSERT INTO Veterinario (nome, crm, cpf, endereco, telefone, email, dataContratacao, usuario, senha)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();
        //System.out.println("Conectaaaaaa");

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {

            stmt.setString(1, this.getNome());
            stmt.setString(2, this.getCrmv());
            stmt.setString(3, this.getCpf());
            stmt.setString(4, this.getEndereco());
            stmt.setString(5, this.getTelefone());
            stmt.setString(6, this.getEmail());

            stmt.setDate(7, new java.sql.Date(this.getDataContratacao().getTime()));

            stmt.setString(8, this.getUsuario());
            stmt.setString(9, this.getSenha());

            stmt.execute();
            stmt.close();

            conecta.desconectarBD();

        } catch (SQLException ex) {

            System.out.println("Erro");

            stmt.close();
            conecta.desconectarBD();
        }

        return true;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Veterinario> listarVeterinarios() throws SQLException {

        ResultSet result;
        ArrayList<Veterinario> lista_veterinario = new ArrayList<Veterinario>();
        Veterinario veterinario;

        String sql = "SELECT * FROM Veterinario";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                veterinario = new Veterinario();
                veterinario.setCodigo(result.getInt("codVeterinario"));
                veterinario.setNome(result.getString("nome"));

                lista_veterinario.add(veterinario);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_veterinario;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Veterinario> consultarVeterinario(String nome) throws SQLException {

        ResultSet result;
        ArrayList<Veterinario> lista_veterinario = new ArrayList<Veterinario>();
        Veterinario vet;

        String sql = "SELECT * FROM veterinario WHERE nome LIKE '%' '"+ nome +"' '%'";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        if (result.first()) {
            do {
                vet = new Veterinario();

               vet.setCod(result.getInt("codVeterinario"));
                vet.setNome(result.getString("nome"));                
                vet.setCrmv(result.getString("crm"));
                vet.setEndereco(result.getString("endereco"));
                vet.setTelefone(result.getString("telefone"));
                vet.setEmail(result.getString("email"));
                
                lista_veterinario.add(vet);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_veterinario;
    }
    

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean alterarVeterinario() {
        return false;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean deletarVeterinario(int codigo) throws SQLException {

        String sql = "DELETE FROM Veterinario WHERE codVeterinario = ?";

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
    @Override
    public boolean realizarLogin(String usuario, String senha) {

        String sql = "";
        Statement statement;
        ResultSet resultset;

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        sql = "SELECT usuario, senha FROM Veterinario ";
        sql += "WHERE usuario = " + "'" + usuario + "'";
        sql += "AND senha = " + "'" + senha + "'";

        try {
            statement = conecta.getConexao().createStatement();
            resultset = statement.executeQuery(sql);

            if (resultset.next()) {

                conecta.desconectarBD();
                return true;
            }

        } catch (SQLException ex) {
        }

        conecta.desconectarBD();
        return false;
    }
   /*-------------------------------------------------------------------------------------------------------*/
    public int contarVeterinario() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM veterinario;";
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
    public ArrayList<Veterinario> paginacaoVeterinario(int qtdporpagina, int numeroPagina) throws SQLException{
       int totalVeterinarios = contarVeterinario();
       int qtdpaginas = contarPaginas(totalVeterinarios, qtdporpagina); //4

       numeroPagina = Math.max(Math.min(totalVeterinarios, numeroPagina),1);
       int inicio = (numeroPagina - 1) * (qtdpaginas-1);

        ResultSet result;
        ArrayList<Veterinario> lista_veterinario = new ArrayList<Veterinario>();
        Veterinario vet;
      
        String sql = "SELECT * FROM veterinario LIMIT "+inicio+","+qtdporpagina;

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
           
            do {
                vet = new Veterinario();
                vet.setCodigo(result.getInt("codVeterinario"));
                vet.setNome(result.getString("nome"));
                vet.setCrmv(result.getString("crm"));
                vet.setTelefone(result.getString("telefone"));
                vet.setEmail(result.getString("email"));
               lista_veterinario.add(vet);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_veterinario;
    }

/*-------------------------------------------------------------------------------------------------------*/

    public Veterinario buscarVeterinario(int cod) throws SQLException {
        ResultSet result;
        Veterinario vet = null;
        String sql = "SELECT * FROM veterinario WHERE codVeterinario=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {

               
                vet = new Veterinario();
                vet.setCod(result.getInt("codVeterinario"));
                vet.setNome(result.getString("nome"));
                vet.setCrmv(result.getString("crm"));
                vet.setTelefone(result.getString("telefone"));
                vet.setEmail(result.getString("email"));
                vet.setEndereco(result.getString("endereco"));
        }

        result.close();
        conecta.desconectarBD();

        return vet;
    }


    /*-------------------------------------------------------------------------------------------------------*/
    @Override
    public boolean realizarLogout() {
        return false;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    /**
     * @return the crmv
     */
    public String getCrmv() {
        return crmv;
    }

    /**
     * @param crmv the crmv to set
     */
    public void setCrmv(String crmv) {
        this.crmv = crmv;
    }

    /**
     * @return the dataContratacao
     */
    public Date getDataContratacao() {
        return dataContratacao;
    }

    /**
     * @param dataContratacao the dataContratacao to set
     */
    public void setDataContratacao(Date dataContratacao) {
        this.dataContratacao = dataContratacao;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

}
