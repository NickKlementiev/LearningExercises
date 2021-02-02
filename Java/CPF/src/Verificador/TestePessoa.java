package Verificador;

import javax.swing.JOptionPane;

public class TestePessoa {
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        String msgIni = "Entre com o número do CPF ";
        msgIni += "\n(sem digitar pontos e nem traço): ";
        String inCpf = JOptionPane.showInputDialog(null, msgIni, "CPF:",
                JOptionPane.PLAIN_MESSAGE);
        if (!(inCpf == null)) {
            PessoaFisica p1 = new PessoaFisica();
            p1.setNome("José da Silva");
            p1.setCpf(inCpf); // CPF: 123.456.789-00
        // fazer o teste com algum número de CPF válido
            String txtFinal = "";
            txtFinal += "\nNome: " + p1.getNome();
            txtFinal += "\nCPF: " + p1.getCpf();
            System.out.println(txtFinal);
        }
        System.out.println("Fim do TESTE...");
    }
}
