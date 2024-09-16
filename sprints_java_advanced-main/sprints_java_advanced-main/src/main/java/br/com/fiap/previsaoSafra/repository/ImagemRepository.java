package br.com.fiap.previsaoSafra.repository;

import br.com.fiap.previsaoSafra.model.Imagem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImagemRepository extends JpaRepository<Imagem, Long> {
}
