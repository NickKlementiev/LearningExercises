import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;

public class Tabela5 extends JFrame {

	//private JPanel p1 = new JPanel();
	
	private JScrollPane objJSP = new JScrollPane();
	private JTable objJT;
	private DefaultTableModel objDTM;
	
	public static void main(String[] args) {
		Tabela5 tb = new Tabela5();
		tb.setVisible(true);
	}
	
	public Tabela5() {
		
		this.setSize(500, 400);
		this.setLocation(200, 100);
		this.setTitle("CONSTRUINDO UMA TABELA");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		//p1.setLayout(new BorderLayout());
		//p1.setBorder(new TitledBorder("Itens de Tabela"));
		
		//  ##############################################################################
		//  ### PARA CONSTRU??O DE TABELA ####
		
		// >> os dados podem ser adicionados ao "Modelo de Tabela Padr?o" - linha a linha
		// .. - primeiro o t?tulo (diretamente ao instanciar - utilizando o construtor apropriado)...
		//String[] titulos = {"TT1", "TT2", "TT3", "TT4", "TT5"};
		String[] titulos = {"ID", "NOME", "RA", "IDADE"};
		objDTM = new DefaultTableModel(titulos, 0);
		// .. - depois adicionando os dados de cada linha...
		this.acessaBD();
		/*for (int i = 1; i <= 100; i++) {
			String d1 = "Dado_C1_L" + i;
			String d2 = "Dado_C2_L" + i;
			String d3 = "Dado_C3_L" + i;
			String d4 = "Dado_C4_L" + i;
			String d5 = "Dado_C5_L" + i;
			String[] dados = {d1, d2, d3, d4, d5};
			objDTM.addRow(dados);
		}*/
		
		// >> o modelo ? ent?o adicionado a um objeto JTable
		objJT = new JTable(objDTM);
		// .. pode-se alterar o tamanho (e caracter?sticas) de cada coluna
		//objJT.getColumnModel().getColumn(0).setPreferredWidth(150);
		
		// >> adiciona-se a tabela toda (JTable) a um ScrollPane (pois do contr?rio n?o se enxerga a linha do t?tulo) 
		objJSP.setViewportView(objJT);
		//  ##############################################################################
		
		// >> por fim o ScrollPane ? adicionado ao Painel.
		//p1.add(objJSP, BorderLayout.CENTER);
		
		//Incluindo o que foi construido na parte central da Janela
		this.add(objJSP);
		
	}

	public void acessaBD() {
		// TODO Auto-generated method stub

		String driver = "com.mysql.cj.jdbc.Driver";
		//String url = "jdbc:mysql://localhost:3306/world";
		String url = "jdbc:mysql://localhost:3306/aula_alpoo";
		//...e porque em meu MySQL n?o foi configurado o TimeZone
		url += "?useTimezone=true&serverTimezone=UTC";

		String login = "root";
		String senha = "root";
		//String query = "select * from country";
		String query = "select * from aluno";
		// ......................................................
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,login,senha);
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				String id = rs.getString("id");
				String nome = rs.getString("nome");
				String ra = rs.getString("ra");
				String idade = rs.getString("idade");
				//String x = rs.getString("Code");
				//String y = rs.getString("Name");
				//System.out.println(x + " :: " + y);
				String[] dados = {id, nome, ra, idade};
				objDTM.addRow(dados);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
}
