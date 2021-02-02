import java.awt.*;
import java.awt.event.*;

public class SecondWindow extends Frame {
    Dimension dim1, dim2, dim3;
    Button B1, B2;
    TextField Tx1;
    Label L1, L2, L3;

    private class ButtonHandler implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String number;
            boolean isOdd;
            if (e.getActionCommand() == "Exit")
                System.exit(0);
            else {
                number = Tx1.getText();
                isOdd = ((Integer.parseInt(number) % 2) == 0);
                L3.setText((isOdd) ? "Odd" : "Even");
            }
        }
    }

    public SecondWindow() {
        dim1 = new Dimension(400, 300);
        dim2 = new Dimension(150, 20);
        dim3 = new Dimension(60, 20);

        setTitle("Odd or even?");
        setResizable(false);
        setSize(dim1);
        setLocation(100, 100);
        setBackground(new Color(255, 0, 0));
        setLayout(null);

        L1 = new Label("Odd or even?");
        L1.setLocation(50, 50);
        L1.setSize(dim2);

        L2 = new Label("Result");
        L2.setLocation(240, 110);
        L2.setSize(dim2);

        L3 = new Label("");
        L3.setLocation(260, 140);
        L3.setSize(dim2);

        Tx1 = new TextField("");
        Tx1.setSize(dim3);
        Tx1.setLocation(50, 100);

        B1 = new Button("Check");
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
        add(Tx1);
        add(B1);
        add(B2);

        ButtonHandler handler = new ButtonHandler();
        B1.addActionListener(handler);
        B2.addActionListener(handler);
    }
}
