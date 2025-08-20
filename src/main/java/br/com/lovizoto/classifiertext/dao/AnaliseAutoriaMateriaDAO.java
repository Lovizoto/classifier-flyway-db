package br.com.lovizoto.classifiertext.dao;

import br.com.lovizoto.classifiertext.model.AnaliseAutoriaMateria;

import java.util.List;

public interface AnaliseAutoriaMateriaDAO {

    List<AnaliseAutoriaMateria> listarMaterias();
    List<AnaliseAutoriaMateria> listarMateriasNaoAutorizadas();

    void atualizarAnalise(AnaliseAutoriaMateria analiseAutoriaMateria);
    void atualizarLoteAnalise(List<AnaliseAutoriaMateria> listaMateria);
}
