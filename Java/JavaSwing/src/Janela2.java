import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Janela2 extends JFrame implements ActionListener {

    JTextField tf1 = new JTextField();
    JButton b1 = new JButton("Clique aqui!");
    JButton b2 = new JButton("Clique aqui!!");

    @Override
    public void actionPerformed(ActionEvent e) {
        Object cond = e.getSource();
        if (e.getSource() == b1 || cond.equals(b1))
            System.out.println("Oi");
        else if (e.getSource() == b2 || cond.equals(b2))
            System.out.println("Tchau");
    }

    public Janela2() {
        this.setBounds(100, 100, 400, 400);
        this.setLayout(null);

        tf1.setBounds(20, 20, 200, 25);
        b1.setBounds(20, 50, 150, 25);
        b2.setBounds(20, 80, 150, 25);

        b1.addActionListener(this);
        b2.addActionListener(this);
        this.add(tf1);
        this.add(b1);
        this.add(b2);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setVisible(true);
    }


    public static void main(String[] args) {
        Janela2 j = new Janela2();
    }
}
