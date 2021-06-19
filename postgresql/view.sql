SELECT numero, nome, ativo
FROM banco;

CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT * FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT * FROM vw_bancos2;

INSERT INTO vw_bancos2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco Teste', TRUE);

SELECT * FROM vw_bancos2 where banco_numero = 51;
SELECT * FROM banco where numero = 51;

UPDATE vw_bancos2 SET banco_ativo = FALSE WHERE banco_numero = 51;

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS(
	SELECT nome FROM agencia
);

select * from vw_agencia;


CREATE OR REPLACE VIEW vw_bancos_ativo AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativo (numero,nome, ativo) VALUES (42,'Banco teste 2', FALSE);

CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL,
	nome VARCHAR(60),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios(id)
);

INSERT INTO funcionarios (nome, gerente) VALUES ('Ancelmo', NULL);
INSERT INTO funcionarios (nome, gerente) VALUES ('Bruna', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Carlos', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Daniel', 2);

CREATE OR REPLACE RECURSIVE VIEW vw_func (id, gerente_nome, funcionario) AS (
	SELECT f.id, CAST('' AS VARCHAR(60)) as gerente_nome, f.nome
	from funcionarios f
	where f.gerente is NULL
	
	UNION ALL
	
	select funcionarios.id, vw_func.funcionario, funcionarios.nome
	from funcionarios
	join vw_func on vw_func.id = funcionarios.gerente
);


SELECT * from vw_func;


