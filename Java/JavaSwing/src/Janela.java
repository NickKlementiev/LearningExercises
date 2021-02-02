import javax.swing.*;
import java.awt.event.*;

// implementar evento (listener) - ActionListener evento de botão
// implementar o método actionPerformed(...) automaticamente
// fazer com que o componente seja ouvido: componetne.addActionListener(this)
// fazer a lógica de ação no actionPerformed

public class Janela extends JFrame implements ActionListener {
    JLabel labRotulo = new JLabel("Favor preencher o campo...");
    JTextField texCampo = new JTextField();
    JButton botOk = new JButton("Ok");
    JButton botCancel = new JButton("Cancel");

    public void montarTela() {
        this.setBounds(200, 200, 400, 400);
        this.setTitle("Janela Experimental");
        this.setLayout(null);

        labRotulo.setBounds(20, 20, 200, 25);
        texCampo.setBounds(20, 45, 200, 25);
        botOk.setBounds(20, 70, 80, 25);
        botCancel.setBounds(100, 70, 80, 25);
        botOk.addActionListener(this);
        botCancel.addActionListener(this);

        this.add(labRotulo);
        this.add(texCampo);
        this.add(botOk);
        this.add(botCancel);

        this.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println("Apertou alguma coisa...");

        Object obj = e.getSource();

        if (obj.equals(botOk))
            System.out.println("Ok!");
        else if (obj.equals(botCancel))
            System.out.println("Cancelando!");
    }

    public Janela() {
        this.montarTela();
    }

    public static void main(String[] args) {
        Janela j = new Janela();
    }
}
