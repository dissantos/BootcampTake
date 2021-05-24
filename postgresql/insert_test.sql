CREATE TABLE IF NOT EXISTS  teste(
	id serial PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS  teste(
	cpf VARCHAR(11),
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (cpf)
);

insert into teste (cpf,nome,created_at)
values ('12345678912', 'Jose Testado','2021-05-18 19:00:00');

insert into teste (cpf,nome,created_at)
values ('12345678912', 'Jose Testado','2021-05-18 19:00:00') on conflict (cpf) do nothing;