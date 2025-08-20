package br.com.lovizoto.dao;

import br.com.lovizoto.model.AnaliseAutoriaMateria;

import java.util.List;

public interface AnaliseAutoriaMateriaDAO {

    List<AnaliseAutoriaMateria> listarMaterias();
    List<AnaliseAutoriaMateria> listarMateriasNaoAutorizadas();

    void atualizarAnalise(AnaliseAutoriaMateria analiseAutoriaMateria);
    void atualizarLoteAnalise(List<AnaliseAutoriaMateria> listaMateria);
}
