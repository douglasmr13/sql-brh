-- CRIA��O DE PROCEDURE PARA INCLUS�O DE PROJETO

CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_NOME IN BRH.PROJETO.NOME%type,
    p_RESPONSAVEL IN BRH.PROJETO.RESPONSAVEL%type
)
IS
BEGIN
    INSERT INTO BRH.PROJETO (NOME, RESPONSAVEL, INICIO) 
    VALUES (p_NOME, p_RESPONSAVEL, SYSDATE);
END;

EXECUTE brh.insere_projeto('Teste Inser��o', 'X123');

SELECT * FROM BRH.PROJETO;

-- CRIA��O DE FUN��O PARA C�LCULO DE IDADE

CREATE OR REPLACE FUNCTION brh.calcula_idade (
    p_DATA_NASCIMENTO IN DATE
)
RETURN NUMBER
IS
    v_IDADE NUMBER;
BEGIN
    v_IDADE := FLOOR(MONTHS_BETWEEN(SYSDATE, p_DATA_NASCIMENTO)/12);
    RETURN v_IDADE;
END;

-- TESTE DE FUN��O

SELECT brh.calcula_idade (TO_DATE('1984-06-13', 'YYYY-MM-DD')) FROM DUAL;

SELECT DATA_NASCIMENTO, brh.calcula_idade(DATA_NASCIMENTO) AS IDADE FROM BRH.DEPENDENTE; 

-- CRIA��O DE FUN��O PARA FINALIZA��O DE PROJETO

CREATE OR REPLACE FUNCTION brh.finaliza_projeto (
    p_ID IN BRH.PROJETO.ID%type
)
RETURN DATE
IS
   v_FIM DATE;
BEGIN
   v_FIM := SYSDATE;
   UPDATE BRH.PROJETO
   SET FIM = v_FIM WHERE ID = p_ID;
   
   RETURN v_FIM;
END;

-- TESTE DA FUN��O

SET SERVEROUTPUT ON;

DECLARE
    v_ID NUMBER := 1;
    v_FIM DATE;
BEGIN
    v_FIM := brh.finaliza_projeto(v_ID);
    dbms_output.put_line('Fim do projeto em ' || v_FIM);
END;

SELECT * FROM BRH.PROJETO;

-- VALIDA��O DE NOVOS PROJETOS

CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_NOME IN BRH.PROJETO.NOME%type,
    p_RESPONSAVEL IN BRH.PROJETO.RESPONSAVEL%type
)
IS
BEGIN
    IF LENGTH(p_NOME) < 2 OR p_NOME IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nome de projeto inv�lido! Deve ter dois ou mais caracteres.');
    ELSE 
        INSERT INTO BRH.PROJETO (NOME, RESPONSAVEL, INICIO) 
        VALUES (p_NOME, p_RESPONSAVEL, SYSDATE);
    END IF;
END;

-- TESTE PROCEDURE

EXECUTE brh.insere_projeto('K', 'X123');