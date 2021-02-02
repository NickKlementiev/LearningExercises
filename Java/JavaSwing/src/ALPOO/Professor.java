package ALPOO;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.Enumeration;

import javax.swing.*;

public class Professor {
    //--IdentProf, NomeProf, EndProf (rua/av, número, bairro, cidade, estado,
    //telfixo, celular), DataNasc, EspecProf (CheckBox com Digito, Informática, Matemática, Medicina, ...),
    //TituloProf (CheckBox com Bacharel, Especialista Lato Sensu, Mestrado, Doutorado).--//

    String driver, url, login, password;

    //--JFrame--//
    JFrame frame;

    //--Panel--//
    JPanel pRegister = new JPanel();
    JPanel cardPanel;

    //--Identificação do Professor--//
    JLabel idTeacher = new JLabel("Identificação do Professor");
    JTextField idTeacherTy = new JTextField();
    String selected;

    //Nome Professor//
    JLabel nameTeacher = new JLabel("Nome do Professor");
    JTextField nameTeacherTy = new JTextField();

    //Endereço//
    JLabel address = new JLabel("Rua");
    JTextField addressTy = new JTextField();

    JLabel number = new JLabel("Número");
    JTextField numberTy = new JTextField();

    JLabel neighborhood = new JLabel("Bairro");
    JTextField neighborhoodTy = new JTextField();

    JLabel city = new JLabel("Cidade");
    JTextField cityTy = new JTextField();

    JLabel state = new JLabel("Estado");
    JTextField stateTy = new JTextField();

    JLabel phone = new JLabel("Telefone");
    JTextField phoneTy = new JTextField();

    JLabel cellPhone = new JLabel("Celular");
    JTextField cellPhoneTy = new JTextField();

    JLabel bornDate = new JLabel("Nascimento");
    JLabel dateWay = new JLabel("(AAAA-MM-DD)");
    JTextField bornDateTy = new JTextField();

    //Especialidade do Professor//
    JLabel EspTeacher = new JLabel("Especialidades");
    ButtonGroup especGroup = new ButtonGroup();
    JCheckBox checkDigi = new JCheckBox("Dígito");
    JCheckBox checkInfo = new JCheckBox("Informática");
    JCheckBox checkMat = new JCheckBox("Matemática");
    JCheckBox checkMed = new JCheckBox("Medicina");
    JCheckBox checkEco = new JCheckBox("Economia");
    JCheckBox checkLog = new JCheckBox("Lógica");

    //Título do professor//
    JLabel TiTeacher = new JLabel("Título do Professor");
    ButtonGroup titleGroup = new ButtonGroup();
    JCheckBox checkBach = new JCheckBox("Bacharel");
    JCheckBox checkEsp = new JCheckBox("Especialista Lato Sensu");
    JCheckBox checkMes = new JCheckBox("Mestrado");
    JCheckBox checkDoc = new JCheckBox("Doutorado");

    //--Botão--//
    JButton send = new JButton("Enviar");

    //--Fonte--//
    Font ft1 = new Font("Arial", Font.BOLD, 14);

