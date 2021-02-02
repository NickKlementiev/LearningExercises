import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

public class TesteMenu2 extends JFrame implements ActionListener {
	JMenuBar mb = new JMenuBar();
	JMenu m1 = new JMenu("Arquivo");
	JMenuItem mi1 = new JMenuItem("Sair");
	public static void main(String[] args) {
		TesteMenu2 tm = new TesteMenu2();
	}
	public TesteMenu2() {
		this.setBounds(100, 100, 200, 200);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// Montando os Menus e Itens de Menus
		this.setJMenuBar(mb);
		mb.add(m1);
		m1.add(mi1);
		// Acionando os Itens de Menus (adicionando o evento)
		mi1.addActionListener(this);
		this.setVisible(true);
	}
	// Dando funcionalidade aos Itens de Menus
	public void actionPerformed(ActionEvent arg0) {
		Object obj = arg0.getSource();
		if (obj.equals(mi1)) {
			System.exit(0);
		}
	}
}