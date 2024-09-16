package br.com.fiap.previsaoSafra.service;

import br.com.fiap.previsaoSafra.model.Imagem;
import br.com.fiap.previsaoSafra.repository.ImagemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;
import java.util.Date;

@Service
public class ImagemService {

    @Autowired
    private ImagemRepository imagemRepository;

    public Imagem salvarImagem(MultipartFile file) throws IOException {
        Imagem imagem = new Imagem();
        imagem.setNome(file.getOriginalFilename());
        imagem.setTipo(file.getContentType());
        imagem.setDados(file.getBytes());
        imagem.setDataUpload(new Date());
        return imagemRepository.save(imagem);
    }

    public Optional<Imagem> getImagemPorId(Long id) {
        return imagemRepository.findById(id);
    }

    public void deletarImagem(Long id) {
        imagemRepository.deleteById(id);
    }
}
