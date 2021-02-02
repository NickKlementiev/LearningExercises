package ALPOO;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;

//--Catálogo é uma classe geral utilizada para a visualização dos dados já presentes no banco de dados,--//
//--visualizando todas as entidades envolvidas no trabalho: Aluno, Professor, Curso, Disciplina--//

//--Observação: A tabela Aluno por si só já inclui a visualização completa de todos os dados dos alunos,--//
//--incluindo o curso e a disciplina que está realizando--//

public class Catalogo {
    //--Componentes básicos da classe--//
    JPanel pView, gView;
    JTable table;
    CustomTableModel dtmTable;
    JButton refresh, delete, alter;
    JScrollPane scrollPane;
    String[] titleRow;
    String currentEntity;

    Aluno aluno;
    Professor professor;
    Disciplina disciplina;
    Curso curso;

    //--Strings essenciais do JDBC--//
    String driver, url, login, password;

    Font ft1 = new Font("Arial", Font.BOLD, 14);

    public Catalogo() {
        //--Configuração inicial do painel--//
        pView = new JPanel();
        pView.setLayout(new BorderLayout());

        //--Instanciação de uma tabela inicial vazia--//
        table = new JTable(dtmTable);
        dtmTable = new CustomTableModel();
        scrollPane = new JScrollPane();
        scrollPane.setViewportView(table);
        pView.add(scrollPane);

        //--Grid Layout no BorderLayout.SOUTH de pView--//
        gView = new JPanel(new GridLayout(1, 3));

        //--Botão de atualização da tabela--//
        refresh = new JButton("Atualizar");
        refresh.setFont(ft1);
        refresh.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                accessDatabase(currentEntity);
            }
        });
        gView.add(refresh);

        //--Botão de mudança de dados--//
        alter = new JButton("Mudar");
        alter.setFont(ft1);
        alter.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (dtmTable.getSelectedRow().size() != 1) {
                    String message = "Só é possível alterar uma entidade por vez";
                    JOptionPane.showMessageDialog(null, message, "Aviso", JOptionPane.INFORMATION_MESSAGE);
                }
                else {
                    if (currentEntity.equals("aluno")) {
                        aluno.update(dtmTable);
                    }
                    else if (currentEntity.equals("professor")) {
                        professor.update(dtmTable);
                    }
                    else if (currentEntity.equals("disciplina")) {
                        disciplina.update(dtmTable);
                    }
                    else if (currentEntity.equals("curso")) {
                        curso.update(dtmTable);
                    }
                }
            }
        });
        gView.add(alter);

        //--Botão de remoção de dados--//
        delete = new JButton("Deletar");
        delete.setFont(ft1);
        delete.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String message = "Confirmar remoção dos elementos selecionados?";
                int choice = JOptionPane.showConfirmDialog(null, message, "Confirmação", JOptionPane.YES_NO_OPTION);
                if (choice == 0)
                    deleteDatabase(currentEntity);
            }
        });
        gView.add(delete);

        pView.add(gView, BorderLayout.SOUTH);
    }

    //--Função void que extrai as informações do banco de dados "faculdade" com base no parâmetro--//
    //--entidade, atribuindo o nome das colunas em um array de String chamado titleRow e, em seguida,--//
    //--reconfigura e preenche a tabela com informações concretas--//
    public void accessDatabase(String entidade) {
        //--Determinar qual query e configuração utilizar de acordo com a entidade--//
        currentEntity = entidade;
        String query;
        ResultSet result;
        if (entidade.equals("aluno")) {
            query = "select A.Matricula, A.Nome, A.DataNasc, A.CodCurso, A.CodDisc, C.NomeCurso, D.NomeDisc, " +
                    "A.NP1, A.NP2, A.Media, A.Faltas " +
                    "from Aluno A, Curso C, Disciplina D " +
                    "where A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc " +
                    "order by A.Matricula";
            titleRow = new String[] {"", "Matrícula", "Nome", "Nascimento", "Curso", "Disciplina", "NP1", "NP2", "Média", "Faltas"};
        }
        else if (entidade.equals("professor")) {
            query = "select P.IdentProf, P.NomeProf, P.DataNasc, P.EspecProf, P.TituloProf, E.Rua, E.Numero, E.Bairro, E.Cidade, E.Estado, " +
                    "E.Telfixo, E.Celular from Professor P, EndProf E where P.IdentProf = E.IdentProf order by P.IdentProf";
            titleRow = new String[] {"", "Identidade", "Nome", "Nascimento", "Especialidade", "Título", "Rua", "Número", "Bairro", "Cidade",
                    "Estado", "Tel. Fixo", "Celular"};
        }
        else if (entidade.equals("disciplina")) {
            query = "select D.CodDisc, D.NomeDisc, D.CargaHoraria, D.AulasSemana from Disciplina D order by D.CodDisc";
            titleRow = new String[] {"", "Código", "Nome", "Carga", "Aulas Semanais"};
        }
        else if (entidade.equals("curso")) {
            query = "select C.CodCurso, C.NomeCurso, C.TipoCurso, C.CargaHoraria, C.CodInstituto from Curso C order by C.CodCurso";
            titleRow = new String[] {"", "Código", "Nome", "Tipo", "Carga", "Instituto"};
        }
        else if (entidade.equals("cursodisciplina")) {
            query = "select C.CodCurso, C.NomeCurso, D.CodDisc, D.NomeDisc, D.CargaHoraria, D.AulasSemana " +
                    "from Curso C, Disciplina D where C.CodCurso = D.CodCurso order by C.CodCurso";
            titleRow = new String[] {"Cód. Curso", "Nome Curso", "Cód. Disciplina", "Nome Disciplina", "Carga Hor. Disciplina",
                    "Aulas Semanais"};
        }
        else if (entidade.equals("cursoprofessor")) {
            query = "select C.CodCurso, C.NomeCurso, C.TipoCurso, C.CargaHoraria, P.IdentProf, P.NomeProf, P.EspecProf, P.TituloProf " +
                    "from Professor P, Curso C, Disciplina D where D.CodCurso = C.CodCurso and D.IdentProf = P.IdentProf";
            titleRow = new String[] {"Cód. Curso", "Nome Curso", "Tipo Curso", "Carga Horária", "Id. Professor", "Nome Professor",
                    "Especialidade", "Título"};
        }
        else if (entidade.equals("professordisciplina")) {
            query = "select P.IdentProf, P.NomeProf, P.EspecProf, P.TituloProf, D.CodDisc, D.NomeDisc, D.CargaHoraria, D.AulasSemana " +
                    "from Professor P, Disciplina D where P.IdentProf = D.IdentProf order by P.IdentProf";
            titleRow = new String[] {"Identidade", "Nome Prof.", "Especialidade", "Título", "Cód. Disciplina", "Nome Disciplina",
                    "Carga Horária", "Aulas Semanais"};
        }
        else {
            query = null;
            titleRow = null;
        }
        dtmTable = new CustomTableModel(titleRow, 0);

        //--Zerar a DefaultTableModel antes de inserir os dados, em caso de ela já ter dados previamente--/
        if (dtmTable.getRowCount() > 0) {
            for (int i = dtmTable.getRowCount() - 1; i >= 0; i--) {
                dtmTable.removeRow(i);
            }
        }
        //--Inserção dos valores da tabela--//
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                //--Determinar dados a serem colocados por linha na tabela--//
                Object[] row;
                if (entidade.equals("aluno")) {
                    row = new Object[] {false, result.getString("Matricula"), result.getString("Nome"),
                            result.getString("DataNasc"), result.getString("NomeCurso"), result.getString("NomeDisc"),
                            result.getString("NP1"), result.getString("NP2"), result.getString("Media"),
                            result.getString("Faltas")};
                }
                else if (entidade.equals("professor")) {
                    row = new Object[] {false, result.getString("IdentProf"), result.getString("NomeProf"),
                            result.getString("DataNasc"), result.getString("EspecProf"), result.getString("TituloProf"),
                            result.getString("Rua"), result.getString("Numero"), result.getString("Bairro"),
                            result.getString("Cidade"), result.getString("Estado"), result.getString("Telfixo"),
                            result.getString("Celular")};
                }
                else if (entidade.equals("disciplina")) {
                    row = new Object[] {false, result.getString("CodDisc"), result.getString("NomeDisc"),
                            result.getString("CargaHoraria"), result.getString("AulasSemana")};
                }
                else if (entidade.equals("curso")) {
                    row = new Object[] {false, result.getString("CodCurso"), result.getString("NomeCurso"),
                            result.getString("TipoCurso"), result.getString("CargaHoraria"),
                            result.getString("CodInstituto")};
                }
                else if (entidade.equals("cursodisciplina")) {
                    row = new Object[] {result.getString("CodCurso"), result.getString("NomeCurso"),
                            result.getString("CodDisc"), result.getString("NomeDisc"),
                            result.getString("CargaHoraria"), result.getString("AulasSemana")};
                }
                else if (entidade.equals("cursoprofessor")) {
                    row = new Object[] {result.getString("CodCurso"), result.getString("NomeCurso"),
                            result.getString("TipoCurso"), result.getString("CargaHoraria"),
                            result.getString("IdentProf"), result.getString("NomeProf"), result.getString("EspecProf"),
                            result.getString("TituloProf")};
                }
                else if (entidade.equals("professordisciplina")) {
                    row = new Object[] {result.getString("IdentProf"), result.getString("NomeProf"),
                            result.getString("EspecProf"), result.getString("TituloProf"),
                            result.getString("CodDisc"), result.getString("NomeDisc"), result.getString("CargaHoraria"),
                            result.getString("AulasSemana")};
                }
                else {
                    row = null;
                }
                dtmTable.addRow(row);
            }
            //--Remove o componente e o insere de novo, atualizando qualquer dado previamente colocado na tabela--//
            pView.remove(scrollPane);
            table = new JTable(dtmTable);
            scrollPane.setViewportView(table);
            pView.add(scrollPane);
            //--Ajusta o comprimento das colunas de acordo com a entidade, para facilitar a visualização--//
            if (entidade.equals("aluno")) {
                table.getColumnModel().getColumn(0).setPreferredWidth(20);
                table.getColumnModel().getColumn(3).setPreferredWidth(80);
                table.getColumnModel().getColumn(4).setPreferredWidth(160);
                table.getColumnModel().getColumn(5).setPreferredWidth(90);
            }
            else if (entidade.equals("professor")) {
                table.getColumnModel().getColumn(0).setPreferredWidth(20);
                table.getColumnModel().getColumn(1).setPreferredWidth(30);
                table.getColumnModel().getColumn(3).setPreferredWidth(100);
                table.getColumnModel().getColumn(4).setPreferredWidth(110);
                table.getColumnModel().getColumn(7).setPreferredWidth(60);
                table.getColumnModel().getColumn(10).setPreferredWidth(40);
                table.getColumnModel().getColumn(11).setPreferredWidth(80);
                table.getColumnModel().getColumn(12).setPreferredWidth(90);
            }
            else if (entidade.equals("curso")) {
                table.getColumnModel().getColumn(0).setPreferredWidth(20);
                table.getColumnModel().getColumn(2).setPreferredWidth(160);
                table.getColumnModel().getColumn(3).setPreferredWidth(100);
            }
            else if (entidade.equals("disciplina")) {
                table.getColumnModel().getColumn(0).setPreferredWidth(10);
            }
            else if (entidade.equals("cursodisciplina")) {
                table.getColumnModel().getColumn(0).setPreferredWidth(60);
                table.getColumnModel().getColumn(1).setPreferredWidth(160);
                table.getColumnModel().getColumn(4).setPreferredWidth(120);
            }
            else if (entidade.equals("cursoprofessor")) {
                table.getColumnModel().getColumn(1).setPreferredWidth(160);
            }
            else if (entidade.equals("professordisciplina")) {
                table.getColumnModel().getColumn(5).setPreferredWidth(100);
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Classe customizada que herda DefaultTableModel para implementação das caixas de seleção na primeira coluna--//
    //--As tabelas que visualizam Aluno, Professor, Disciplina e Curso possuem uma coluna de caixas selecionáveis para alteração--//
    //--ou deleção de dados--//
    public class CustomTableModel extends DefaultTableModel {

        // Herdar o método construtor sem parâmetros
        public CustomTableModel() {
            super();
        }

        // Herdar o método construtor com parâmetros
        public CustomTableModel(Object[] objects, int index) {
            super(objects, index);
        }

        // Sobrescrita do método getColumnClass, para que a primeira coluna seja um valor Booleano
        // em caso de a entidade ser Aluno, Professor, Disciplina ou Curso
        @Override
        public Class<?> getColumnClass(int columnIndex) {
            Class<?> c = String.class;
            if (!currentEntity.equals("cursodisciplina") && !currentEntity.equals("cursoprofessor") &&
                    !currentEntity.equals("professordisciplina") && columnIndex == 0)
                c = Boolean.class;
            return c;
        }

        // Especificar que somente a primeira coluna é editável (seleção das caixas)
        @Override
        public boolean isCellEditable(int row, int column) {
            if (!currentEntity.equals("cursodisciplina") && !currentEntity.equals("professordisciplina"))
                return column == 0;
            else
                return false;
        }

        // Função que retorna um ArrayList de tipo Integer das linhas selecionadas
        // para deleção ou alteração de dados
        public ArrayList<Integer> getSelectedRow() {
            ArrayList<Integer> selected = new ArrayList<Integer>();
            for (int i = 0; i < getRowCount(); i++) {
                if (getValueAt(i, 0).equals(true))
                    selected.add(i);
            }
            return selected;
        }
    }

    //--Remoção de informações do banco de dados--//
    public void deleteDatabase(String entity) {
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            String query;

            for (Integer i: dtmTable.getSelectedRow()) {
                if (entity.equals("aluno")) {
                    query = "delete from Aluno where Matricula = " + dtmTable.getValueAt(i, 1);
                }
                else if (entity.equals("professor")) {
                    query = "delete from Professor where IdentProf = " + dtmTable.getValueAt(i, 1);
                }
                else if (entity.equals("disciplina")) {
                    query = "delete from Disciplina where CodDisc = " + dtmTable.getValueAt(i, 1);
                }
                else if (entity.equals("curso")) {
                    query = "delete from Curso where CodCurso = " + dtmTable.getValueAt(i, 1);
                }
                else {
                    query = null;
                }

                statement.executeUpdate(query);
            }
            accessDatabase(entity);
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

}
