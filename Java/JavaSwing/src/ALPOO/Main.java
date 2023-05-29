package ALPOO;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Main extends JFrame {

    //--Componentes principais--//
    JPanel cardPanel, pCAluno, pCDisc, pCProf, pCCurso, pVGeral, pVazio;

    //--Strings essenciais do JDBC--//
    String driver = "org.mariadb.jdbc.Driver";
    String url = "jdbc:mysql://localhost/faculdade";
    // Observação: alterar os valores de login e password
    // conforme os parâmetros do banco de dados da máquina a ser utilizada
    String login = "user";
    String password = "password";

    //--Configuração do menu do programa--//
    JMenuBar menuBar = new JMenuBar();

    JMenu cadastrar = new JMenu("Cadastrar");
    JMenuItem cadastroAluno = new JMenuItem("Aluno");
    JMenuItem cadastroProf = new JMenuItem("Professor");
    JMenuItem cadastroDisc = new JMenuItem("Disciplina");
    JMenuItem cadastroCurso = new JMenuItem("Curso");

    JMenu exibir = new JMenu("Exibir");
    JMenuItem verAluno = new JMenuItem("Alunos");
    JMenuItem verProfessor = new JMenuItem("Professores");
    JMenuItem verCurso = new JMenuItem("Cursos");
    JMenuItem verDisciplina = new JMenuItem("Disciplinas");
    JMenuItem verCursoDisciplina = new JMenuItem("Cursos/Disciplinas");
    JMenuItem verCursoProfessor = new JMenuItem("Cursos/Professores");
    JMenuItem verProfessorDisciplina = new JMenuItem("Professores/Disciplinas");

    JMenuItem sair = new JMenuItem("Sair");

    //--Instanciação das classes externas--//
    Aluno aluno = new Aluno();
    Disciplina disciplina = new Disciplina();
    Professor professor = new Professor();
    Curso curso = new Curso();
    Catalogo catalogo = new Catalogo();

    public Main() {
        //--Configurações da classe Catalogo--//
        catalogo.aluno = aluno;
        catalogo.professor = professor;
        catalogo.disciplina = disciplina;
        catalogo.curso = curso;

        //--Configuração inicial do JFrame principal--//
        this.setBounds(500, 240, 500, 620);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setTitle("Faculdade DataBase");
        this.setResizable(false);

        //--Acionando o menu do programa--//
        menuBar.add(cadastrar);
        cadastrar.add(cadastroAluno);
        cadastrar.add(cadastroProf);
        cadastrar.add(cadastroDisc);
        cadastrar.add(cadastroCurso);
        MenuHandler MH = new MenuHandler();
        cadastroAluno.addActionListener(MH);
        cadastroDisc.addActionListener(MH);
        cadastroProf.addActionListener(MH);
        cadastroCurso.addActionListener(MH);

        menuBar.add(exibir);
        exibir.add(verAluno);
        exibir.add(verProfessor);
        exibir.add(verDisciplina);
        exibir.add(verCurso);
        exibir.add(verCursoDisciplina);
        exibir.add(verCursoProfessor);
        exibir.add(verProfessorDisciplina);
        verAluno.addActionListener(MH);
        verProfessor.addActionListener(MH);
        verDisciplina.addActionListener(MH);
        verCurso.addActionListener(MH);
        verCursoDisciplina.addActionListener(MH);
        verCursoProfessor.addActionListener(MH);
        verProfessorDisciplina.addActionListener(MH);

        menuBar.add(sair);
        sair.addActionListener(MH);

        //--Extração dos painéis por classe--//
        //pC = painel de cadastro
        //pV = painel de visualização
        pCAluno = aluno.pRegister;
        pCDisc = disciplina.pRegister;
        pCProf = professor.pRegister;
        pCCurso = curso.pRegister;
        pVGeral = catalogo.pView;

        //--Criação de um painel vazio para ser mostrado ao início do programa--//
        pVazio = new JPanel();
        pVazio.setLayout(null);

        //--Passagem das Strings essenciais do JDBC para as outras classes--//
        aluno.driver = driver;
        aluno.url = url;
        aluno.login = login;
        aluno.password = password;
        professor.driver = driver;
        professor.url = url;
        professor.login = login;
        professor.password = password;
        disciplina.driver = driver;
        disciplina.url = url;
        disciplina.login = login;
        disciplina.password = password;
        curso.driver = driver;
        curso.url = url;
        curso.login = login;
        curso.password = password;
        catalogo.driver = driver;
        catalogo.url = url;
        catalogo.login = login;
        catalogo.password = password;

        //--Configuração do CardLayout principal--//
        cardPanel = new JPanel(new CardLayout());
        cardPanel.add(pVazio, "pVazio");
        cardPanel.add(pCAluno, "pCAluno");
        cardPanel.add(pCDisc, "pCDisc");
        cardPanel.add(pCProf, "pCProf");
        cardPanel.add(pCCurso, "pCCurso");
        cardPanel.add(pVGeral, "pVGeral");

        //--Passagem do cardPanel para as outras classes--//
        aluno.cardPanel = cardPanel;
        aluno.frame = this;
        professor.cardPanel = cardPanel;
        professor.frame = this;
        disciplina.cardPanel = cardPanel;
        disciplina.frame = this;
        curso.cardPanel = cardPanel;
        curso.frame = this;

        //--Configuração final do JFrame principal--//
        this.add(cardPanel);
        this.setJMenuBar(menuBar);
        this.setVisible(true);
    }

    //--Duas funções que trocam o tamanho do JFrame com base no painel que está a ser visualizado--//
    //--Observação: as funções foram criadas para serem utilizadas dentro da classe MenuHandler abaixo--//
    public void setRegisterSize() {
        this.setSize(500, 620);
    }

    public void setViewSize() {
        this.setSize(800, 500);
    }

    //--Classe privada que lida com as ações dos itens do menu principal do programa--//
    private class MenuHandler implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            CardLayout card = (CardLayout) cardPanel.getLayout();
            aluno.accessDatabase();
            disciplina.accessDatabase();
            if (e.getSource().equals(cadastroAluno)) {
                setRegisterSize();
                aluno.defaultConfig();
                card.show(cardPanel, "pCAluno");
            }
            else if (e.getSource().equals(cadastroDisc)) {
                setRegisterSize();
                disciplina.defaultConfig();
                card.show(cardPanel, "pCDisc");
            }
            else if (e.getSource().equals(cadastroProf)) {
                setRegisterSize();
                professor.defaultConfig();
                card.show(cardPanel, "pCProf");
            }
            else if (e.getSource().equals(cadastroCurso)) {
                setRegisterSize();
                curso.defaultConfig();
                card.show(cardPanel, "pCCurso");
            }
            else if (e.getSource().equals(verAluno)) {
                catalogo.accessDatabase("aluno");
                setViewSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verProfessor)) {
                catalogo.accessDatabase("professor");
                setViewSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verDisciplina)) {
                catalogo.accessDatabase("disciplina");
                setRegisterSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verCurso)) {
                catalogo.accessDatabase("curso");
                setRegisterSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verCursoDisciplina)) {
                catalogo.accessDatabase("cursodisciplina");
                setViewSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verCursoProfessor)) {
                catalogo.accessDatabase("cursoprofessor");
                setViewSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(verProfessorDisciplina)) {
                catalogo.accessDatabase("professordisciplina");
                setViewSize();
                card.show(cardPanel, "pVGeral");
            }
            else if (e.getSource().equals(sair)) {
                String message = "Deseja sair do programa?";
                int choice = JOptionPane.showConfirmDialog(null, message, "Confirmação",
                        JOptionPane.YES_NO_OPTION);
                if (choice == 0)
                    System.exit(0);
            }
        }
    }

    public static void main(String[] args) {
        Main program = new Main();
    }
}
