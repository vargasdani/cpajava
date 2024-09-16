package br.com.fiap.previsaoSafra.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class DadosClimaticos {
    @Id
    @SequenceGenerator(name = "dados_climaticos_seq", sequenceName = "dados_climaticos_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dados_climaticos_seq")
    private Long id;

    private LocalDate dataLocal;
    private Double temperaturaGraus;
    private Integer umidade;
    private Double precipitacao;

    @ManyToOne
    private Fazenda fazenda;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDataLocal() {
        return dataLocal;
    }

    public void setDataLocal(LocalDate dataLocal) {
        this.dataLocal = dataLocal;
    }

    public Double getTemperaturaGraus() {
        return temperaturaGraus;
    }

    public void setTemperaturaGraus(Double temperaturaGraus) {
        this.temperaturaGraus = temperaturaGraus;
    }

    public Integer getUmidade() {
        return umidade;
    }

    public void setUmidade(Integer umidade) {
        this.umidade = umidade;
    }

    public Double getPrecipitacao() {
        return precipitacao;
    }

    public void setPrecipitacao(Double precipitacao) {
        this.precipitacao = precipitacao;
    }

    public Fazenda getFazenda() {
        return fazenda;
    }

    public void setFazenda(Fazenda fazenda) {
        this.fazenda = fazenda;
    }

}
