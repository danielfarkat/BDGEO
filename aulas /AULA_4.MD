```
CREATE TABLE Cliente(
ClientId INT NOT NULL,
Empresa VARCHAR(40) NOT NULL,

CONSTRAINT ClientPK PRIMARY KEY (ClientId)
);

CREATE TABLE Fornecedor(
FornecedorId INT NOT NULL,
Nome VARCHAR(40) NOT NULL,

CONSTRAINT FornecedorPK PRIMARY KEY (FornecedorId)
);

CREATE TABLE Produto(
ProdutoId INT NOT NULL,
FornecedorId INT NOT NULL,
Descricao VARCHAR(40) NOT NULL,
PrecoUnitario REAL NOT NULL,
CONSTRAINT ProdutoPK PRIMARY KEY (ProdutoId),

CONSTRAINT FornecedorProdutoFK FOREIGN KEY (FornecedorId) REFERENCES
Fornecedor (FornecedorId)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO Cliente (ClientId, Empresa) VALUES(1,'ELECTRA');
INSERT INTO Cliente (ClientId, Empresa) VALUES(2,'SYS');

INSERT INTO Cliente VALUES(3, 'SYS EMPRESA CPMKIMTA TDA45454545 sÃP JOSÉ DOS CAMPOS');

- Toda vez que eu uso um select ele seleciona e printa algo do banco

SELECT \* FROM cliente;

ALTER TABLE Cliente ALTER COLUMN empresa TYPE VARCHAR(150);

INSERT INTO Cliente VALUES(3, 'SYS EMPRESA CPMKIMTA TDA45454545 sÃP JOSÉ DOS CAMPOS');

SELECT \* FROM cliente;

UPDATE Cliente
SET Empresa = 'SYS EMPRESA CONJUNTA'
WHERE ClientId = 3

jUNÇÃO GROUP BY E SELECT SÃO 90 PORCENTO DO QUE PRECISAMOS SABER DE BANCO

SE EU COLOCAR % EU VOU TER UM NOME QUE TEM AQUILO MAS NÃO SÓ AQUILO E O LIKE TIPO QUERO TODOS OS USUÁRIO QUE SE CHAMAM JOSE

```

SELECT \* WHERE Nome LIKE ('%José%')

create view é um resultado de um select e depois podemos manipular todo o select em cima de uma view

update de altera valores

droptable deleta uma tabela ai podso deletar o cascade ou restrict

ASSECTION: Usado para poder selecionar algo com restricção

TRIGGERele cehga a condição do um assection ai necessita de uma condição e uma ação.
