package ALPOO;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

import javax.swing.*;
import javax.xml.transform.Result;

public class Aluno {
//--Aluno: Matricula, Nome, DataNasc. CodCurso, NomeCurso,--//
    //(List com CodDisciplina, NomeDisciplina), Nota NP1, Nota NP2, Média, Faltas.--//

    //--Importação do JFrame principal--//
    JFrame frame;

    //--Informações de Banco de Dados--//
    String driver, url, login, password;

    //--Panel e importação do cardPanel principal--//
    JPanel pRegister = new JPanel();
    JPanel cardPanel;

    //--Matrícula (selected é a variável a ser utilizada nos métodos update e updateDatabase)--//
    JLabel registration = new JLabel("Matrícula do Aluno");
    JTextField registrationTy = new JTextField();
    String selected;

    //--Nome--//
    JLabel name = new JLabel("Nome Aluno");
    JTextField nameTy = new JTextField();

    //--Data de Nascimento--//
    JLabel bornDate = new JLabel("Data de Nascimento");
    JLabel dateWay = new JLabel("(AAAA-MM-DD)");
    JTextField bornDateTy = new JTextField();

    //--Lista de Curso--//
    JLabel listCourse = new JLabel("Curso");
    JComboBox<String> cbCourse;
    DefaultComboBoxModel<String> dcbmCourse;

    //--Lista de Disciplina--//
    JLabel listSub = new JLabel("Disciplinas");
    JComboBox<String> cbSubject;
    DefaultComboBoxModel<String> dcbmSubject;

    //--Notas--//
    JLabel grade = new JLabel("Notas");

    //--Nota NP1--//
    JLabel np1 = new JLabel("Nota NP1");
    JTextField np1Ty = new JTextField();

    //--Nota NP2--//
    JLabel np2 = new JLabel("Nota NP2");
    JTextField np2Ty = new JTextField();

    //--Média--//
    JLabel average = new JLabel("Média");
    JTextField averageTy = new JTextField();

    //--Faltas--//
    JLabel absence = new JLabel("Faltas");
    JTextField absenceTy = new JTextField();

    //--Botão de Enviar--//
    JButton send = new JButton("Enviar");

    //--Fonte--//
    Font ft1 = new Font("Arial", Font.BOLD, 14);

