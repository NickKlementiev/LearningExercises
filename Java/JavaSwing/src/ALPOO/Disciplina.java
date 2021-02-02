package ALPOO;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.Enumeration;

import javax.swing.*;

public class Disciplina {
    String driver, url, login, password;

    JFrame frame;

    JPanel pRegister = new JPanel();
    JPanel cardPanel;

    JLabel codDisc = new JLabel("Código da Disciplina");
    JTextField codDiscTy = new JTextField();
    String selected;

    JLabel nameDisc = new JLabel("Nome da Disciplina");
    JTextField nameDiscTy = new JTextField();

    JLabel hours = new JLabel("Carga Horária");
    JLabel hour = new JLabel("Horas");
    JTextField hoursTy = new JTextField();

    JLabel textClassWeek = new JLabel("Aulas da Semana");
    ButtonGroup grpclassweek = new ButtonGroup();
    JRadioButton one, two,
            three, four, five, six;

    JButton send = new JButton("Enviar");
    Font ft1 = new Font("Arial", Font.BOLD, 14);

    JLabel prof = new JLabel("Professor responsável");
    JLabel course = new JLabel("Curso pertencente");

    JComboBox<String> cbProf, cbCourse;
    DefaultComboBoxModel<String> dcbmProf, dcbmCourse;

    public Disciplina() {
        pRegister.setLayout(null);


        //--Código da Disciplina--//
        pRegister.add(codDisc);
        pRegister.add(codDiscTy);
        codDisc.setBounds(20,0,200,40);
        codDisc.setFont(ft1);
        codDiscTy.setBounds(20,40,200,30);

        //--Nome da Disciplina--//
        pRegister.add(nameDisc);
        pRegister.add(nameDiscTy);
        nameDisc.setBounds(20,60,200,40);
        nameDisc.setFont(ft1);
        nameDiscTy.setBounds(20,100,200,30);

        //-- Carga Horária--//
        pRegister.add(hours);
        pRegister.add(hoursTy);
        pRegister.add(hour);
        hours.setBounds(20,120,200,40);
        hours.setFont(ft1);
        hoursTy.setBounds(20,160,60,30);
        hour.setFont(ft1);
        hour.setBounds(90,160,200,20);

        //--RadioButton --//
        one = new JRadioButton("1",true);
        two = new JRadioButton("2",false);
        three = new JRadioButton("3",false);
        four = new JRadioButton("4",false);
        five = new JRadioButton("5",false);
        six = new JRadioButton("6",false);
        grpclassweek.add(one);
        grpclassweek.add(two);
        grpclassweek.add(three);
        grpclassweek.add(four);
        grpclassweek.add(five);
        grpclassweek.add(six);

        pRegister.add(textClassWeek);
        textClassWeek.setBounds(20,190,200,40);
        textClassWeek.setFont(ft1);
        pRegister.add(one);
        one.setFont(ft1);
        one.setBounds(20,220,200,40);
        pRegister.add(two);
        two.setFont(ft1);
        two.setBounds(20,250,200,40);
        pRegister.add(three);
        three.setFont(ft1);
        three.setBounds(20,280,200,40);
        pRegister.add(four);
        four.setFont(ft1);
        four.setBounds(20,310,200,40);
        pRegister.add(five);
        five.setFont(ft1);
        five.setBounds(20,340,200,40);
        pRegister.add(six);
        six.setFont(ft1);
        six.setBounds(20,370,200,40);

        dcbmProf = new DefaultComboBoxModel<>();
        dcbmCourse = new DefaultComboBoxModel<>();

        //--Lista de Professores--//
        prof.setBounds(270, 0, 200, 40);
        prof.setFont(ft1);
        cbProf = new JComboBox<>(dcbmProf);
        cbProf.setBounds(270, 40, 200, 30);
        cbProf.setFont(ft1);
        cbProf.setBackground(Color.WHITE);
        pRegister.add(prof);
        pRegister.add(cbProf);


        //--Lista de Cursos--//
        course.setBounds(270, 70, 200, 40);
        course.setFont(ft1);
        cbCourse = new JComboBox<>(dcbmCourse);
        cbCourse.setBounds(270, 110, 200, 30);
        cbCourse.setFont(ft1);
        cbCourse.setBackground(Color.WHITE);
        pRegister.add(course);
        pRegister.add(cbCourse);

        //--Botão de envio--//
        pRegister.add(send);
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
        send.setFont(ft1);
        send.setBounds(20,420,200,30);
    }

