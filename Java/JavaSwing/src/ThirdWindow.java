/*
Second exercise from the ALPOO class
 */

import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ThirdWindow extends Frame {
    Button B1, B2;
    TextArea Name;
    Choice Age;
    Label L1, L2, L3, L4;
    ArrayList<String> names;
    ArrayList<Integer> ages;

    public ThirdWindow() {
        setTitle("Second Exercise");
        setResizable(false);
        setSize(400, 300);
        setLocation(100, 100);
        setBackground(Color.LIGHT_GRAY);
        setLayout(null);

        L1 = new Label("Name and age arrays program");
        L1.setLocation(20, 50);
        L1.setSize(140, 20);

        L2 = new Label("Enter your name");
        L2.setLocation(20, 80);
        L2.setSize(140, 20);

        L3 = new Label("Select your age");
        L3.setLocation(20, 160);
        L3.setSize(140, 20);

        L4 = new Label("");
        L4.setLocation(20, 190);
        L4.setSize(140, 20);
        L4.setForeground(Color.RED);

        B1 = new Button("Ok");
        B1.setLocation(50, 230);
        B1.setSize(80, 30);
        B1.setBackground(Color.GREEN);

        B2 = new Button("Exit");
        B2.setLocation(140, 230);
        B2.setSize(80, 30);
        B2.setBackground(Color.RED);

        Name = new TextArea("");
        Name.setBounds(170, 80, 150, 50);

        Age = new Choice();
        Age.setBounds(170, 160, 150, 20);
        for (int i = 18; i <= 30; i++)
            Age.addItem(Integer.toString(i));

        add(L1);
        add(L2);
        add(L3);
        add(L4);
        add(B1);
        add(B2);
        add(Name);
        add(Age);

        names = new ArrayList<String>();
        ages = new ArrayList<Integer>();
        ButtonHandler handler = new ButtonHandler();
        B1.addActionListener(handler);
        B2.addActionListener(handler);
    }

    private class ButtonHandler implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getActionCommand() == "Exit") {
                String finalArray = "";
                for (int i = 0; i < names.size(); i++) {
                    if (i == names.size() - 1)
                        finalArray += Integer.toString(i) + ": " + names.get(i) + " - " + ages.get(i);
                    else
                        finalArray += Integer.toString(i) + ": " + names.get(i) + " - " + ages.get(i) + "\n";
                }
                JOptionPane.showMessageDialog(null, finalArray, "Final Result", JOptionPane.INFORMATION_MESSAGE);
                System.exit(0);
            }
            else if (e.getActionCommand() == "Ok") {
                if (names.size() > 10 || ages.size() > 10) {
                    L4.setText("Cannot add more!");
                }
                else {
                    names.add(Name.getText());
                    ages.add(Integer.parseInt(Age.getSelectedItem()));
                }
            }
        }
    }

    public static void main(String[] args) {
        ThirdWindow test = new ThirdWindow();
        test.setVisible(true);
    }
}
