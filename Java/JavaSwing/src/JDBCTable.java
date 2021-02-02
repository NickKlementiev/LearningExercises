import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.ArrayList;

public class JDBCTable extends JFrame {
    // Configuração básica das variáveis utilizadas ao longo do programa
    JButton iButton, rButton;
    JScrollPane sp;
    JTable tb;
    DefaultTableModel dtm;
    JPanel tPanel, iPanel, cPanel, dPanel;
    JTextField tfMat, tfNome, tfNasc, tfNP1, tfNP2, tfMedia, tfFaltas;
    JLabel lMat, lNome, lNasc, lCurso, lDisc, lNP1, lNP2, lMedia, lFaltas;
    JList<String> listCurso, listDisc;
    DefaultListModel<String> dlmCurso, dlmDisc;
    ArrayList selected, matricula;
    String driver, url, login, password;

    // Configuração básica do menu
    JMenuBar menuBar = new JMenuBar();
    JMenu menu = new JMenu("View");
    JMenuItem insert = new JMenuItem("Insertion");
    JMenuItem table = new JMenuItem("Table");
    JMenuItem edit = new JMenuItem("Edition");

    public JDBCTable() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost/faculdade";
        url += "?useTimezone=true&serverTimezone=UTC";
        login = "root";
        password = "root";

        this.setBounds(200, 100, 800, 500);
        this.setTitle("Java DataBase Connector Demonstration");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setJMenuBar(menuBar);
        menuBar.add(menu);
        menu.add(table);
        menu.add(insert);
        menu.add(edit);

        eventHandler eh = new eventHandler();
        insert.addActionListener(eh);
        table.addActionListener(eh);
        edit.addActionListener(eh);

        lMat = new JLabel("Matrícula");
        lMat.setSize(100, 20);
        lMat.setLocation(10, 10);
        tfMat = new JTextField();
        tfMat.setSize(100, 20);
        tfMat.setLocation(10, 30);

        lNome = new JLabel("Nome");
        lNome.setSize(50, 20);
        lNome.setLocation(10, 60);
        tfNome = new JTextField();
        tfNome.setSize(100, 20);
        tfNome.setLocation(10, 80);

        lNasc = new JLabel("Nascimento (AAAA-MM-DD)");
        lNasc.setSize(200, 20);
        lNasc.setLocation(10, 110);
        tfNasc = new JTextField();
        tfNasc.setSize(100, 20);
        tfNasc.setLocation(10, 130);

        lCurso = new JLabel("Curso");
        lCurso.setSize(50, 20);
        lCurso.setLocation(220, 10);
        dlmCurso = new DefaultListModel<String>();
        databaseCurso();
        listCurso = new JList<String>(dlmCurso);
        listCurso.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        listCurso.setSelectedIndex(0);
        listCurso.setVisibleRowCount(2);
        listCurso.setBounds(220, 30, 200, 90);

        lDisc = new JLabel("Disciplina");
        lDisc.setSize(100, 20);
        lDisc.setLocation(220, 130);
        dlmDisc = new DefaultListModel<String>();
        databaseDisc();
        listDisc = new JList<String>(dlmDisc);
        listDisc.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        listDisc.setSelectedIndex(0);
        listDisc.setVisibleRowCount(2);
        listDisc.setBounds(220, 150, 200, 180);

        lNP1 = new JLabel("NP1");
        lNP1.setSize(50, 20);
        lNP1.setLocation(10, 160);
        tfNP1 = new JTextField();
        tfNP1.setSize(50, 20);
        tfNP1.setLocation(10, 180);

        lNP2 = new JLabel("NP2");
        lNP2.setSize(50, 20);
        lNP2.setLocation(10, 210);
        tfNP2 = new JTextField();
        tfNP2.setSize(50, 20);
        tfNP2.setLocation(10, 230);

        lMedia = new JLabel("Média");
        lMedia.setSize(50, 20);
        lMedia.setLocation(10, 260);
        tfMedia = new JTextField();
        tfMedia.setSize(50, 20);
        tfMedia.setLocation(10, 280);

        lFaltas = new JLabel("Faltas");
        lFaltas.setSize(50,20);
        lFaltas.setLocation(10, 310);
        tfFaltas = new JTextField();
        tfFaltas.setSize(50, 20);
        tfFaltas.setLocation(10,330);

        iButton = new JButton("Insert");
        iButton.setSize(100, 30);
        iButton.setLocation(265, 330);
        iButton.setBackground(Color.CYAN);
        iButton.addActionListener(eh);

        iPanel = new JPanel();
        iPanel.setLayout(null);
        iPanel.add(lMat);
        iPanel.add(tfMat);
        iPanel.add(lNome);
        iPanel.add(tfNome);
        iPanel.add(lNasc);
        iPanel.add(tfNasc);
        iPanel.add(lCurso);
        iPanel.add(listCurso);
        iPanel.add(lDisc);
        iPanel.add(listDisc);
        iPanel.add(lNP1);
        iPanel.add(tfNP1);
        iPanel.add(lNP2);
        iPanel.add(tfNP2);
        iPanel.add(lMedia);
        iPanel.add(tfMedia);
        iPanel.add(lFaltas);
        iPanel.add(tfFaltas);
        iPanel.add(iButton);

