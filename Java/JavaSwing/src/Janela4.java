import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Janela4 extends JFrame {

    JTextField tf1 = new JTextField();
    JButton bC = new JButton("C");
    JButton b1 = new JButton("1");
    JButton b2 = new JButton("2");
    JButton bIg = new JButton("=");
    JPanel p1 = new JPanel();

    public Janela4() {
        this.setTitle("Calculator");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setBounds(100, 100, 400, 400);

        p1.setLayout(new GridLayout(1, 3));
        p1.add(bC);
        p1.add(b1);
        p1.add(b2);


        this.add(p1);
        this.add(tf1, BorderLayout.NORTH);
        this.add(bIg, BorderLayout.SOUTH);

        bC.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tf1.setText("");
            }
        });

        b1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tf1.setText("1");
            }
        });

        b2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tf1.setText("2");
            }
        });

        bIg.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tf1.setText("Equals");
            }
        });

        this.setVisible(true);
    }

    public static void main(String[] args) {
        Janela4 j = new Janela4();
    }
}
