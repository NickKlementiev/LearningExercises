import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AcessoBD_MYSQL5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/aula_alpoo";
		
		String login = "root";
		String senha = "root";
		String query = "select * from aluno";
		// ......................................................
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,login,senha);
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				int id = rs.getInt("id");
				String nome = rs.getString("nome");
				System.out.println(id + " :: " + nome);
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
