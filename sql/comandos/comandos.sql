--cadastro de endereço do colaborador
INSERT INTO brh.endereco (cep, uf, cidade, bairro) 
VALUES ('01928-374', 'MG', 'Belo Horizonte', 'Parque da Saudade');

-- cadastro do novo colaborador
INSERT INTO brh.colaborador (matricula, nome, cpf, salario, departamento, cep, logradouro, complemento_endereco) 
VALUES ('Z124', 'Fulano de Tal', '098.987.876-76', '12500', 'DEPTI', '01928-374', 'Rua Legal', 'Condomínio Tranquilo');

-- cadastro dos telefones
INSERT INTO brh.telefone_colaborador (colaborador, numero, tipo) 
VALUES ('Z124', '(61) 99999-9999', 'M');

INSERT INTO brh.telefone_colaborador (colaborador, numero, tipo) 
VALUES ('Z124', '(61) 3030-4040', 'R');

-- cadastro dos e-mails
INSERT INTO brh.email_colaborador (colaborador, email, tipo) 
VALUES ('Z124', 'fulanodetal@email.com', 'P');

INSERT INTO brh.email_colaborador (colaborador, email, tipo) 
VALUES ('Z124', 'fulanodetal@corporativo.com', 'T');

-- cadastro de dependentes

INSERT INTO brh.dependente (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('111.333.555-77', 'Z124', 'Cicrana de Tal', 'CÃ´njuge', to_date('1990-03-27', 'yyyy-mm-dd'));

INSERT INTO brh.dependente (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('222.444.666-88', 'Z124', 'Beltrana de Tal', 'Filho(a)', to_date('2021-03-11', 'yyyy-mm-dd'));

-- cadstro de projeto

INSERT INTO brh.projeto (id, nome, responsavel, inicio, fim) 
VALUES (5, 'BI', 'A123', to_date('2024-06-17', 'yyyy-mm-dd'), null);

-- cadastro de papel

INSERT INTO brh.papel (id, nome) 
VALUES (8, 'Especialista de Negócios');

-- atribuição ao projeto

INSERT INTO brh.atribuicao (projeto, colaborador, papel) 
VALUES (5, 'Z124', 8);
