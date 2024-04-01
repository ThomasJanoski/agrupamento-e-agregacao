CREATE TABLE Produtos (
	id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
  	nome VARCHAR(60) NOT NULL,
  	preco DECIMAL(9, 2) NOT NULL,
  	estoque INT NOT NULL,
  	perecivel BOOLEAN NOT NULL,
  	marca VARCHAR(50),
  	nacionalidade VARCHAR(50)
);

INSERT INTO Produtos (nome, preco, estoque, perecivel, marca, nacionalidade) VALUES
('Arroz Integral', 5.49, 150, FALSE, 'Tio João', 'Brasil'),
('Feijão Carioca', 4.89, 200, FALSE, 'Camil', 'Brasil'),
('Queijo Minas Frescal', 12.99, 75, TRUE, 'Itambé', 'Brasil'),
('Iogurte Natural', 3.59, 120, TRUE, 'Nestlé', 'Portugal'),
('Azeite de Oliva Extra Virgem', 19.90, 40, FALSE, 'Gallo', 'Portugal');

SELECT * FROM Produtos;

SELECT COUNT(id_produto) FROM Produtos; -- Contagem
SELECT AVG(preco) as preco_medio FROM Produtos; -- Preço médio
SELECT AVG(preco) as preco_medio FROM Produtos WHERE perecivel = 0; -- Preço médio - não perecíveis
SELECT AVG(preco) as preco_medio FROM Produtos WHERE perecivel = 1; -- Preço médio - perecíveis
SELECT nome, AVG(preco) FROM Produtos GROUP BY nome; -- média dos perecíveis, agrupados pelo nome.
SELECT AVG(preco), SUM(estoque) FROM Produtos; -- média preço, total estoque
SELECT id_produto, nome, marca, estoque, SUM(preco) AS total_preco FROM Produtos GROUP BY id_produto ORDER BY total_preco DESC LIMIT 1; -- produto mais caro
SELECT id_produto, nome, preco FROM Produtos WHERE preco > (SELECT AVG(preco) FROM Produtos) ORDER BY id_produto; -- preço acima da média
SELECT nacionalidade, COUNt(estoque) as total_estoque FROM Produtos GRoup BY nacionalidade ORDER BY total_estoque DESC; -- total estoque de acordo com a nacionalidade