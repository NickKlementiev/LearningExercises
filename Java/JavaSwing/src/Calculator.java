import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Calculator extends JFrame {
    JButton b1, b2, b3, b4, b5, b6, b7, b8, b9, b0, bC, bEq, bPlus, bMinus, bTimes, bDiv, bDec, bSen, bCos, bTan;
    JLabel index;
    JPanel central, numeric, trigonometric, bottom;
    Double a, b, res;
    boolean setA, decimal;
    String prevCalc;
    String indexText = "";
    JMenuBar extraBar = new JMenuBar();
    JMenu extra = new JMenu("Extra");
    JMenuItem num = new JMenuItem("Numeric");
    JMenuItem trigo = new JMenuItem("Trigonometry");

    public Calculator() {
        this.setTitle("Calculator");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setBounds(100, 100, 400, 400);
        a = b = 0.0;

        b1 = new JButton("1");
        b2 = new JButton("2");
        b3 = new JButton("3");
        b4 = new JButton("4");
        b5 = new JButton("5");
        b6 = new JButton("6");
        b7 = new JButton("7");
        b8 = new JButton("8");
        b9 = new JButton("9");
        b0 = new JButton("0");
        bC = new JButton("C");
        bEq = new JButton("=");
        bPlus = new JButton("+");
        bMinus = new JButton("-");
        bTimes = new JButton("*");
        bDiv = new JButton("/");
        bDec = new JButton(".");
        bSen = new JButton("Sin X");
        bCos = new JButton("Cos X");
        bTan = new JButton("Tan X");

        digitHandler d = new digitHandler();
        b1.addActionListener(d);
        b2.addActionListener(d);
        b3.addActionListener(d);
        b4.addActionListener(d);
        b5.addActionListener(d);
        b6.addActionListener(d);
        b7.addActionListener(d);
        b8.addActionListener(d);
        b9.addActionListener(d);
        b0.addActionListener(d);
        bDec.addActionListener(d);

        operationHandler o = new operationHandler();
        bPlus.addActionListener(o);
        bMinus.addActionListener(o);
        bTimes.addActionListener(o);
        bDiv.addActionListener(o);
        bEq.addActionListener(o);
        bC.addActionListener(o);
        bSen.addActionListener(o);
        bCos.addActionListener(o);
        bTan.addActionListener(o);

        central = new JPanel();
        central.setLayout(new CardLayout());
        numeric = new JPanel();
        trigonometric = new JPanel();
        central.add(numeric, "n");
        central.add(trigonometric, "t");
        bottom = new JPanel();

        numeric.setLayout(new GridLayout(4, 4));
        bottom.setLayout(new GridLayout(1, 1));
        trigonometric.setLayout(new GridLayout(3, 1));

        numeric.add(b7);
        numeric.add(b8);
        numeric.add(b9);
        numeric.add(bPlus);
        numeric.add(b4);
        numeric.add(b5);
        numeric.add(b6);
        numeric.add(bMinus);
        numeric.add(b1);
        numeric.add(b2);
        numeric.add(b3);
        numeric.add(bTimes);
        numeric.add(bDec);
        numeric.add(b0);
        numeric.add(bC);
        numeric.add(bDiv);

        trigonometric.add(bSen);
        trigonometric.add(bCos);
        trigonometric.add(bTan);

        bottom.add(bEq);

        index = new JLabel("0");
        index.setHorizontalAlignment(JLabel.RIGHT);

        this.add(central);
        this.add(index, BorderLayout.NORTH);
        this.add(bottom, BorderLayout.SOUTH);
        this.setJMenuBar(extraBar);
        extraBar.add(extra);
        extra.add(num);
        extra.add(trigo);

        menuHandler m = new menuHandler();
        num.addActionListener(m);
        trigo.addActionListener(m);

        this.setVisible(true);
    }

    private class menuHandler implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getSource().equals(num)) {
                CardLayout card = (CardLayout) central.getLayout();
                card.show(central, "n");
            } else if (e.getSource().equals(trigo)) {
                CardLayout card = (CardLayout) central.getLayout();
                card.show(central, "t");
            }
        }
    }

    private class digitHandler implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            JButton pressed = (JButton)e.getSource();
            if (indexText.equals(""))
                indexText = pressed.getText();
            else if (indexText.equals(".") && !decimal) {
                decimal = true;
                indexText += pressed.getText();
            }
            else {
                indexText += pressed.getText();
            }
            index.setText(indexText);
        }
    }

    private void initialSetup() {
        a = b = 0.0;
        setA = decimal = false;
        prevCalc = indexText = "";
    }

    private void doCalc(String prevCalc) {
        switch (prevCalc) {
            case "+":
                a += b;
                break;
            case "-":
                a -= b;
                break;
            case "*":
                a *= b;
                break;
            case "/":
                a /= b;
                break;
        }
        res = a;
    }

    private class operationHandler implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            decimal = false;
            JButton pressed = (JButton)e.getSource();
            switch (pressed.getText()) {
                case "+":
                    if (indexText.equals("")) {
                        a = res;
                        setA = true;
                    } else if (!setA) {
                        a = Double.parseDouble(indexText);
                        setA = true;
                    } else {
                        b = Double.parseDouble(indexText);
                        doCalc(prevCalc);
                    }
                    prevCalc = "+";
                    indexText = "";
                    break;
                case "-":
                    if (indexText.equals("")) {
                        a = res;
                        setA = true;
                    } else if (!setA) {
                        a = Double.parseDouble(indexText);
                        setA = true;
                    } else {
                        b = Double.parseDouble(indexText);
                        doCalc(prevCalc);
                    }
                    prevCalc = "-";
                    indexText = "";
                    break;
                case "*":
                    if (indexText.equals("")) {
                        a = res;
                        setA = true;
                    } else if (!setA) {
                        a = Double.parseDouble(indexText);
                        setA = true;
                    } else {
                        b = Double.parseDouble(indexText);
                        doCalc(prevCalc);
                    }
                    prevCalc = "*";
                    indexText = "";
                    break;
                case "/":
                    if (indexText.equals("")) {
                        a = res;
                        setA = true;
                    } else if (!setA) {
                        a = Double.parseDouble(indexText);
                        setA = true;
                    } else {
                        b = Double.parseDouble(indexText);
                        doCalc(prevCalc);
                    }
                    prevCalc = "/";
                    indexText = "";
                    break;
                case "=":
                    b = Double.parseDouble(indexText);
                    doCalc(prevCalc);
                    indexText = Double.toString(a);
                    index.setText(indexText);
                    initialSetup();
                    break;
                case "Sin X":
                    a = Double.parseDouble(indexText);
                    indexText = Double.toString(Math.sin(Math.toRadians(a)));
                    System.out.println(Math.sin(a));
                    index.setText(indexText);
                    break;
                case "Cos X":
                    a = Double.parseDouble(indexText);
                    indexText = Double.toString(Math.cos(Math.toRadians(a)));
                    index.setText(indexText);
                    break;
                case "Tan X":
                    a = Double.parseDouble(indexText);
                    indexText = Double.toString(Math.tan(Math.toRadians(a)));
                    index.setText(indexText);
                    break;
                case "C":
                    initialSetup();
                    index.setText("0");
                    break;
            }
        }
    }

    public static void main(String[] args) {
        Calculator c = new Calculator();
    }
}
