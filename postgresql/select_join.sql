SELECT count(1) from banco;
SELECT count(1) FROM agencia;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero
FROM banco JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

SELECT DISTINCT banco.numero
FROM banco JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM agencia RIGHT JOIN banco ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM agencia LEFT JOIN banco ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM agencia FULL JOIN banco ON agencia.banco_numero = banco.numero;

select banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
from banco join agencia ON agencia.banco_numero = banco.numero
join conta_corrente ON conta_corrente.banco_numero = agencia.banco_numero and conta_corrente.agencia_numero = agencia.numero
join cliente ON cliente.numero = conta_corrente.cliente_numero;