        String[] titles = {"Matricula", "Nome", "Nascimento", "Curso", "Disciplina"};

        dtm = new DefaultTableModel(titles, 0);

        this.accessDatabase();

        tb = new JTable(dtm);

        sp = new JScrollPane();
        sp.setViewportView(tb);

        rButton = new JButton("Refresh");
        rButton.setBackground(Color.CYAN);
        rButton.addActionListener(eh);

        tPanel = new JPanel();
        tPanel.add(sp);
        tPanel.add(rButton, BorderLayout.SOUTH);

        dPanel = new JPanel();
        dPanel.setLayout(null);

        cPanel = new JPanel(new CardLayout());
        cPanel.add(iPanel, "iPanel");
        cPanel.add(tPanel, "tPanel");
        cPanel.add(dPanel, "dPanel");

        this.add(cPanel);
        this.setVisible(true);
    }

    public void accessDatabase() {
        String query = "select A.Matricula, A.Nome, A.DataNasc, C.NomeCurso, D.NomeDisc\n" +
                "from Aluno A, Curso C, Disciplina D\n" +
                "where A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc\n" +
                "order by A.Matricula";

        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            if (dtm.getRowCount() > 0) {
                for (int i = dtm.getRowCount() - 1; i >= 0; i--) {
                    dtm.removeRow(i);
                }
            }
            while (result.next()) {
                int matricula = result.getInt("Matricula");
                String nome = result.getString("Nome");
                String nascimento = result.getString("DataNasc");
                String curso = result.getString("NomeCurso");
                String disciplina = result.getString("NomeDisc");
                String[] data = {Integer.toString(matricula), nome, nascimento, curso, disciplina};
                dtm.addRow(data);
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterDatabase() {
        String query = "update Aluno set " +
                "Matricula = " + tfMat.getText() + ", " +
                "Nome = '" + tfNome.getText() + "', " +
                "DataNasc = '" + tfNasc.getText() + "', " +
                "CodCurso = " + (listCurso.getSelectedIndex() + 1) + ", " +
                "CodDisc = " + (listDisc.getSelectedIndex() + 1) + ", " +
                "NP1 = " + tfNP1.getText() + ", " +
                "NP2 = " + tfNP2.getText() + ", " +
                "Media = " + tfMedia.getText() + ", " +
                "Faltas = " + tfFaltas.getText() + " " +
                "where Matricula = " + selected.get(0);

        try {
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void listDatabase() {
        String query = "select A.Matricula, A.Nome, A.DataNasc, C.NomeCurso, D.NomeDisc\n" +
                "from Aluno A, Curso C, Disciplina D\n" +
                "where A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc\n" +
                "order by A.Matricula";

        try {
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet result = preparedStatement.executeQuery();
            int x, y, w, h, i;
            x = y = 10;
            w = 75;
            h = 20;
            i = 0;
            selected = new ArrayList<>();
            matricula = new ArrayList<>();
            while (result.next()) {
                matricula.add(result.getString("Matricula"));
                JLabel info1 = new JLabel(result.getString("Matricula"));
                info1.setBounds(x, y, w - 55, h);
                JLabel info2 = new JLabel(result.getString("Nome"));
                info2.setBounds(x + w, y, w, h);
                JLabel info3 = new JLabel(result.getString("DataNasc"));
                info3.setBounds(2 * w + x, y, w, h);
                JLabel info4 = new JLabel(result.getString("NomeCurso"));
                info4.setBounds(250 + x, y, 3 * w, h);
                JLabel info5 = new JLabel(result.getString("NomeDisc"));
                info5.setBounds(425 + x, y, 2 * w, h);
                JCheckBox checkBox = new JCheckBox("Selected");
                checkBox.setBounds(540 + x, y, w + 30, h);
                int finalI = i;
                ItemListener checkBoxHandler = new ItemListener() {
                    @Override
                    public void itemStateChanged(ItemEvent e) {
                        if (e.getStateChange() == 1)
                            selected.add(matricula.get(finalI));
                        else
                            selected.remove(matricula.get(finalI));
                    }
                };
                checkBox.addItemListener(checkBoxHandler);
                dPanel.add(info1);
                dPanel.add(info2);
                dPanel.add(info3);
                dPanel.add(info4);
                dPanel.add(info5);
                dPanel.add(checkBox);
                y += 30;
                i++;
            }
            JButton dButton = new JButton("Delete");
            dButton.setBackground(Color.CYAN);
            dButton.setBounds(250, y, 100, 30);
            dButton.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    String message = "Deletar alunos selecionados?";
                    int confirm = JOptionPane.showConfirmDialog(null, message, "Delete confirmation", JOptionPane.YES_NO_OPTION);
                    if (confirm == 0) {
                        deleteDatabase();
                        dPanel.removeAll();
                        accessDatabase();
                        listDatabase();
                        dPanel.revalidate();
                        CardLayout card = (CardLayout) cPanel.getLayout();
                        card.show(cPanel, "tPanel");
                        card.show(cPanel, "dPanel");
                    }
                }
            });
            JButton aButton = new JButton("Edit");
            aButton.setBackground(Color.CYAN);
            aButton.setBounds(350, y, 100, 30);
            aButton.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    if (selected.size() != 1) {
                        String alert = "Você só pode alterar um aluno por vez";
                        JOptionPane.showMessageDialog(null, alert, "", JOptionPane.INFORMATION_MESSAGE);
                    }
                    else {
                        String query = "select * from Aluno where Matricula = " + selected.get(0);
                        try {
                            Connection connection = DriverManager.getConnection(url, login, password);
                            PreparedStatement preparedStatement = connection.prepareStatement(query);
                            ResultSet result = preparedStatement.executeQuery();
                            while (result.next()) {
                                tfMat.setText(result.getString("Matricula"));
                                tfNome.setText(result.getString("Nome"));
                                tfNasc.setText(result.getString("DataNasc"));
                                tfNP1.setText(result.getString("NP1"));
                                tfNP2.setText(result.getString("NP2"));
                                tfMedia.setText(result.getString("Media"));
                                tfFaltas.setText(result.getString("Faltas"));
                                listCurso.setSelectedIndex(result.getInt("CodCurso") - 1);
                                listDisc.setSelectedIndex(result.getInt("CodDisc") - 1);
                            }
                            iButton.setText("Alter");
                            CardLayout card = (CardLayout) cPanel.getLayout();
                            card.show(cPanel, "iPanel");
                        }
                        catch (SQLException exc) {
                            exc.printStackTrace();
                        }
                    }
                }
            });
            dPanel.add(dButton);
            dPanel.add(aButton);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDatabase() {
        if (selected.size() > 0) {
            for (int i = 0; i < selected.size(); i++) {
                String query = "delete from Aluno where Matricula = " + selected.get(i);
                try {
                    Connection connection = DriverManager.getConnection(url, login, password);
                    Statement statement = connection.createStatement();
                    statement.executeUpdate(query);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertDatabase() {
        String matricula = tfMat.getText();
        String nome = tfNome.getText();
        String nascimento = tfNasc.getText();
        String codcurso = Integer.toString(listCurso.getSelectedIndex() + 1);
        String coddisciplina = Integer.toString(listDisc.getSelectedIndex() + 1);
        String np1 = tfNP1.getText();
        String np2 = tfNP2.getText();
        String media = tfMedia.getText();
        String faltas = tfFaltas.getText();
        try {
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            String query = "insert into Aluno (Matricula, Nome, DataNasc, CodCurso, CodDisc, NP1, NP2, Media, Faltas) values ";
            query += "(" + matricula + ", '" + nome + "', '" + nascimento + "', " + codcurso + ", " + coddisciplina + ", " +
            np1 + ", " + np2 + ", " + media + ", " + faltas + ")";
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void databaseCurso() {
        try {
            Connection connection = DriverManager.getConnection(url, login, password);
            String query = "select NomeCurso from Curso";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
                dlmCurso.addElement(result.getString("NomeCurso"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void databaseDisc() {
        try {
            Connection connection = DriverManager.getConnection(url, login, password);
            String query = "select NomeDisc from Disciplina";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
                dlmDisc.addElement(result.getString("NomeDisc"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private class eventHandler implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            CardLayout card = (CardLayout) cPanel.getLayout();
            if (e.getSource().equals(insert)) {
                tfMat.setText("");
                tfNome.setText("");
                tfNasc.setText("");
                tfNP1.setText("");
                tfNP2.setText("");
                tfMedia.setText("");
                tfFaltas.setText("");
                listCurso.setSelectedIndex(0);
                listDisc.setSelectedIndex(0);
                iButton.setText("Insert");
                card.show(cPanel, "iPanel");
            }
            else if (e.getSource().equals(table)) {
                accessDatabase();
                card.show(cPanel, "tPanel");
            }
            else if (e.getSource().equals(edit)) {
                dPanel.removeAll();
                listDatabase();
                card.show(cPanel, "dPanel");
            }
            else if (e.getSource().equals(iButton)) {
                JButton pressed = (JButton) e.getSource();
                if (pressed.getText().equals("Insert"))
                    insertDatabase();
                else if (pressed.getText().equals("Alter")) {
                    String message = "Confirmar alteração?";
                    int option = JOptionPane.showConfirmDialog(null, message, "Confirm", JOptionPane.YES_NO_OPTION);
                    if (option == 0)
                        alterDatabase();
                }
            }
            else if (e.getSource().equals(rButton)) {
                accessDatabase();
            }
        }
    }

    public static void main(String[] args) {
        JDBCTable t = new JDBCTable();
    }
}
