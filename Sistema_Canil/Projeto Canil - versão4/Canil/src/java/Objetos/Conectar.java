package Objetos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Henrique H.R
 */
public class Conectar {

    final private String driver = "com.mysql.jdbc.Driver";
    final private String url = "jdbc:mysql://localhost/login";

    final private String usuario = "root";
    final private String senha = "";

    private Connection conexao;
    public Statement statement;
    public ResultSet resultset;
    private boolean resultado = false;

    public Conectar() {
    }

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

    public void desconectarBD() {

        try {
            conexao.close();
            System.out.println("Desconectou");

        } catch (SQLException erroSQL) {
            System.out.println("Nao Desconectou");
        }
    }

    public boolean validarLogin(String nome, String senha) {

        String sql = "";

        sql = "select nome from usuario ";
        sql += "where nome = " + "'" + nome + "'";
        sql += "and senha = " + "'" + senha + "'";

        resultado = comandoSQL(sql);

        return resultado;
    }

    public boolean comandoSQL(String sql) {

        try {
            statement = conexao.createStatement();
            resultset = statement.executeQuery(sql);

            if (resultset.next()) {
                resultado = true;
                return resultado;
            }

        } catch (SQLException sqlex) {
            System.out.println("erro comnado sql");
        }

        return resultado;
    }

    /*public static void main(String[] args) {

     Conectar con = new Conectar();
     con.conecta();

     String teste = con.validarLogin("henrique", "1234");

     System.out.println(teste);

     }*/
}
