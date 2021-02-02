package ALPOO;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.*;
import java.util.Enumeration;

import javax.swing.*;

public class Curso {
//-- Curso: CodCurso, NomeCurso (List com Administração de Empresas, BioMedicina,
//Ciências Biológicas, Ciencias da Computação, Direito, Educação Física, Farmacologia,
//Rede de Computadores, Sistemas de Informações,...), TipoCurso (RadioButton com Bacharel, Gestão, outros),
//CargaHorária, CodInstituto.--//

    //--JDBC--//
    String driver, url, login, password;

    //--Frame--//
    JFrame frame;

    //--Panel--//
    JPanel pRegister = new JPanel();
    JPanel cardPanel;

    //--Código do curso--//
    JLabel labCod = new JLabel ("Código do Curso: ");
    JTextField texCod = new JTextField ();
    String selected;

    //--Nome do Curso--//
    JLabel labNome = new JLabel ("Nome do Curso: ");
    JTextField texNome = new JTextField ();

    //--RadioButton do tipo de curso--//
    JLabel labTipo = new JLabel ("Tipo de Curso: ");
    ButtonGroup tipoCurso = new ButtonGroup ();
    JRadioButton radioButton1 = new JRadioButton ("Bacharelado");
    JRadioButton radioButton2 = new JRadioButton ("Gestão");
    JRadioButton radioButton3 = new JRadioButton ("Mestrado");
    JRadioButton radioButton4 = new JRadioButton ("Doutorado");
    JRadioButton radioButton5 = new JRadioButton ("Pós-graduação");
    JRadioButton radioButton6 = new JRadioButton ("Outro");

    //--Carga Horária--//
    JLabel labCarga = new JLabel ("Carga Horária: ");
    JTextField texCarga = new JTextField ();

    //--Codigo do Instituto--//
    JLabel labInst = new JLabel ("Código do Instituto: ");
    JTextField texInst = new JTextField ();

    //--Outra especialidade--//
    JTextField texOther = new JTextField ();

    //--Botão Enviar--//
    JButton botSend = new JButton ("Enviar");

    //--Fonte--//
    Font ft1 = new Font("Arial", Font.BOLD, 14);

