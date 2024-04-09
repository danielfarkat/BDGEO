
---------------- Laboratório SQL: Retorne os comandos em SQL do laboratório.  

-- 1 e 2. Criação das tabelas
CREATE TABLE Instrutor ( 
    InstrutorID   	INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT InstrutorPK PRIMARY KEY (InstrutorID) 
);

CREATE TABLE Aluno ( 
    AlunoID   		INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT AlunoPK PRIMARY KEY (AlunoID) 
);

CREATE TABLE Escola ( 
    EscolaID   		INT   			NOT NULL,
    CNPJ			INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT EscolaPK PRIMARY KEY (EscolaID) 
);

CREATE TABLE Curso ( 
    CursoID   		INT   			NOT NULL,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Carga_horaria	INT 			NOT NULL,
    Ementa			VARCHAR( 500 )	,
    EscolaID        INT 			NOT NULL,
    
    CONSTRAINT CursoPK PRIMARY KEY (CursoID), 
    
    CONSTRAINT CursoEscolaFK 	FOREIGN KEY (EscolaID) 
    							REFERENCES Escola(EscolaID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);


CREATE TABLE Turma ( 
    TurmaID   		INT   			NOT NULL,
    Data_inicio  			DATE  	NOT NULL,
    Data_termino 	 DATE 			NOT NULL,
    CursoID        INT 			NOT NULL,
	InstrutorID        INT 			NOT NULL,
    
    CONSTRAINT TurmaPK PRIMARY KEY (TurmaID), 
    
    CONSTRAINT TurmaCursoFK 	FOREIGN KEY (CursoID) 
    							REFERENCES Curso(CursoID),
	    CONSTRAINT TurmaInstrutorFK 	FOREIGN KEY (InstrutorID) 
    							REFERENCES Instrutor(InstrutorID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);

CREATE TABLE Matricula ( 
    TurmaID   		INT   			NOT NULL,
	 AlunoID        INT 			NOT NULL,
    Nota_final  			REAL  	NOT NULL,
    Presenca 	 REAL 			NOT NULL,
   
    
    CONSTRAINT MatriculaPK PRIMARY KEY (TurmaID, AlunoID), 
    
    CONSTRAINT MatriculaAlunoFK 	FOREIGN KEY (AlunoID) 
    							REFERENCES Aluno(AlunoID),
	CONSTRAINT MatriculaTurmaFK 	FOREIGN KEY (TurmaID) 
    							REFERENCES Turma(TurmaID)
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);



-- 3. Use os comandos SQL para inserir dados na tabela Instrutor 
-- Gerou erro de chave duplicada em uma coluna com constraint de chave unica. Em "instrutor_cpf_key" a chave cpf=33333 ja existe.

INSERT INTO Instrutor VALUES(1, 11111, 'Rodrigo Carvalho', 'Rua Alfa, num 50, Centro');
INSERT INTO Instrutor VALUES(2, 22222, 'Jacqueline França', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Instrutor VALUES(3, 33333, 'Leandro Siqueira', 'Rua Nelson Davila, num 120, Centro');

-- registro com erro no cpf
-- INSERT INTO Instrutor VALUES(4, 33333, 'Diego Faria', 'Rua Siqueira Campos, num 80, Jd Apolo');
-- alterando o cpf do instrutor
INSERT INTO Instrutor VALUES(4, 44444, 'Diego Faria', 'Rua Siqueira Campos, num 80, Jd Apolo');


-- 4. Use os comandos SQL para inserir dados na tabela Aluno
-- Erro ao tentar inserir um registro com um texto com um numero de caracteres maior que o definido no varChar(30). Para resolver precisamos alterar a tabela e aumentar o tamanho do atributo nome
ALTER TABLE Aluno ALTER COLUMN Nome TYPE VARCHAR(150);
INSERT INTO Aluno VALUES(1, 12222, 'Jose Vitor Ferreira Fernandes Gomes Dias', 'Rua Alfa, num 100, Centro');

INSERT INTO Aluno VALUES(2, 32222, 'Rodrigo Gomes Dias', 'Rua Sete de Setembro, num 200, Alvorada');
INSERT INTO Aluno VALUES(3, 42222, 'Daniel Ribeiro Alvarenga', 'Rua Nelson Davila, num 150, Centro');
INSERT INTO Aluno VALUES(4, 52222, 'Gustavo Ferreira', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(5, 62222, 'Marcelo Reis Fernandes', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(6, 72222, 'Renata Fernandes Carvalho', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(7, 82222, 'Debora Ribeiro Reis', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(8, 92222, 'Daniela Reis Barbosa', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(9, 13333, 'Luciane Cardoso', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(10, 91919, 'Claudio Cardoso', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(11, 81818, 'Marina Reis Alvarenga', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(12, 71717, 'Sabrina Carvalho', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(13, 61616, 'Julio Cesar Dias', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(14, 51515, 'Regiane Limeira', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(15, 41414, 'Augusto Dias Gomes', 'Rua Nelson Davila, num 120, Centro');


-- 5. Use os comandos SQL para inserir dados na tabela Escola, Curso, Turma e Matricula

INSERT INTO Escola VALUES(1, 11111, 'InfoSys', 'Rua Nelson Davila, num 400, Centro');
INSERT INTO Escola VALUES(2, 22222, 'Inova', 'Rua Sete de Setembro, num 800, Alvorada');
INSERT INTO Escola VALUES(3, 33333, 'CodSys', 'Rua Alfa, num 1030, Apolo');

INSERT INTO Curso VALUES(1, 'Linux - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(2, 'Linux - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(3, 'Windows - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(4, 'Windows - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(5, 'C++ Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(6, 'Java Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(7, 'Python', 120, '', 3);
INSERT INTO Curso VALUES(8, 'Database System and SQL', 240, '', 2);
INSERT INTO Curso VALUES(9, 'Data Science', 240, '', 2);
INSERT INTO Curso VALUES(10, 'Geoinformatics', 240, '', 2);

INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(1, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(2, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(3, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(4, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(5, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(6, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(7, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(8, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(9, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(10, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(11, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(12, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(13, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(14, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(15, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(16, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(17, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(18, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 10, 4);
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(19, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 10, 4);

-- TurmaID, AlunoID, Nota e Presenca
INSERT INTO Matricula (TurmaID, AlunoID, Nota_final, Presenca) VALUES(1, 1, '8.4', 80);   
INSERT INTO Matricula (TurmaID, AlunoID, Nota_final, Presenca)  VALUES(1, 2, '6.4', 85);   
INSERT INTO Matricula (TurmaID, AlunoID, Nota_final, Presenca)  VALUES(1, 3, '5.0', 67);   
INSERT INTO Matricula (TurmaID, AlunoID, Nota_final, Presenca)  VALUES(1, 4, '9.4', 100);   
INSERT INTO Matricula (TurmaID, AlunoID, Nota_final, Presenca)  VALUES(1, 5, '8.7', 100); 
  
INSERT INTO Matricula VALUES(2, 1, '7.4', 80);   
INSERT INTO Matricula VALUES(2, 2, '7.4', 85);   
INSERT INTO Matricula VALUES(2, 3, '8.0', 80);   
INSERT INTO Matricula VALUES(2, 4, '7.4', 70);   
INSERT INTO Matricula VALUES(2, 5, '9.7', 100);   

INSERT INTO Matricula VALUES(3, 6, '8.4', 80);   
INSERT INTO Matricula VALUES(3, 7, '6.4', 85);   
INSERT INTO Matricula VALUES(3, 8, '5.0', 67);   
INSERT INTO Matricula VALUES(3, 9, '9.4', 100);   
INSERT INTO Matricula VALUES(3, 10, '8.7', 100); 
  
INSERT INTO Matricula VALUES(4, 6, '7.4', 80);   
INSERT INTO Matricula VALUES(4, 7, '9.4', 85);   
INSERT INTO Matricula VALUES(4, 8, '8.0', 80);   
INSERT INTO Matricula VALUES(4, 9, '7.4', 70);   
INSERT INTO Matricula VALUES(4, 10, '9.7', 100); 

INSERT INTO Matricula VALUES(9, 11, '7.4', 80);   
INSERT INTO Matricula VALUES(9, 12, '9.4', 85);   
INSERT INTO Matricula VALUES(9, 13, '8.0', 70);  

INSERT INTO Matricula VALUES(10, 14, '7.4', 80);   
INSERT INTO Matricula VALUES(10, 15, '9.4', 85);   
INSERT INTO Matricula VALUES(10, 1, '8.0', 70);  

INSERT INTO Matricula VALUES(11, 2, '7.4', 80);   
INSERT INTO Matricula VALUES(11, 3, '9.4', 85);   
INSERT INTO Matricula VALUES(11, 4, '8.0', 70);  

-- EXERCICIO 6 a
SELECT schema_name FROM INFORMATION_SCHEMA.SCHEMATA;
-- EXERCICIO 6 b
select * from information_schema.tables as t where t.table_schema = 'public';
-- EXERCICIO 6 c
SELECT * FROM INFORMATION_SCHEMA.COLUMNS as c where c.table_name IN (select table_name from information_schema.tables as t where t.table_schema = 'public');
-- EXERCICIO 6 d
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS as con where con.table_schema = 'public';

-- EXERCICIO 7
SELECT nome FROM Aluno;
-- EXERCICIO 8 Total de cursos: 10
Select Count(*) from Curso;
	
-- EXERCICIO 9 Quantos cursos foram ministrados pelo instrutor 'Leandro Siqueira'?
-- Se contar o mesmo curso oferecido em diferentes datas como cursos diferentes são 5
Select Count(*) from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID AND i.Nome = 'Leandro Siqueira';
-- Se contar o mesmo curso oferecido em diferentes datas como cursos iguais são 2
Select Count(*) From (Select Count(c.nome) from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID AND i.Nome = 'Leandro Siqueira' GROUP BY c.nome);

-- 10 Quantas horas de curso foram ministradas pelo instrutor 'Leandro Siqueira'? 840
Select SUM(c.Carga_horaria) as CargaHorarioTotal from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID AND i.Nome = 'Leandro Siqueira';
-- 11 Turmas por professor: "Jacqueline França"	4 "Rodrigo Carvalho"	6 "Leandro Siqueira"	5 "Diego Faria"	4
Select i.nome, Count(t.TurmaID) from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID GROUP BY i.nome;
-- 12 Quantas horas de curso foram ministradas por cada Instrutor "Jacqueline França"	480"Rodrigo Carvalho"	960"Leandro Siqueira"	840"Diego Faria"	960
Select i.nome, SUM(c.Carga_horaria) as CargaHorarioTotal from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID GROUP BY i.nome;
-- 13 Se os cursos pagam 100,00 por hora ministrada, quanto cada instrutor recebeu por ano? "Jacqueline França"	48000.00 "Rodrigo Carvalho"	96000.00 "Leandro Siqueira"	84000.00 "Diego Faria"	96000.00
Select i.nome, 100.00*SUM(c.Carga_horaria) as pagamento from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID GROUP BY i.nome;
-- 14 Quais instrutores deram mais que 850 horas de curso? Rodrigo Carvalho e Diego Faria
Select i.nome from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID GROUP BY i.nome HAVING  SUM(c.Carga_horaria) >= 850;
-- 15 Quantas turmas cada curso teve por ano? Unico curso que teve mais de uma turma por ano foi Python em 2016 com 2 turmas
(Select c.nome, EXTRACT(YEAR FROM t.Data_termino) as y, Count(t.TurmaID) as Turmas_Por_Ano from Turma as t, Instrutor as i, Curso as c where i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID GROUP BY c.nome, y) ORDER BY c.nome, y;

-- 16 6) Quais cursos o aluno 'Rodrigo Gomes Dias' cursou e qual foi a nota dele
-- em cada um?
Select c.Nome, m.nota_final from Curso as c, Turma as t, Instrutor as i, Matricula as m, Aluno as a where a.nome = 'Rodrigo Gomes Dias' AND a.AlunoID = m.AlunoID AND m.TurmaID = t.TurmaID AND i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID;
-- 17) Crie uma view que contenha o histórico dos alunos contendo as seguintes
-- informações: nome do aluno, CPF do aluno, endereço do aluno, curso
-- ministrado, data de inicio e termino do curso, nome do instrutor do
-- curso, carga horaria, nota final, presença.

Create or Replace View Historico as (Select a.Nome as AlunoNome, a.CPF, a.endereco, c.Nome as CursoNome, t.Data_inicio, t.Data_termino, i.nome as InstrutorNome, c.Carga_horaria, m.nota_final, m.Presenca from Curso as c, Turma as t, Instrutor as i, Matricula as m, Aluno as a where  a.AlunoID = m.AlunoID AND m.TurmaID = t.TurmaID AND i.InstrutorID = t.InstrutorID AND c.CursoID = t.CursoID);
Select * from Historico;
-- 18) Insira uma nova turma na tabela Turma
INSERT INTO Turma (TurmaID, Data_inicio, Data_termino, CursoID, InstrutorID) VALUES(20, to_date('2024-02-15', 'YYYY-MM-DD'), to_date('2024-11-15', 'YYYY-MM-DD'), 10, 4);


-- 19) Altere o nome do instrutor "Diego Faria" para "Diego Garcia Faria"
UPDATE Instrutor  set nome = 'Diego Garcia Faria' where nome='Diego Faria';
-- 20) Aumente a nota de todos alunos em 10%
UPDATE Matricula set nota_final = 1.1*nota_final;
-- 21) Remova o instrutor "Rodrigo Carvalho" da tabela instrutor. OBS: Observe
-- o que acontece com as turmas associadas ao instrutor "Rodrigo
-- Carvalho".
DELETE FROM Instrutor where  nome='Rodrigo Carvalho';
-- As turmas do instrutor rodrigo tambem foram deletadas devido ao cascade

-- 22) Mude o atributo "CNPJ" da tabela "Escola" para um tipo textual.

-- 23) Renomeie o atributo "CNPJ" para "CNPJ_Escola".
Alter table Escola rename column CNPJ to CNPJ_Escola;

-- 24) Remova o atributo "CNPJ_Escola".

Alter Table Escola drop column CNPJ_Escola;

-- Os registros foram deletados devido ao cascade
--25) Remova todos os registros da tabela "Instrutor”. OBS: Observe o que
-- acontece com os registros das tabelas que recebem o atributo
-- "InstrutorID" como foreign key.
DELETE FROM Instrutor;
-- 26) Remova o atributo "InstrutorID" da tabela "Instrutor".
Alter table Instrutor drop column InstrutorID cascade;
-- 27) Remova a tabela "Instrutor".
drop table Instrutor;
-- 28) Remova todas as tabelas do banco (esquema e conteúdo).

drop table if exists curso cascade;
drop table if exists turma cascade;
drop table if exists instrutor cascade;
drop table if exists escola cascade;
drop table if exists aluno cascade;
drop table if exists matricula cascade;

-- 29) Crie novamente as tabelas do banco de dados usando os scripts acima.
-- RODAR EXERCICIO 1 AO 5
-- 30) Adicione um atributo "valor_hora" na tabela "Curso" tipo REAL.
alter table Curso add column valor_hora REAL;

-- 31) Preencha o novo atributo “valor_hora” da tabela “Curso” com o valor 50
-- (cada curso paga R$ 50,00 por hora ministrada).
update Curso set valor_hora=50;
-- 32) Crie uma nova tabela chamada “instrutor_pagamento” que contenha os
-- seguintes atributos: (1) o id do instrutor ( PK - FK da tabela instrutor),
-- (2) ano (PK - tipo INT) e (3) valor_pagamento (tipo REAL).
-- 33) Insira na tabela "instrutor_pagamento" o valor que cada instrutor
-- recebeu por ano.
CREATE TABLE Instrutor_Pagamento ( 
	
	InstrutorID        INT 			NOT NULL,
	AnoID        INT 			NOT NULL,
    valor_pagamento  			REAL  	NOT NULL,
    CONSTRAINT InstrutorPagamentoPK PRIMARY KEY ( InstrutorID, AnoID), 
    CONSTRAINT InstrutorPagamentoFK 	FOREIGN KEY (InstrutorID) 
    							REFERENCES Instrutor(InstrutorID)
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);
-- 34) Faça uma trigger que atualiza o valor do pagamento do instrutor toda vez
-- que inserirmos uma nova turma no sistema.
-- 35) Insira 3 turmas novas em 2019 para alguns instrutores e confira se sua
-- trigger está funcionando e atualizando a tabela "instrutor_pagamento"
-- corretamente.