package Objetos;

import java.util.Date;

public class Agente extends Pessoa implements Login {

    private String usuario;
    private String senha;
    private Date dataContratacao;

    public Agente(int codigo, String nome, String cpf, String endereco, String telefone, String email,
            String usuario, String senha, Date dataContratacao) {

        super(codigo, nome, cpf, endereco, telefone, email);

        this.usuario = usuario;
        this.senha = senha;
        this.dataContratacao = dataContratacao;
    }

    public void cadastrarAgente() {

    }

    public boolean buscarAgente() {
        return false;
    }

    public void alterarAgente() {

    }

    @Override
    public boolean realizarLogin(String usuario, String senha) {
        return false;
    }

    @Override
    public boolean realizarLogout() {
        return false;
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
}