    public Aluno() {
        pRegister.setLayout(null);

        //--Matricula--//
        pRegister.add(registration);
        registration.setBounds(20, 0, 200, 30);
        registration.setFont(ft1);
        pRegister.add(registrationTy);
        registrationTy.setBounds(20, 30, 200, 30);

        //--Nome--//
        pRegister.add(name);
        name.setBounds(20, 60, 200, 30);
        name.setFont(ft1);
        pRegister.add(nameTy);
        nameTy.setBounds(20, 90, 200, 30);

        //--Data de Nascimento--//
        pRegister.add(bornDate);
        bornDate.setBounds(20, 120, 200, 30);
        bornDate.setFont(ft1);
        pRegister.add(dateWay);
        dateWay.setBounds(110, 150, 150, 30);
        dateWay.setFont(ft1);
        pRegister.add(bornDateTy);
        bornDateTy.setBounds(20, 150, 80, 30);

        //--Lista de Curso (ComboBox)--//
        pRegister.add(listCourse);
        listCourse.setBounds(20, 180, 200, 30);
        listCourse.setFont(ft1);

        dcbmCourse = new DefaultComboBoxModel<>();

        //--Lista de Disciplina (ComboBox)--//
        pRegister.add(listSub);
        listSub.setBounds(20, 240, 200, 30);
        listSub.setFont(ft1);

        dcbmSubject = new DefaultComboBoxModel<>();

        cbCourse = new JComboBox<>(dcbmCourse);
        pRegister.add(cbCourse);
        cbCourse.setBounds(20, 210, 200, 30);
        cbCourse.setFont(ft1);
        cbCourse.setBackground(Color.WHITE);
        pRegister.add(cbCourse);

        cbSubject = new JComboBox<>(dcbmSubject);
        cbSubject.setBounds(20, 270, 200, 30);
        cbSubject.setFont(ft1);
        cbSubject.setBackground(Color.WHITE);
        pRegister.add(cbSubject);

        //--Notas--//
        pRegister.add(grade);
        grade.setBounds(270, 0, 200, 30);
        grade.setFont(ft1);

        //--Notas NP1--//
        pRegister.add(np1);
        np1.setBounds(270, 30, 200, 30);
        np1.setFont(ft1);
        pRegister.add(np1Ty);
        np1Ty.setBounds(270, 60, 200, 30);

        //--Notas NP2--//
        pRegister.add(np2);
        np2.setBounds(270, 90, 200, 30);
        np2.setFont(ft1);
        pRegister.add(np2Ty);
        np2Ty.setBounds(270, 120, 200, 30);

        //--Média--//
        pRegister.add(average);
        average.setBounds(270, 150, 200, 30);
        average.setFont(ft1);
        pRegister.add(averageTy);
        averageTy.setBounds(270, 180, 200, 30);

        //--Faltas--//
        pRegister.add(absence);
        absence.setBounds(270, 210, 200, 30);
        absence.setFont(ft1);
        pRegister.add(absenceTy);
        absenceTy.setBounds(270, 240, 200, 30);

        //--Enviar--//
        send.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JButton pressed = (JButton) e.getSource();
                if (pressed.getText().equals("Enviar")) {
                    register();
                }
                else if (pressed.getText().equals("Alterar")) {
                    String message = "Confirmar mudança de dados?";
                    int choice = JOptionPane.showConfirmDialog(null, message, "Confirmação", JOptionPane.YES_NO_OPTION);
                    if (choice == 0)
                        updateDatabase(selected);
                }
            }
        });
        pRegister.add(send);
        send.setBounds(270, 290, 200, 30);
        send.setFont(ft1);
    }

    //--Função que adquire o código de um elemento de uma JComboBox--//
    //--Por exemplo: "1: Ciência da Computação", returnar apenas o valor "1"--//
    public String getCod(JComboBox<String> cb) {
        int i;
        String item;
        String cod = "";
        item = cb.getSelectedItem().toString();
        for (i = 0; i < item.length(); i++) {
            if (Character.isDigit(item.charAt(i))) {
                cod += item.charAt(i);
            }
        }
        return cod;
    }

    //--Função void que envia a inserção para o banco de dados--//
    public void register() {
        String query = "insert into Aluno values " +
                "(" + registrationTy.getText() + ", " +
                "'" + nameTy.getText() + "', " +
                "'" + bornDateTy.getText() + "', " +
                getCod(cbCourse) + ", " +
                getCod(cbSubject) + ", " +
                np1Ty.getText() + ", " +
                np2Ty.getText() + ", " +
                averageTy.getText() + ", " +
                absenceTy.getText() + ")";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            String message = "Dados atualizados";
            JOptionPane.showMessageDialog(null, message, "Aviso", JOptionPane.INFORMATION_MESSAGE);
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }

    }

    //--Função void que acessa os cursos e as disciplinas a serem mostradas nas ComboBox de Curso e Disciplina--//
    public void accessDatabase() {
        try {
            String queryCurso = "select CodCurso, NomeCurso from Curso order by CodCurso";
            String queryDisc = "select CodDisc, NomeDisc from Disciplina order by CodDisc";
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(queryCurso);
            ResultSet result = statement.executeQuery();
            dcbmCourse.removeAllElements();
            dcbmSubject.removeAllElements();
            while (result.next()) {
                String curso = result.getString("CodCurso") + ": " + result.getString("NomeCurso");
                dcbmCourse.addElement(curso);
            }
            statement = connection.prepareStatement(queryDisc);
            result = statement.executeQuery();
            while (result.next()) {
                String disciplina = result.getString("CodDisc") + ": " + result.getString("NomeDisc");
                dcbmSubject.addElement(disciplina);
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Função void que altera os dados do banco de dados--//
    public void updateDatabase(String matricula) {
        String query = "update Aluno set " +
                "Matricula = " + registrationTy.getText() + ", " +
                "Nome = '" + nameTy.getText() + "', " +
                "DataNasc = '" + bornDateTy.getText() + "', " +
                "CodCurso = " + getCod(cbCourse) + ", " +
                "CodDisc = " + getCod(cbSubject) + ", " +
                "NP1 = " + np1Ty.getText() + ", " +
                "NP2 = " + np2Ty.getText() + ", " +
                "Media = " + averageTy.getText() + ", " +
                "Faltas = " + absenceTy.getText() + " " +
                "where Matricula = " + matricula;
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Função void que extrai as informações do aluno selecionado e insere como dados no painel de inserção--//
    public void update(Catalogo.CustomTableModel model) {
        CardLayout card = (CardLayout) cardPanel.getLayout();
        selected = (String) model.getValueAt(model.getSelectedRow().get(0), 1);
        String query = "select A.Matricula, A.Nome, A.DataNasc, A.CodCurso, C.NomeCurso, A.CodDisc, D.NomeDisc, NP1, NP2, Media, Faltas " +
                "from Aluno A, Disciplina D, Curso C where A.Matricula = " + selected + " and A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                registrationTy.setText(result.getString("Matricula"));
                nameTy.setText(result.getString("Nome"));
                bornDateTy.setText(result.getString("DataNasc"));
                cbCourse.setSelectedItem(result.getString("CodCurso") + ": " + result.getString("NomeCurso"));
                cbSubject.setSelectedItem(result.getString("CodDisc") + ": " + result.getString("NomeDisc"));
                np1Ty.setText(result.getString("NP1"));
                np2Ty.setText(result.getString("NP2"));
                averageTy.setText(result.getString("Media"));
                absenceTy.setText(result.getString("Faltas"));
                send.setText("Alterar");
                frame.setSize(500, 620);
                card.show(cardPanel, "pCAluno");
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Configuração inicial do painel de inserção (todos os textos e seleções iniciais)--//
    public void defaultConfig() {
        registrationTy.setText("");
        nameTy.setText("");
        bornDateTy.setText("");
        cbCourse.setSelectedIndex(0);
        cbSubject.setSelectedIndex(0);
        np1Ty.setText("");
        np2Ty.setText("");
        averageTy.setText("");
        absenceTy.setText("");
        send.setText("Enviar");
    }

}
