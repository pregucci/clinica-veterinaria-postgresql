INSERT INTO animais (nome, especie_classe, sexo, data_nascimento, id_cliente)
SELECT 'Rex', 'Cão', 'Macho', '2020-05-10', id_pessoa
FROM clientes JOIN pessoas USING (id_pessoa)
WHERE pessoas.cpf = '11111111111'
AND NOT EXISTS (
    SELECT 1 FROM animais a WHERE a.nome = 'Rex'
);

INSERT INTO animais (nome, especie_classe, sexo, data_nascimento, id_cliente)
SELECT 'Luna', 'Gato', 'Fêmea', '2022-08-15', id_pessoa
FROM clientes JOIN pessoas USING (id_pessoa)
WHERE pessoas.cpf = '22222222222'
AND NOT EXISTS (
    SELECT 1 FROM animais a WHERE a.nome = 'Luna'
);

INSERT INTO animais (nome, especie_classe, sexo, data_nascimento, id_cliente)
SELECT 'Thor', 'Cão', 'Macho', '2019-03-20', id_pessoa
FROM clientes JOIN pessoas USING (id_pessoa)
WHERE pessoas.cpf = '44444444444'
AND NOT EXISTS (
    SELECT 1 FROM animais a WHERE a.nome = 'Thor'
);
