package br.com.fiap.previsaoSafra.controller;

import br.com.fiap.previsaoSafra.model.Imagem;
import br.com.fiap.previsaoSafra.service.ImagemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

@RestController
@RequestMapping("/api/imagens")
public class ImagemController {

    @Autowired
    private ImagemService imagemService;

    @PostMapping("/upload")
    public ResponseEntity<Imagem> uploadImagem(@RequestParam("file") MultipartFile file) {
        try {
            Imagem imagem = imagemService.salvarImagem(file);
            return ResponseEntity.status(HttpStatus.CREATED).body(imagem);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<byte[]> getImagem(@PathVariable Long id) {
        Optional<Imagem> imagemOptional = imagemService.getImagemPorId(id);

        if (imagemOptional.isPresent()) {
            Imagem imagem = imagemOptional.get();
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_TYPE, imagem.getTipo())
                    .body(imagem.getDados());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarImagem(@PathVariable Long id) {
        imagemService.deletarImagem(id);
        return ResponseEntity.noContent().build();
    }
}
