CREATE DATABASE ProjetoFormula1;
USE ProjetoFormula1;

CREATE TABLE IF NOT EXISTS PilotosF1(codigo int(11) NOT NULL,
    nome char(20) NOT NULL,
    pais char(20) NOT NULL,
    endereco char(20) NOT NULL,
    idade int(3) NOT NULL,
    equipe int(10) NOT NULL,
    motor char(20) NOT NULL,
    PRIMARY KEY(codigo)) DEFAULT CHARSET utf8mb4;

    SELECT * FROM PilotosF1;

    ALTER TABLE PilotosF1 ADD pontos int(10);
    ALTER TABLE PilotosF1 ADD codigo_Ranking int(11);
    ALTER TABLE PilotosF1 CHANGE equipe equipe char(20) NOT NULL;
    ALTER TABLE PilotosF1 RENAME Pilotos;
    ALTER TABLE Pilotos DROP endereco;
    ALTER TABLE Pilotos DROP codigo_Ranking;

    DROP TABLE Pilotos;
    SELECT * FROM Pilotos;

    INSERT INTO Pilotos(codigo, nome, pais, idade, equipe, motor, pontos)
    values(136, 'Bruno Senna', 'Brasil', 21, 'Hispania', 'Cosworth', 0);

    INSERT INTO Pilotos
    values(112, 'Fernando Alonso', 'Espanha', 28, 'Ferrari', 'Ferrari', 135);

    INSERT INTO Pilotos(nome, pontos, equipe, codigo, motor, pais, idade)
    values('Chritian Klien', 0, 'Hispania', 135, 'Cosworth', 'Australia', 20);

    INSERT INTO Pilotos(codigo, nome, pais, idade, equipe, motor, pontos)
    values
    (120, 'Rubens Barrichello', 'Brasil', 29, 'Williams', 'Cosworth', 47),
    (128, 'Nick Heidfield', 'Alemanha', 22, 'Sauber', 'Ferrari', 6),
    (132, 'Jarno Trulli', 'Itália', 18, 'Lotus', 'Cosworth', 0);

    UPDATE Pilotos SET pais = "Brasil";

    SELECT * FROM Pilotos;

    UPDATE Pilotos SET equipe = "Ferrari", pontos = 0;
    UPDATE Pilotos SET idade = idade + 1;
    UPDATE Pilotos SET equipe = "Williams" WHERE idade > 25;
    UPDATE Pilotos SET pais = "Espanha", idade = 28, equipe = "Ferrari", pontos = 252
    WHERE codigo = 120;
    UPDATE Pilotos SET equipe = "Hispania", motor = "Cosworth"

    WHERE codigo = 135 OR codigo = 128;

    UPDATE Pilotos SET pais = "Alemanha"
    WHERE equipe = "Ferrari" AND codigo > 120;

    DELETE FROM Pilotos
    WHERE idade = 28;

    DELETE FROM Pilotos
    WHERE idade >= 21 OR equipe = "Hispania";

    SELECT * from Pilotos;
