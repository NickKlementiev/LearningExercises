package Verificador;

import java.util.ArrayList;

public class PessoaFisica {
    private String cpf = "Ainda não Informado";
    private String nome = "Ainda não Informado";

    private boolean cpfValido(String txtCpf) {
        boolean status = false;
        boolean d1 = false;
        boolean d2 = false;
        int total = 0;

        // Multiplicadores (dígito 1)
        ArrayList<Integer> mults = new ArrayList<Integer>();
        for (int c = 10; c > 1; c--)
            mults.add(c);

        // Transformação de string para ArrayList de inteiros
        String[] cpfList = txtCpf.split("");
        ArrayList<Integer> cpfInt = new ArrayList<Integer>();
        for (int i = 0; i < txtCpf.length(); i++)
            cpfInt.add(Integer.parseInt(cpfList[i]));

        // Verificação do dígito 1
        for (int p = 0; p < txtCpf.length() - 2; p++)
            total += mults.get(p) * cpfInt.get(p);
        if (11 - (total % 11) == cpfInt.get(9) || (11 - (total % 11) > 9 && cpfInt.get(9) == 0))
            d1 = true;

        // Verificação do dígito 2
        total = 0;
        mults.add(0, 11);
        for (int p = 0; p < txtCpf.length() - 1; p++)
            total += mults.get(p) * cpfInt.get(p);
        if (11 - (total % 11) == cpfInt.get(10) || (11 - (total % 11) > 9 && cpfInt.get(10) == 0))
            d2 = true;

        if (d1 && d2)
            status = true;
        return status;
    }

    // Getters e Setters
    public String getCpf() {
        return cpf;
    }

    // Ao inserir dado no CPF, validar antes de preencher
    public void setCpf(String inCpf) {
        if (inCpf.length() == 11 && this.cpfValido(inCpf))
            this.cpf = inCpf;
        else
            System.out.println("[Problemas com CPF informado!]");
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
