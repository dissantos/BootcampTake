CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
--RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT coalesce($1,0) + coalesce($2,0);
$$;

select func_somar(1,null);


CREATE OR REPLACE FUNCTION banco_add (p_numero INTEGER, p_nome VARCHAR, P_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
DECLARE variavel_id INTEGER;
BEGIN
	if p_nome IS NULL or p_numero IS NULL or p_ativo IS NULL THEN
		RETURN 0;
	END IF;

	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	IF variavel_id IS NULL THEN
		INSERT INTO banco (numero, nome, ativo) VALUES (p_numero, p_nome, p_ativo);
	ELSE
		RETURN variavel_id;
	END IF;
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	RETURN variavel_id;
END;
$$;

select banco_add(null, 'Teste', true);

select banco_add(5432,'Banco Novo', False);
select * from banco where numero = 5432;
