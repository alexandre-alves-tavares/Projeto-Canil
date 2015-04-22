package Objetos;

import java.util.Date;

public class Veterinario extends Pessoa implements Login {

    private String usuario;
    private String senha;
    private int crmv;
    private Date dataContratacao;

    public Veterinario(int codigo, String nome, String cpf, String endereco, String telefone, String email,
            String usuario, String senha, int crmv, Date dataContratacao) {

        super(codigo, nome, cpf, endereco, telefone, email);

        this.usuario = usuario;
        this.senha = senha;
        this.crmv = crmv;
        this.dataContratacao = dataContratacao;
    }

    public void cadastrarVeterinario() {

    }

    public boolean buscarVeterinario() {
        return false;
    }

    public void alterarVeterianrio() {

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
     * @return the crmv
     */
    public int getCrmv() {
        return crmv;
    }

    /**
     * @param crmv the crmv to set
     */
    public void setCrmv(int crmv) {
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

}
