package Objetos;

import java.util.Date;

public class Adotante extends Pessoa {

    private Date dataAdocao;

    public Adotante() {

    }

    /*-------------------------------------------------------------------------------------------------------*/
    public Adotante(String nome, String cpf, String endereco, String telefone, String email) {

        super(nome, cpf, endereco, telefone, email);

        this.dataAdocao = new Date();
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

}