    public Professor() {
        pRegister.setLayout(null);

        //Identificação do Profesor//
        pRegister.add(idTeacher);
        idTeacher.setBounds(20, 0, 200, 30);
        idTeacher.setFont(ft1);
        pRegister.add(idTeacherTy);
        idTeacherTy.setBounds(20, 30, 200, 30);
        idTeacherTy.setFont(ft1);

        //Nome Professor//
        pRegister.add(nameTeacher);
        nameTeacher.setBounds(20, 60, 200, 30);
        nameTeacher.setFont(ft1);
        pRegister.add(nameTeacherTy);
        nameTeacherTy.setBounds(20, 90, 200, 30);
        nameTeacherTy.setFont(ft1);

        //Endereço//
        pRegister.add(address);
        address.setBounds(20, 120, 200, 30);
        address.setFont(ft1);
        pRegister.add(addressTy);
        addressTy.setBounds(20, 150, 200, 30);
        addressTy.setFont(ft1);

        pRegister.add(number);
        number.setBounds(20, 180, 200, 30);
        number.setFont(ft1);
        pRegister.add(numberTy);
        numberTy.setBounds(20, 210, 58, 30);
        numberTy.setFont(ft1);

        pRegister.add(neighborhood);
        neighborhood.setBounds(85, 180, 200, 30);
        neighborhood.setFont(ft1);
        pRegister.add(neighborhoodTy);
        neighborhoodTy.setBounds(85, 210, 135, 30);
        neighborhoodTy.setFont(ft1);

        pRegister.add(city);
        city.setBounds(20, 240, 200, 30);
        city.setFont(ft1);
        pRegister.add(cityTy);
        cityTy.setBounds(20, 270, 200, 30);
        cityTy.setFont(ft1);

        pRegister.add(state);
        state.setBounds(20, 300, 200, 30);
        state.setFont(ft1);
        pRegister.add(stateTy);
        stateTy.setBounds(20, 330, 200, 30);
        stateTy.setFont(ft1);

        pRegister.add(phone);
        phone.setBounds(20, 360, 200, 30);
        phone.setFont(ft1);
        pRegister.add(phoneTy);
        phoneTy.setBounds(20, 390, 200, 30);
        phoneTy.setFont(ft1);

        pRegister.add(cellPhone);
        cellPhone.setBounds(270, 0, 200, 30);
        cellPhone.setFont(ft1);
        pRegister.add(cellPhoneTy);
        cellPhoneTy.setBounds(270, 30, 200, 30);
        cellPhoneTy.setFont(ft1);

        //Data de Nascimento//
        pRegister.add(bornDate);
        bornDate.setBounds(270, 60, 200, 30);
        bornDate.setFont(ft1);
        pRegister.add(bornDateTy);
        bornDateTy.setBounds(270, 90, 100, 30);
        bornDateTy.setFont(ft1);
        pRegister.add(dateWay);
        dateWay.setBounds(380, 90, 150, 30);
        dateWay.setFont(ft1);

        //Especialidade do Professor//
        pRegister.add(EspTeacher);
        EspTeacher.setBounds(270, 120, 200, 30);
        EspTeacher.setFont(ft1);

        pRegister.add(checkDigi);
        checkDigi.setBounds(270, 150, 200, 20);
        checkDigi.setFont(ft1);

        pRegister.add(checkInfo);
        checkInfo.setBounds(270, 170, 200, 20);
        checkInfo.setFont(ft1);

        pRegister.add(checkMat);
        checkMat.setBounds(270, 190, 200, 20);
        checkMat.setFont(ft1);

        pRegister.add(checkMed);
        checkMed.setBounds(270, 210, 200, 20);
        checkMed.setFont(ft1);

        pRegister.add(checkEco);
        checkEco.setBounds(270, 230, 200, 20);
        checkEco.setFont(ft1);

        pRegister.add(checkLog);
        checkLog.setBounds(270, 250, 200, 20);
        checkLog.setFont(ft1);

        especGroup.add(checkDigi);
        especGroup.add(checkInfo);
        especGroup.add(checkMat);
        especGroup.add(checkMed);
        especGroup.add(checkEco);
        especGroup.add(checkLog);

        //Título do professor//
        pRegister.add(TiTeacher);
        TiTeacher.setBounds(270, 270, 200, 30);
        TiTeacher.setFont(ft1);

        pRegister.add(checkBach);
        checkBach.setBounds(270, 300, 200, 20);
        checkBach.setFont(ft1);

        pRegister.add(checkEsp);
        checkEsp.setBounds(270, 320, 200, 20);
        checkEsp.setFont(ft1);

        pRegister.add(checkMes);
        checkMes.setBounds(270, 340, 200, 20);
        checkMes.setFont(ft1);

        pRegister.add(checkDoc);
        checkDoc.setBounds(270, 360, 200, 20);
        checkDoc.setFont(ft1);

        titleGroup.add(checkBach);
        titleGroup.add(checkEsp);
        titleGroup.add(checkMes);
        titleGroup.add(checkDoc);

        //--Enviar--//
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
        send.setBounds(270, 420, 200, 30);
        send.setFont(ft1);

    }

