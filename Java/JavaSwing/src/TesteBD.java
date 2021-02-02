import java.sql.*;

public class TesteBD {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("org.mariadb.jdbc.Driver");
        System.out.println("Driver loaded");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/faculdade", "atikin", "zymm4fsq");
        System.out.println("Database is working");

        String query = "select A.Matricula, A.Nome, A.DataNasc, A.CodCurso, C.NomeCurso, A.CodDisc, D.NomeDisc, A.NP1, A.NP2, A.Media, A.Faltas\n" +
                "from Aluno A, Curso C, Disciplina D\n" +
                "where A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc\n" +
                "order by A.Matricula;";

        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet result = statement.executeQuery();

        while (result.next()) {
            int matricula = result.getInt("Matricula");
            String nome = result.getString("Nome");
            Date datanasc = result.getDate("DataNasc");
            int codcurso = result.getInt("CodCurso");
            String nomecurso = result.getString("NomeCurso");
            int coddisc = result.getInt("CodDisc");
            String nomedisc = result.getString("NomeDisc");
            double np1 = result.getDouble("NP1");
            double np2 = result.getDouble("NP2");
            double media = result.getDouble("Media");
            int faltas = result.getInt("Faltas");
            System.out.println("[" + matricula + "]: " + nome);
            System.out.println("Nascimento: " + datanasc);
            System.out.println("Cursando: " + nomecurso + " de código " + codcurso);
            System.out.println("Estudando: " + nomedisc + " de código " + coddisc);
            System.out.println("Com NP1: " + np1 + ", NP2: " + np2 + " e média: " + media);
            System.out.println("Faltas: " + faltas);
            System.out.println();
        }

        connection.close();
    }
}
