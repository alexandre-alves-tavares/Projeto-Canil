package Objetos;

import java.awt.Image;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class Animal {

    private int codigo;
    private String nome;
    private String bairroRecolhimento;
    private Date data; //ainda nao
    private String sexo;
    private String tipo;
    private float peso;
    private int idade;
    private String cor;
    private String pelagem;
    private String raca;
    private String agressor;
    private String racao;
    private String observacao;
    private Image foto; //ainda nao
    private int baia; //03/05/2015

    public Animal() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Animal(String nome, String bairroRecolhimento, String sexo, String tipo, float peso, int idade, String cor,
            String pelagem, String raca, String agressor, String racao, String observacao, int baia) {
       
        this.nome = nome;
        this.bairroRecolhimento = bairroRecolhimento;
        this.setSexo(sexo);
       this.tipo = tipo;
        this.peso = peso;
        this.idade = idade;
        this.cor = cor;
        this.pelagem = pelagem;
        this.raca = raca;
        this.setAgressor(agressor);
        this.racao = racao;
        this.observacao = observacao;
        this.baia = baia;
    }

    /*-------------------------------------------------------------------------------------------------------*/
    public boolean cadastarAnimal() throws SQLException {

        String sql = "INSERT INTO Animal (nome, bairroRecolhimento, sexo, tipo, peso, idade, "
                + "cor, pelagem, raca, agressor, racao, observacao, baia)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Conectar conecta = new Conectar();
        conecta.conectarBD();
        //System.out.println("Conectaaaaaa");

        PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);

        try {

            stmt.setString(1, this.getNome());
            stmt.setString(2, this.getBairroRecolhimento());
            stmt.setString(3, this.sexo);
            stmt.setString(4, this.getTipo());
            stmt.setFloat(5, this.peso);
            stmt.setInt(6, this.getIdade());
            stmt.setString(7, this.getCor());
            stmt.setString(8, this.getPelagem());
            stmt.setString(9, this.getRaca());
            stmt.setString(10, this.getAgressor());
            stmt.setString(11, this.getRacao());
            stmt.setString(12, this.getObservacao());
            stmt.setInt(13, this.getBaia());

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
    public ArrayList<Animal> listarAnimais() throws SQLException {

        ResultSet result;
        ArrayList<Animal> lista_animal = new ArrayList<Animal>();
        Animal animal;

        String sql = "SELECT * FROM Animal";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                animal = new Animal();
                animal.setCodigo(result.getInt("codAnimal"));
                animal.setNome(result.getString("nome"));
                animal.setBairroRecolhimento(result.getString("bairroRecolhimento"));
                animal.setSexo(result.getString("sexo"));
                animal.setTipo(result.getString("tipo"));
               // animal.setPeso(result.getString("peso"));
                 animal.setNome(result.getString("nome"));
                animal.setBaia(result.getInt("baia"));

                lista_animal.add(animal);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_animal;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public ArrayList<Animal> consultarAnimal(String nome) throws SQLException {

        ResultSet result;
        ArrayList<Animal> lista_animal = new ArrayList<Animal>();
        Animal animal;

        String sql = "SELECT * FROM Animal where nome like '%" + nome + "%'";

        Conectar conecta = new Conectar();
        conecta.conectarBD();

        result = conecta.comandoSQL(sql);

        //PreparedStatement stmt = conecta.getConexao().prepareStatement(sql);
        //Statement stmt = conecta.getConexao().createStatement();
        //ResultSet result = stmt.executeQuery(sql);
        if (result.first()) {
            do {
                animal = new Animal();
                animal.setCodigo(result.getInt("codAnimal"));
                animal.setNome(result.getString("nome"));

                lista_animal.add(animal);
            } while (result.next());
        }

        result.close();
        conecta.desconectarBD();

        return lista_animal;
    }
    
    public boolean alterarAnimal() {
        return false;
    }
    
    /*-------------------------------------------------------------------------------------------------------*/
    public boolean deletarAnimal(int codigo) throws SQLException {

        String sql = "DELETE FROM Animal WHERE codAnimal = ?";

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
    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the bairroRecolhimento
     */
    public String getBairroRecolhimento() {
        return bairroRecolhimento;
    }

    /**
     * @param bairroRecolhimento the bairroRecolhimento to set
     */
    public void setBairroRecolhimento(String bairroRecolhimento) {
        this.bairroRecolhimento = bairroRecolhimento;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {

        if (sexo.equals("macho")) {
            this.sexo = "Macho";
        } else {
            this.sexo = "Femea";
        }
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the peso
     */
    public float getPeso() {
        return peso;
    }

    /**
     * @param peso the peso to set
     */
    public void setPeso(float peso) {
        this.peso = peso;
    }

    /**
     * @return the idade
     */
    public int getIdade() {
        return idade;
    }

    /**
     * @param idade the idade to set
     */
    public void setIdade(int idade) {
        this.idade = idade;
    }

    /**
     * @return the cor
     */
    public String getCor() {
        return cor;
    }

    /**
     * @param cor the cor to set
     */
    public void setCor(String cor) {
        this.cor = cor;
    }

    /**
     * @return the pelagem
     */
    public String getPelagem() {
        return pelagem;
    }

    /**
     * @param pelagem the pelagem to set
     */
    public void setPelagem(String pelagem) {
        this.pelagem = pelagem;
    }

    /**
     * @return the raca
     */
    public String getRaca() {
        return raca;
    }

    /**
     * @param raca the raca to set
     */
    public void setRaca(String raca) {
        this.raca = raca;
    }

    /**
     * @return the agressor
     */
    public String getAgressor() {
        return agressor;
    }

    /**
     * @param agressor the agressor to set
     */
    public void setAgressor(String agressor) {

        if (agressor.equals("agressivo")) {
            this.agressor = "Sim";
        } else {
            this.agressor = "Não";
        }
    }

    /**
     * @return the racao
     */
    public String getRacao() {
        return racao;
    }

    /**
     * @param racao the racao to set
     */
    public void setRacao(String racao) {
        this.racao = racao;
    }

    /**
     * @return the observacao
     */
    public String getObservacao() {
        return observacao;
    }

    /**
     * @param observacao the observacao to set
     */
    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    /**
     * @return the foto
     */
    public Image getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(Image foto) {
        this.foto = foto;
    }

    public int getBaia() {
        return baia;
    }

    public void setBaia(int baia) {
        this.baia = baia;
    }
}
