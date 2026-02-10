Av_questao2

CREATE DATABASE controle_estoque;

USE controle_estoque;

CREATE TABLE categorias (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR(100)
);

CREATE TABLE produtos (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(100),
quantidade_estoque INT,
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

ALTER TABLE produtos
ADD CONSTRAINT chk_quantidade_estoque
CHECK (quantidade_estoque >= 0);

INSERT INTO categorias (nome_categoria)
VALUES ('Eletrônicos');

INSERT INTO categorias (nome_categoria)
VALUES ('Roupas');

INSERT INTO categorias (nome_categoria)
VALUES ('Alimentos');

INSERT INTO produtos (nome_produto, quantidade_estoque, id_categoria)
VALUES ('Mouse', 15, 1);

INSERT INTO produtos (nome_produto, quantidade_estoque, id_categoria)
VALUES ('Teclado', 8, 1);

INSERT INTO produtos (nome_produto, quantidade_estoque, id_categoria)
VALUES ('Camiseta', 20, 2);

INSERT INTO produtos (nome_produto, quantidade_estoque, id_categoria)
VALUES ('Calça Jeans', 5, 2);

INSERT INTO produtos (nome_produto, quantidade_estoque, id_categoria)
VALUES ('Arroz', 30, 3);

SELECT *
FROM produtos
WHERE quantidade_estoque < 10;

SELECT c.nome_categoria, COUNT(p.id_produto) AS total_produtos
FROM categorias c
JOIN produtos p
ON c.id_categoria = p.id_categoria
GROUP BY c.nome_categoria;
