Av_questao3
CREATE DATABASE locadora_veiculos;

USE locadora_veiculos;

CREATE TABLE veiculos (
id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
placa VARCHAR(10) UNIQUE,
modelo VARCHAR(100),
ano INT
);

CREATE TABLE manutencoes (
id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(150),
id_veiculo INT,
FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo)
);

ALTER TABLE manutencoes
ADD custo_manutencao DECIMAL(10,2),
ADD data_servico DATE;

INSERT INTO veiculos (placa, modelo, ano)
VALUES ('ABC1234', 'Fiat Uno', 2018);

INSERT INTO veiculos (placa, modelo, ano)
VALUES ('DEF5678', 'Chevrolet Onix', 2020);

INSERT INTO veiculos (placa, modelo, ano)
VALUES ('GHI9012', 'Volkswagen Gol', 2019);

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Troca de Óleo', 1, 150.00, '2025-01-10');

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Alinhamento', 1, 200.00, '2025-02-15');

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Troca de Óleo', 2, 180.00, '2025-01-20');

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Troca de Freios', 2, 1200.00, '2025-03-05');

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Troca de Óleo', 3, 160.00, '2025-02-01');

INSERT INTO manutencoes (descricao, id_veiculo, custo_manutencao, data_servico)
VALUES ('Balanceamento', 3, 220.00, '2025-02-18');

SELECT v.placa, v.modelo
FROM veiculos v
JOIN manutencoes m
ON v.id_veiculo = m.id_veiculo
WHERE m.descricao = 'Troca de Óleo';

SELECT SUM(custo_manutencao) AS total_gasto
FROM manutencoes
WHERE id_veiculo = 2;

UPDATE manutencoes
SET descricao = 'Revisão Geral'
WHERE custo_manutencao > 1000.00;