    public Curso() {
        pRegister.setLayout(null);

        //--Código do Curso--//
        pRegister.add(labCod);
        labCod.setBounds(20, 0, 200, 30);
        labCod.setFont(ft1);
        pRegister.add(texCod);
        texCod.setBounds(20, 30, 220, 30);

        //--ComboBox nome do Curso--//
        pRegister.add(labNome);
        labNome.setBounds(20, 70, 200, 30);
        labNome.setFont(ft1);

        //--TextField com nome do curso--//
        texNome.setBounds(20, 100, 220, 30);
        pRegister.add(texNome);

        //--RadioButtons--//
        pRegister.add(labTipo);
        labTipo.setBounds(305, 0, 109, 30);
        labTipo.setFont(ft1);
        tipoCurso.add(radioButton1);
        tipoCurso.add(radioButton2);
        tipoCurso.add(radioButton3);
        tipoCurso.add(radioButton4);
        tipoCurso.add(radioButton5);
        tipoCurso.add(radioButton6);
        radioButton1.setBounds(305, 30, 129, 23);
        radioButton1.setFont(ft1);
        radioButton2.setBounds(305, 60, 109, 23);
        radioButton2.setFont(ft1);
        radioButton3.setBounds(305, 90, 109, 23);
        radioButton3.setFont(ft1);
        radioButton4.setBounds(305, 120, 109, 23);
        radioButton4.setFont(ft1);
        radioButton5.setBounds(305, 150, 200, 23);
        radioButton5.setFont(ft1);
        radioButton6.setBounds(305, 180, 109, 23);
        radioButton6.setFont(ft1);
        //--Ao selecionar a opção "Outro", aparecerá um TextField para inserção de dados--//
        radioButton6.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent itemEvent) {
                texOther.setVisible(!texOther.isVisible());
            }
        });
        texOther.setBounds(305, 210, 180, 30);
        texOther.setVisible(false);
        pRegister.add(radioButton1);
        pRegister.add(radioButton2);
        pRegister.add(radioButton3);
        pRegister.add(radioButton4);
        pRegister.add(radioButton5);
        pRegister.add(radioButton6);
        pRegister.add(texOther);

        //--Carga Horária--//
        pRegister.add(labCarga);
        labCarga.setBounds(20, 140, 200, 30);
        labCarga.setFont(ft1);
        pRegister.add(texCarga);
        texCarga.setBounds(20, 170, 220, 30);

        //--Código do Instituto--//
        pRegister.add(labInst);
        labInst.setBounds(20, 210, 200, 30);
        labInst.setFont(ft1);
        pRegister.add(texInst);
        texInst.setBounds(20,240, 220, 30);

        //--Botão Enviar--//
        pRegister.add(botSend);
        botSend.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JButton button = (JButton) e.getSource();
                if (button.getText().equals("Enviar")) {
                    register();
                }
                else if (button.getText().equals("Alterar")) {
                    String message = "Confirmar mudança de dados?";
                    int choice = JOptionPane.showConfirmDialog(null, message, "Confirmação", JOptionPane.YES_NO_OPTION);
                    if (choice == 0)
                        updateDatabase(selected);
                }
            }
        });
        botSend.setBounds(20, 420, 200, 30);
        botSend.setFont(ft1);

    }
    //--Adquirir o valor dos RadioButtons (caso seja um botão com valor definido, pegar o valor definido,--//
    //--se for o botão "Outro", pegar o valor inserido no TextField abaixo dele--//
    public String getRadioValue() {
        for (Enumeration<AbstractButton> buttons = tipoCurso.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.isSelected()) {
                if (button.equals(radioButton6))
                    return texOther.getText();
                else
                    return button.getText();
            }
        }
        return null;
    }
    //--Função void que envia a inserção para o banco de dados--//
    public void register() {
        String query = "insert into Curso values " +
                "(" + texCod.getText() + ", " +
                "'" + texNome.getText() + "', " +
                "'" + getRadioValue() + "', " +
                texCarga.getText() + ", " +
                texInst.getText() + ")";
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
    //--Função que retorna um String--//
    public String getPressedRadio() {
        for (Enumeration<AbstractButton> buttons = tipoCurso.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.isSelected())
                return button.getText();
        }
        return null;
    }
    //--Função void que seleciona o RadioButton pressionado de acordo com a String "value" passada a ela--//
    //--Neste caso, o TipoCurso--//
    public void setPressedRadio(String value) {
        for (Enumeration<AbstractButton> buttons = tipoCurso.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.getText().equals(value)) {
                button.setSelected(true);
                break;
            }
            else if (button.getText().equals("Outro")) {
                button.setSelected(true);
                texOther.setText(value);
                texOther.setVisible(true);
            }
        }
    }
    //--Alterar dados da tabela no banco de dados--//
    public void updateDatabase(String codigo) {
        String query = "update Curso set " +
                "CodCurso = " + texCod.getText() + ", " +
                "NomeCurso = '" + texNome.getText() + "', " +
                "TipoCurso = '" + getPressedRadio() + "', " +
                "CargaHoraria = " + texCarga.getText() + ", " +
                "CodInstituto = " + texInst.getText() +
                " where CodCurso = " + codigo;
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
    //--Função void que prepara o painel de cadastro para mudança de dados--//
    public void update(Catalogo.CustomTableModel model) {
        CardLayout card = (CardLayout) cardPanel.getLayout();
        selected = (String) model.getValueAt(model.getSelectedRow().get(0), 1);
        String query = "select CodCurso, NomeCurso, TipoCurso, CargaHoraria, CodInstituto from Curso where CodCurso = " + selected;
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                texCod.setText(result.getString("CodCurso"));
                texNome.setText(result.getString("NomeCurso"));
                setPressedRadio(result.getString("TipoCurso"));
                texCarga.setText(result.getString("CargaHoraria"));
                texInst.setText(result.getString("CodInstituto"));
                botSend.setText("Alterar");
                frame.setSize(500, 620);
                card.show(cardPanel, "pCCurso");
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }
    //--Configuração inicial dos valores de texto e dos botões--//
    public void defaultConfig() {
        texCod.setText("");
        texNome.setText("");
        texCarga.setText("");
        texInst.setText("");
        radioButton1.setSelected(false);
        radioButton2.setSelected(false);
        radioButton3.setSelected(false);
        radioButton4.setSelected(false);
        radioButton5.setSelected(false);
        radioButton6.setSelected(false);
        texOther.setText("");
        botSend.setText("Enviar");
    }

}
