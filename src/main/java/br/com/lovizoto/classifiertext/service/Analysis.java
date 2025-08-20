package br.com.lovizoto.classifiertext.service;

import br.com.lovizoto.classifiertext.dao.AnaliseAutoriaMateriaDAO;
import br.com.lovizoto.classifiertext.dao.AnaliseAutoriaMateriaImpl;
import br.com.lovizoto.classifiertext.model.AnaliseAutoriaMateria;
import br.com.lovizoto.classifiertext.util.ConfigLoader;
import br.com.lovizoto.classifiertext.util.PromptLoader;
import com.google.common.util.concurrent.RateLimiter;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class Analysis {

    private AnaliseAutoriaMateriaDAO analiseAutoriaMateriaDAO =  new AnaliseAutoriaMateriaImpl();

    private static String contextoTipo = PromptLoader.carregar("prompts/tipo.prompt");
    private static String contextoTema = PromptLoader.carregar("prompts/tema.prompt");
    private static String contextoSubtema = PromptLoader.carregar("prompts/subtema.prompt");

    private static String apiUrl = ConfigLoader.getProperty("gemini.api.url");
    private static String apiKey = ConfigLoader.getProperty("gemini.api.key");

    private static final RateLimiter rateLimiter = RateLimiter.create(0.9);

    public void execute() {

        List<AnaliseAutoriaMateria> listaMaterias = analiseAutoriaMateriaDAO.listarMaterias();

        GeminiChatService geminiChatService = new GeminiChatService(Analysis.apiUrl, Analysis.apiKey);

        AtomicInteger contador =  new AtomicInteger(0);
        int total =  listaMaterias.size();

        //a quantidade de itens da lista pede o parallelStream() - a IA utiliza uma cota de requisições por minuto
        listaMaterias.parallelStream().forEach(materia -> {

            //vai segurar o stream() fazendo o códiugo esperar
            rateLimiter.acquire(3);

            String ementa = materia.getTxtEmenta();

            Optional<String> tipo = geminiChatService.classifyText(contextoTipo, ementa);
            Optional<String> tema = geminiChatService.classifyText(contextoTema, ementa);
            Optional<String> subtema = geminiChatService.classifyText(contextoSubtema, tema.get() + ": " + ementa);

            materia.setTema(tema.orElse("Tema não classificado: " + materia.getCodMateria()));
            materia.setSubtema(subtema.orElse("Subtema não classificado: " + materia.getCodMateria()));
            materia.setTipo(tipo.orElse("Tipo não classificado: " + materia.getCodMateria()));

            int progresso = contador.incrementAndGet();
            System.out.println("Analisado item " + progresso + "/" + total + " (cod_materia: " + materia.getCodMateria() + ")");

        });




        System.out.println("Processamento paralelo concluído. Salvando todos os " + total + " resultados no banco de dados...");
        analiseAutoriaMateriaDAO.atualizarLoteAnalise(listaMaterias);

        System.out.println("Processo concluído.");

    }


}
