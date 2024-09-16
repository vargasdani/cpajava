package br.com.fiap.previsaoSafra.controller.dto;

import br.com.fiap.previsaoSafra.model.DadosProducao;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

@Data
public class ColheitaDTO {

    private Long id;

    @NotBlank(message = "O nome da colheita é obrigatório")
    private String nome;

    @NotBlank(message = "O tipo da colheita é obrigatório")
    private String tipo;

    @NotBlank(message = "A estação do ano é obrigatória")
    private String estacaoDoAno;

    // Lista de dados de produção associados à colheita
    private List<DadosProducao> dadosProducao;
}
