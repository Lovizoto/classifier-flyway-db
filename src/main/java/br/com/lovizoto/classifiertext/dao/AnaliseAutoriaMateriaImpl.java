package br.com.lovizoto.classifiertext.dao;

import br.com.lovizoto.classifiertext.model.AnaliseAutoriaMateria;
import br.com.lovizoto.classifiertext.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnaliseAutoriaMateriaImpl implements AnaliseAutoriaMateriaDAO {


    @Override
    public List<AnaliseAutoriaMateria> listarMaterias() {
        List<AnaliseAutoriaMateria> listaAnaliseAutoriaMateria = new ArrayList<>();

        String sql = "SELECT " +
                "cod_parlamentar, " +
                "nome_autor, " +
                "ano_ident_basica, " +
                "dat_apresentacao, " +
                "txt_ementa, " +
                "cod_materia, " +
                "tipo, " +
                "tema, " +
                "subtema " +
                "FROM analise_autoria_materia";


        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {


            final int col1Idx = 1, col2Idx = 2, col3Idx = 3, col4Idx = 4, col5Idx = 5,
                    col6Idx = 6, col7Idx = 7, col8Idx = 8, col9Idx = 9;

            while (rs.next()) {
                AnaliseAutoriaMateria item = new AnaliseAutoriaMateria();
                item.setCodParlamentar(rs.getInt(col1Idx));
                item.setNomeAutor(rs.getString(col2Idx));
                item.setAnoIdentBasica(rs.getInt(col3Idx));
                item.setDatApresentacao(rs.getDate(col4Idx));
                item.setTxtEmenta(rs.getString(col5Idx));
                item.setCodMateria(rs.getInt(col6Idx));
                item.setTipo(rs.getString(col7Idx));
                item.setTema(rs.getString(col8Idx));
                item.setSubtema(rs.getString(col9Idx));
                listaAnaliseAutoriaMateria.add(item);
            }
            return listaAnaliseAutoriaMateria;
        } catch(Exception ex) {
            System.out.println("Erro ao obter listas = " + ex);
            return null;
        }

    }

    @Override
    public List<AnaliseAutoriaMateria> listarMateriasNaoAutorizadas() {
        return List.of();
    }

    @Override
    public void atualizarAnalise(AnaliseAutoriaMateria analiseAutoriaMateria) {

    }

    @Override
    public void atualizarLoteAnalise(List<AnaliseAutoriaMateria> listaMateria) {

        String sql = "UPDATE analise_autoria_materia SET tipo = ?, tema = ?, subtema = ? WHERE cod_materia = ? AND dat_apresentacao = ? ;";
        Connection conn = null;

        try {
            conn = ConnectionFactory.getConnection();
            conn.setAutoCommit(false);

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                for (AnaliseAutoriaMateria item : listaMateria) {
                    stmt.setString(1, item.getTipo());
                    stmt.setString(2, item.getTema());
                    stmt.setString(3, item.getSubtema());
                    stmt.setInt(4, item.getCodMateria());
                    stmt.setDate(5, new java.sql.Date(item.getDatApresentacao().getTime()));

                    stmt.addBatch();
                }
                stmt.executeBatch();

                conn.commit();

            } catch (SQLException e) {
                if (conn != null) {
                    conn.rollback();
                }
                e.printStackTrace();
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
