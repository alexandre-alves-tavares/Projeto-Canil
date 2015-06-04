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
