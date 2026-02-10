Av_questao1

CREATE DATABASE CursosOnlineDB;

USE CursosOnlineDB;

CREATE TABLE instrutores (
id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
especialidade VARCHAR(100)
);

CREATE TABLE cursos (
id_curso INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150),
preco DECIMAL(10,2),
id_instrutor INT,
FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

ALTER TABLE cursos
ADD duracao_horas INT;

INSERT INTO instrutores (nome, especialidade)
VALUES ('Carlos Silva', 'Programação');

INSERT INTO instrutores (nome, especialidade)
VALUES ('Ana Souza', 'Design');

INSERT INTO cursos (titulo, preco, id_instrutor, duracao_horas)
VALUES ('SQL Básico', 120.00, 1, 20);

INSERT INTO cursos (titulo, preco, id_instrutor, duracao_horas)
VALUES ('JavaScript Iniciante', 150.00, 1, 25);

INSERT INTO cursos (titulo, preco, id_instrutor, duracao_horas)
VALUES ('Design UI/UX', 200.00, 2, 30);

UPDATE cursos
SET preco = preco * 1.15
WHERE id_instrutor = 1;

SELECT c.titulo, i.nome
FROM cursos c
INNER JOIN instrutores i
ON c.id_instrutor = i.id_instrutor;

DELETE FROM cursos
WHERE id_curso = 3;
