import java.awt.*;
import java.awt.event.*;

public class FirstWindow extends Frame {
    Dimension dim1, dim2, dim3;
    Button B1, B2;
    TextField Tx1, Tx2;
    Label L1, L2, L3;

    private class ButtonHandler implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String Num1, Num2;
            double Num3;
            if (e.getActionCommand().equals("Exit"))
                System.exit(0);
            else {
                Num1 = Tx1.getText();
                Num2 = Tx2.getText();
                Num3 = Double.parseDouble(Num1) + Double.parseDouble(Num2);
                L3.setText(Double.toString(Num3));
            }
        }
    }

    public FirstWindow() {
        dim1 = new Dimension(400, 300);
        dim2 = new Dimension(150, 20);
        dim3 = new Dimension(60, 20);

        setTitle("Dimension class usage");
        setResizable(false);
        setSize(dim1);
        setLocation(100, 100);
        setBackground(Color.lightGray);
        setLayout(null);

        L1 = new Label("This is a visual class");
        L1.setLocation(50, 50);
        L1.setSize(dim2);

        L2 = new Label("RESULT");
        L2.setLocation(240, 110);
        L2.setSize(dim2);

        L3 = new Label("");
        L3.setLocation(260, 140);
        L3.setSize(dim2);

        Tx1 = new TextField("Number 1: ");
        Tx1.setSize(dim2);
        Tx1.setLocation(50, 100);

        Tx2 = new TextField("Number 2: ");
        Tx2.setSize(dim2);
        Tx2.setLocation(50, 150);

        B1 = new Button("Sum");
        B1.setSize(dim3);
        B1.setLocation(50, 200);
        B1.setBackground(new Color(150, 220, 255));

        B2 = new Button("Exit");
        B2.setSize(dim3);
        B2.setLocation(140, 200);
        B2.setBackground(new Color(150, 220, 255));

        add(L1);
        add(L2);
        add(L3);
        add(B1);
        add(B2);
        add(Tx1);
        add(Tx2);

        ButtonHandler handler = new ButtonHandler();
        B1.addActionListener(handler);
        B2.addActionListener(handler);

    }
}