    //--Extrai o código que está na ComboBox passada--//
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

    //--Função que retorna o texto do RadioButton selecionado--//
    public String getPressedRadio() {
        for (Enumeration<AbstractButton> buttons = grpclassweek.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.isSelected())
                return button.getText();
        }
        return null;
    }

    //--Função que seleciona o RadioButton conforme o valor String em "value"--//
    public void setPressedRadio(String value) {
        for (Enumeration<AbstractButton> buttons = grpclassweek.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.getText().equals(value))
                button.setSelected(true);
        }
    }

    //--Função void que envia a inserção para o banco de dados--//
    public void register() {
        String query = "insert into Disciplina values " +
                "(" + codDiscTy.getText() + ", " +
                "'" + nameDiscTy.getText() + "', " +
                hoursTy.getText() + ", " +
                getPressedRadio() + ", " +
                getCod(cbProf) + ", " +
                getCod(cbCourse) + ")";
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

    //--Função void que acessa os professores e os cursos a serem mostrados nas ComboBox de Professor e Curso--//
    public void accessDatabase() {
        String queryProf = "select IdentProf, NomeProf from Professor order by IdentProf";
        String queryCurso = "select CodCurso, NomeCurso from Curso order by CodCurso";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(queryProf);
            ResultSet result = statement.executeQuery();
            dcbmProf.removeAllElements();
            dcbmCourse.removeAllElements();
            while (result.next()) {
                String professor = result.getString("IdentProf") + ": " + result.getString("NomeProf");
                dcbmProf.addElement(professor);
            }
            statement = connection.prepareStatement(queryCurso);
            result = statement.executeQuery();
            while (result.next()) {
                String curso = result.getString("CodCurso") + ": " + result.getString("NomeCurso");
                dcbmCourse.addElement(curso);
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }
    //--Função void que realiza a mudança no banco de dados--//
    public void updateDatabase(String codigo) {
        String query = "update Disciplina set " +
                "CodDisc = " + codDiscTy.getText() + ", " +
                "NomeDisc = '" + nameDiscTy.getText() + "', " +
                "CargaHoraria = " + hoursTy.getText() + ", " +
                "AulasSemana = " + getPressedRadio() + ", " +
                "IdentProf = " + getCod(cbProf) + ", " +
                "CodCurso = " + getCod(cbCourse) +
                " where CodDisc = " + selected;
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
    //--Função void que prepara o painel de cadastro para a alteração de dados--//
    public void update(Catalogo.CustomTableModel model) {
        CardLayout card = (CardLayout) cardPanel.getLayout();
        selected = (String) model.getValueAt(model.getSelectedRow().get(0), 1);
        String query = "select D.CodDisc, D.NomeDisc, D.CargaHoraria, D.AulasSemana, P.IdentProf, P.NomeProf, C.CodCurso, C.NomeCurso " +
                "from Disciplina D, Professor P, Curso C " +
                "where D.CodDisc = " + selected + " and D.IdentProf = P.IdentProf and D.CodCurso = C.CodCurso";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                codDiscTy.setText(result.getString("CodDisc"));
                nameDiscTy.setText(result.getString("NomeDisc"));
                hoursTy.setText(result.getString("CargaHoraria"));
                setPressedRadio(result.getString("AulasSemana"));
                cbProf.setSelectedItem(result.getString("IdentProf") + ": " + result.getString("NomeProf"));
                cbCourse.setSelectedItem(result.getString("CodCurso") + ": " + result.getString("NomeCurso"));
                send.setText("Alterar");
                frame.setSize(500, 620);
                card.show(cardPanel, "pCDisc");
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Configuração inicial dos textos e dos botões--//
    public void defaultConfig() {
        codDiscTy.setText("");
        nameDiscTy.setText("");
        hoursTy.setText("");
        one.setSelected(true);
        cbProf.setSelectedIndex(0);
        cbCourse.setSelectedIndex(0);
        send.setText("Enviar");
    }

}
