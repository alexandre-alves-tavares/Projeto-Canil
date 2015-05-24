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
    public boolean alterarMedicamento() {
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

    public void setDesricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

}
