package Objetos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import static org.eclipse.jdt.internal.compiler.ast.ExplicitConstructorCall.This;

public class Adotante extends Pessoa {

    private Date dataAdocao;
    private int animal;
    

    public Adotante() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Adotante(String nome, String cpf, String endereco, String telefone, String email, int animal) {
        super(nome, cpf, endereco, telefone, email);
        this.animal = animal;
        this.dataAdocao = new Date();
    }

    
    
    
    /*-------------------------------------------------------------------------------------------------------*/
    public int contarAdotante() throws SQLException{
        int quantidade=0;
        String sql = "SELECT COUNT(*) AS qtd FROM adotante;";
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
    public ArrayList<Adotante> paginacaoAdotante(int qtdporpagina, int numeroPagina) throws SQLException{
        int totalAdotante = contarAdotante();
       int qtdpaginas = contarPaginas(totalAdotante, qtdporpagina);   
      
       numeroPagina = Math.max(Math.min(totalAdotante, numeroPagina),1);
       int inicio = (numeroPagina - 1) * (qtdpaginas-1);
        ResultSet result;
        ArrayList<Adotante> lista_adotante = new ArrayList<Adotante>();
        Adotante adot;
     
        String sql = "SELECT * FROM adotante LIMIT "+inicio+","+qtdporpagina;

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        
        if (result.first()) {
           
            do {
                adot = new Adotante();
                adot.setCodigo(result.getInt("codAdotante"));
                adot.setNome(result.getString("nome"));
                adot.setCpf(result.getString("cpf"));
                adot.setEndereco(result.getString("endereco"));
                adot.setTelefone(result.getString("telefone"));
                adot.setEmail(result.getString("email"));
                adot.setAnimal(result.getInt("codAnimal"));
                adot.setDataAdocao(result.getDate("dataAdocao"));
               lista_adotante.add(adot);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_adotante;
        }
    
    
    /*-------------------------------------------------------------------------------------------------------*/


    public Adotante buscarAdotante(int cod) throws SQLException {
        ResultSet result;
        Adotante adotante = null;
        String sql = "SELECT * FROM adotante WHERE codAdotante=" + cod + ";";
        Conectar conecta = new Conectar();
        conecta.conectarBD();
        result = conecta.comandoSQL(sql);
        if (result.first()) {

            adotante = new Adotante();
            adotante.setCodigo(result.getInt("codAdotante"));
            adotante.setNome(result.getString("nome"));
            adotante.setCpf(result.getString("cpf"));
            adotante.setEndereco(result.getString("endereco"));
            adotante.setTelefone(result.getString("telefone"));
            adotante.setEmail(result.getString("email"));
            adotante.setAnimal(result.getInt("codAnimal"));
            adotante.setDataAdocao(result.getDate("dataAdocao"));
        }

        result.close();
        conecta.desconectarBD();

        return adotante;
    }
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Adotante> consultarAdotante(String nome) throws SQLException {

        ResultSet result;
        ArrayList<Adotante> lista_adotante = new ArrayList<Adotante>();
        Adotante adotante;

        String sql = "SELECT * FROM adotante where nome like '%" + nome + "%'";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        if (result.first()) {
            do {
               adotante = new Adotante();
            adotante.setCodigo(result.getInt("codAdotante"));
            adotante.setNome(result.getString("nome"));
            adotante.setCpf(result.getString("cpf"));
            adotante.setEndereco(result.getString("endereco"));
            adotante.setTelefone(result.getString("telefone"));
            adotante.setEmail(result.getString("email"));
            adotante.setAnimal(result.getInt("codAnimal"));
            adotante.setDataAdocao(result.getDate("dataAdocao"));
            lista_adotante.add(adotante);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_adotante;
    }
    
    
    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastrarAdotante() {
        return false;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean buscarAdotante() {
        return false;
    }

    public boolean alterarAdotante() {
        return false;
    }
    
    public boolean deletarAdotante() {
        return false;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    /**
     * @return the dataAdocao
     */
    public Date getDataAdocao() {
        return dataAdocao;
    }

    /**
     * @param dataAdocao the dataAdocao to set
     */
    public void setDataAdocao(Date dataAdocao) {
        this.dataAdocao = dataAdocao;
    }

    public int getAnimal() {
        return animal;
    }

    public void setAnimal(int animal) {
        this.animal = animal;
    }

}
