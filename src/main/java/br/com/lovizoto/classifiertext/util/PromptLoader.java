package br.com.lovizoto.classifiertext.util;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class PromptLoader {

    public static String carregar(String nomeArquivo) {
        try {
            var resource = PromptLoader.class.getClassLoader().getResource(nomeArquivo);

            if (resource == null) {
                throw new IOException("Arquivo de prompt não encontrado: " + nomeArquivo);
            }

            return Files.readString(Paths.get(resource.toURI()));

        } catch (IOException | URISyntaxException e) {
            System.err.println("Falha ao carregar o prompt: " + nomeArquivo);
            e.printStackTrace();
            // Em caso de erro, para a aplicação para evitar comportamento inesperado
            throw new RuntimeException(e);
        }
    }

}
