package Objetos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Henrique H.R
 */
public class Conectar {

    final private String driver = "com.mysql.jdbc.Driver";
    final private String url = "jdbc:mysql://localhost/bd_henrique";

    final private String usuario = "root";
    final private String senha = "";

    private Connection conexao;
    public PreparedStatement statement;
    public ResultSet resultset;
    private boolean resultado = false;

    public Conectar() {
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public void conectarBD() {

        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            System.out.println("Conectou");

        } catch (ClassNotFoundException Fonte) {
            System.out.println("Erro na conexao " + Fonte);
        } catch (SQLException Fonte) {
            System.out.println("Erro na conexao " + Fonte);
        }
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public void desconectarBD() {

        try {
            getConexao().close();
            System.out.println("Desconectou");

        } catch (SQLException erroSQL) {
            System.out.println("Nao Desconectou");
        }
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public ResultSet comandoSQL(String sql) {

        try {
            statement = getConexao().prepareStatement(sql);
            resultset = statement.executeQuery(sql);

            if (resultset.next()) {
                resultado = true;
                return resultset;
            }

        } catch (SQLException sqlex) {
            System.out.println("erro comnado sql");
        }

        return null;
    }

    public Connection getConexao() {
        return conexao;
    }

    /*public static void main(String[] args) {

     Conectar con = new Conectar();
     con.conecta();

     String teste = con.validarLogin("henrique", "1234");

     System.out.println(teste);

     }*/
    /**
     * @return the conexao
     */
}
