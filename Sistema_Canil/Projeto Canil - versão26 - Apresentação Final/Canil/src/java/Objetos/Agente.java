package Objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Agente extends Pessoa implements Login {

    private String usuario;
    private String senha;
    private Date dataContratacao;

    public Agente() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Agente(String nome, String cpf, String endereco, String telefone, String email,
            String usuario, String senha) {

        super(nome, cpf, endereco, telefone, email);

        this.usuario = usuario;
        this.senha = senha;
        this.dataContratacao = new Date();
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastrarAgente() throws SQLException {

        String sql = "INSERT INTO Agente (nome, cpf, endereco, telefone, email, dataContratacao, usuario, senha)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();
        //System.out.println("Conectaaaaaa");

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        //System.out.println("Preparou o stmt");
        //System.out.println(this.getNome() + this.getUsuario() + this.getSenha());
        try {

            stmt.setString(1, this.getNome());
            stmt.setString(2, this.getCpf());
            stmt.setString(3, this.getEndereco());
            stmt.setString(4, this.getTelefone());
            stmt.setString(5, this.getEmail());

            stmt.setDate(6, new java.sql.Date(this.getDataContratacao().getTime()));

            stmt.setString(7, this.getUsuario());
            stmt.setString(8, this.getSenha());

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
    public boolean buscarAgente() {
        return false;
    }

    public boolean alterarAgente() {
        return false;
    }

    public boolean deletarAgente() {
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

        sql = "SELECT usuario, senha FROM Agente ";
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
    @Override
    public boolean realizarLogout() {
        return false;
    }

    /*-------------------------------------------------------------------------------------------------------*/
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
}
