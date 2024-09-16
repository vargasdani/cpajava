package br.com.fiap.previsaoSafra.controller.dto;

import br.com.fiap.previsaoSafra.model.Colheita;
import br.com.fiap.previsaoSafra.model.DadosClimaticos;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

@Data
public class FazendaDTO {

    private Long id;

    @NotBlank(message = "O nome do dono é obrigatório")
    private String dono;

    @NotBlank(message = "A latitude é obrigatória")
    private String latitude;

    @NotBlank(message = "A longitude é obrigatória")
    private String longitude;

    @NotNull(message = "O tamanho da fazenda é obrigatório")
    private Integer tamanho;

    // Lista de colheitas associadas à fazenda
    private List<Colheita> listaColheita;

    // Dados climáticos associados à fazenda
    private List<DadosClimaticos> dadosClimaticos;
}
