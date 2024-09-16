package br.com.fiap.previsaoSafra.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.util.Date;

@Entity
public class Imagem {
    @Id
    @SequenceGenerator(name = "imagem_seq", sequenceName = "imagem_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "imagem_seq")
    private Long id;

    private String nome;
    private String tipo;

    @Lob
    private byte[] dados;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dataUpload;

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public byte[] getDados() {
        return dados;
    }

    public void setDados(byte[] dados) {
        this.dados = dados;
    }

    public void setDataUpload(Date dataUpload) {
        this.dataUpload = dataUpload;
    }
    
    public Date getDataUpload() {
        return dataUpload;
    }
}