    //--Função String que retorna o texto do botão pressionado do grupo de botões buttonGroup--//
    public String getCheckButton(ButtonGroup buttonGroup) {
        for (Enumeration<AbstractButton> buttons = buttonGroup.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.isSelected())
                return button.getText();
        }
        return null;
    }

    //--Função void que seleciona o botão de acordo com a String value passada--//
    public void setCheckButton(ButtonGroup buttonGroup, String value) {
        for (Enumeration<AbstractButton> buttons = buttonGroup.getElements(); buttons.hasMoreElements();) {
            AbstractButton button = buttons.nextElement();
            if (button.getText().equals(value))
                button.setSelected(true);
        }
    }

    //--Inserção de dados no banco de dados--//
    public void register() {
        String queryProf = "insert into Professor values " +
                "(" + idTeacherTy.getText() + ", " +
                "'" + nameTeacherTy.getText() + "', " +
                "'" + bornDateTy.getText() + "', " +
                "'" + getCheckButton(especGroup) + "', " +
                "'" + getCheckButton(titleGroup) + "')";
        String queryAddr = "insert into EndProf values " +
                "(" + idTeacherTy.getText() + ", " +
                "'" + addressTy.getText() + "', " +
                numberTy.getText() + ", " +
                "'" + neighborhoodTy.getText() + "', " +
                "'" + cityTy.getText() + "', " +
                "'" + stateTy.getText() + "', " +
                "'" + phoneTy.getText() + "', " +
                "'" + cellPhoneTy.getText() + "')";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            statement.executeUpdate(queryProf);
            statement.executeUpdate(queryAddr);
            String message = "Dados atualizados";
            JOptionPane.showMessageDialog(null, message, "Aviso", JOptionPane.INFORMATION_MESSAGE);
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Função void que atualiza os dados no banco de dados--//
    public void updateDatabase(String identidade) {
        String queryProf = "update Professor set " +
                "IdentProf = " + idTeacherTy.getText() + ", " +
                "NomeProf = '" + nameTeacherTy.getText() + "', " +
                "DataNasc = '" + bornDateTy.getText() + "', " +
                "EspecProf = '" + getCheckButton(especGroup) + "', " +
                "TituloProf = '" + getCheckButton(titleGroup) + "' " +
                "where IdentProf = " + identidade;
        String queryEnd = "update EndProf set " +
                "IdentProf = " + idTeacherTy.getText() + ", " +
                "Rua = '" + addressTy.getText() + "', " +
                "Numero = " + numberTy.getText() + ", " +
                "Bairro = '" + neighborhoodTy.getText() + "', " +
                "Cidade = '" + cityTy.getText() + "', " +
                "Estado = '" + stateTy.getText() + "', " +
                "Telfixo = '" + phoneTy.getText() + "', " +
                "Celular = '" + cellPhoneTy.getText() + "' " +
                "where IdentProf = " + identidade;
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            Statement statement = connection.createStatement();
            statement.executeUpdate(queryProf);
            statement.executeUpdate(queryEnd);
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Função void que prepara o painel de cadastro para a alteração de dados--//
    public void update(Catalogo.CustomTableModel model) {
        CardLayout card = (CardLayout) cardPanel.getLayout();
        selected = (String) model.getValueAt(model.getSelectedRow().get(0), 1);
        String query = "select P.IdentProf, P.NomeProf, P.DataNasc, P.EspecProf, P.TituloProf, E.Rua, E.Numero, E.Bairro, E.Cidade," +
                "E.Estado, E.Telfixo, E.Celular from Professor P, EndProf E where " +
                "P.IdentProf = " + selected + " and P.IdentProf = E.IdentProf";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, login, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                idTeacherTy.setText(result.getString("IdentProf"));
                nameTeacherTy.setText(result.getString("NomeProf"));
                bornDateTy.setText(result.getString("DataNasc"));
                setCheckButton(especGroup, result.getString("EspecProf"));
                setCheckButton(titleGroup, result.getString("TituloProf"));
                addressTy.setText(result.getString("Rua"));
                numberTy.setText(result.getString("Numero"));
                neighborhoodTy.setText(result.getString("Bairro"));
                cityTy.setText(result.getString("Cidade"));
                stateTy.setText(result.getString("Estado"));
                phoneTy.setText(result.getString("Telfixo"));
                cellPhoneTy.setText(result.getString("Celular"));
                send.setText("Alterar");
                frame.setSize(500, 620);
                card.show(cardPanel, "pCProf");
            }
        }
        catch (SQLException | ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    //--Configuração inicial dos textos e dos botões--//
    public void defaultConfig() {
        idTeacherTy.setText("");
        nameTeacherTy.setText("");
        addressTy.setText("");
        numberTy.setText("");
        neighborhoodTy.setText("");
        cityTy.setText("");
        stateTy.setText("");
        phoneTy.setText("");
        cellPhoneTy.setText("");
        bornDateTy.setText("");
        send.setText("Enviar");
    }

}
