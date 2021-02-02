import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Calculadora extends JFrame implements ActionListener {
	
	// Componentes (atributos)
	JPanel p1 = new JPanel();
	JTextField tf1 = new JTextField();
	JButton b1 = new JButton("1");
	JButton b2 = new JButton("2");
	JButton b3 = new JButton("3");
	JButton b4 = new JButton("4");
	JButton b5 = new JButton("5");
	JButton b6 = new JButton("6");
	JButton b7 = new JButton("7");
	JButton b8 = new JButton("8");
	JButton b9 = new JButton("9");
	JButton b0 = new JButton("0");
	JButton bC = new JButton("C");
	JButton bma = new JButton("+");
	JButton bme = new JButton("-");
	JButton bve = new JButton("*");
	JButton bdi = new JButton("/");
	JButton bpto = new JButton(".");
	JButton big = new JButton("=");
	
	// Atributos de controle:
	double n = 0;
	String oper = "";
	
	// Método main: aciona o programa (instancia a Classe)
	public static void main(String[] args) {
		Calculadora c = new Calculadora();
	}
	
	// Método Construtor (montagem da tela)
	public Calculadora() {
		// Configurações da Janela
		this.setTitle("Calculadora");
		this.setBounds(100, 100, 200, 300);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// Disponibilizando os Componentes na Janela
		this.add(tf1, BorderLayout.NORTH);
		this.add(big, BorderLayout.SOUTH);
		this.add(p1);  // inserindo na parte central
		
		// Disponibilizando os Componentes no Painel
		// ...mas o Panel/JPanel possui layout FlowLayout
		p1.setLayout(new GridLayout(4, 4));
		p1.add(b1);
		p1.add(b2);
		p1.add(b3);
		p1.add(bC);
		p1.add(b4);
		p1.add(b5);
		p1.add(b6);
		p1.add(bma);
		p1.add(b7);
		p1.add(b8);
		p1.add(b9);
		p1.add(bme);
		p1.add(b0);
		p1.add(bpto);
		p1.add(bve);
		p1.add(bdi);
		
		// Adicionando os enventos aos botões ("ligando" os botões)
		b1.addActionListener(this);
		b2.addActionListener(this);
		bma.addActionListener(this);
		bme.addActionListener(this);
		big.addActionListener(this);
		
		// Deixando a tela visível
		this.setVisible(true);
	}

	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		String nvis = tf1.getText();
		double res = 0;
		if (obj.equals(b1)) {
			tf1.setText(nvis + "1");
		} else if (obj.equals(b2)) {
			tf1.setText(nvis + "2");
		} else if (obj.equals(bma)) {
			// Wrapper Classes: que representam os Tipos Primitivos
			n = Double.parseDouble(nvis);
			oper = "+";
			tf1.setText("");
		} else if (obj.equals(bme)) {
			n = Double.parseDouble(nvis);
			oper = "-";
			tf1.setText("");
		} else if (obj.equals(big)) {
			if (oper == "+") {
				res = n + Double.parseDouble(nvis);
			} else if (oper == "-") {
				res = n - Double.parseDouble(nvis);
			}
			//tf1.setText("" + res);
			tf1.setText(Double.toString(res));
		}
	}
	
}
