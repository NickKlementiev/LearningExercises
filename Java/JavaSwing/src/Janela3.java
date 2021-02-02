import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Janela3 extends JFrame {

    JTextField tf1 = new JTextField();
    JButton b1 = new JButton("Clique aqui!");
    JButton b2 = new JButton("Clique aqui!!");

    public Janela3() {
        this.setBounds(100, 100, 400, 400);
        this.setLayout(null);

        tf1.setBounds(20, 20, 200, 25);
        b1.setBounds(20, 50, 150, 25);
        b2.setBounds(20, 80, 150, 25);

        b1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println("Oi");
                tf1.setText("Veras");
            }
        });
        b2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println("Tchau");
            }
        });
        this.add(tf1);
        this.add(b1);
        this.add(b2);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setVisible(true);
    }


    public static void main(String[] args) {
        Janela3 j = new Janela3();
    }
}
