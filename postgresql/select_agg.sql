select * from cliente_transacoes;

select AVG(valor) from cliente_transacoes;

select count(numero) from cliente;
select count(numero), email from cliente group by email;

select max(valor) from cliente_transacoes;
select min(valor) from cliente_transacoes;
select max(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id;

select count(id), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id having count(id) > 150;

select sum(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id;
select sum(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id order by tipo_transacao_id;
