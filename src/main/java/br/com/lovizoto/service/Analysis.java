package br.com.lovizoto.service;

import br.com.lovizoto.classifiertext.service.GeminiChatService;
import br.com.lovizoto.dao.AnaliseAutoriaMateriaDAO;
import br.com.lovizoto.dao.AnaliseAutoriaMateriaImpl;
import br.com.lovizoto.model.AnaliseAutoriaMateria;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class Analysis {

    private AnaliseAutoriaMateriaDAO analiseAutoriaMateriaDAO =  new AnaliseAutoriaMateriaImpl();

    private static String contextoTipo = "";
    private static String contextoTema = "";
    private static String contextoSubtema = "";

    private static String apiUrl = "";
    private static String apiKey = "";

    public void execute() {

        List<AnaliseAutoriaMateria> listaMaterias = analiseAutoriaMateriaDAO.listarMaterias();

        GeminiChatService geminiChatService = new GeminiChatService(Analysis.apiUrl, Analysis.apiKey);

        AtomicInteger contador =  new AtomicInteger(0);
        int total =  listaMaterias.size();

        //a quantidade de itens da lista pede o parallelStream()
        listaMaterias.parallelStream().forEach(materia -> {

            String ementa = materia.getTxtEmenta();

            Optional<String> tipo = geminiChatService.classifyText(contextoTipo, ementa);
            Optional<String> tema = geminiChatService.classifyText(contextoTema, ementa);
            Optional<String> subtema = geminiChatService.classifyText(contextoSubtema, ementa);

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
