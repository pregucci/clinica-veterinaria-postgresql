-- Atendimento de Rex
INSERT INTO atendimentos
(data_atendimento, id_atendente, id_cliente, id_animal, id_veterinario, descricao)
SELECT
    '2026-09-10 09:00:00',
    a.id_pessoa,
    c.id_pessoa,
    an.id_animal,
    v.id_pessoa,
    'Consulta de rotina e avaliação geral.'
FROM atendentes a
JOIN pessoas pa ON pa.id_pessoa = a.id_pessoa
JOIN clientes c ON c.id_pessoa = (SELECT id_pessoa FROM pessoas WHERE cpf = '11111111111')
JOIN animais an ON an.id_cliente = c.id_pessoa AND an.nome = 'Rex'
JOIN veterinarios v ON v.id_pessoa = (SELECT id_pessoa FROM pessoas WHERE cpf = '44444444444')
WHERE pa.cpf = '33333333333'
AND NOT EXISTS (
    SELECT 1 FROM atendimentos at
    WHERE at.data_atendimento = '2026-09-10 09:00:00'
      AND at.id_animal = an.id_animal
);

-- Itens do atendimento: serviço + produto
INSERT INTO atendimento_itens (id_atendimento, id_servico, quantidade, valor_unitario)
SELECT at.id_atendimento, s.id_servico, 1, s.valor
FROM atendimentos at
JOIN servicos s ON s.nome = 'Consulta clínica'
WHERE at.data_atendimento = '2026-09-10 09:00:00'
  AND NOT EXISTS (
      SELECT 1 FROM atendimento_itens ai
      WHERE ai.id_atendimento = at.id_atendimento
        AND ai.id_servico = s.id_servico
  );

INSERT INTO atendimento_itens (id_atendimento, id_produto, quantidade, valor_unitario)
SELECT at.id_atendimento, p.id_produto, 1, 35.00
FROM atendimentos at
JOIN produtos p ON p.descricao = 'Vermífugo para cães'
WHERE at.data_atendimento = '2026-09-10 09:00:00'
  AND NOT EXISTS (
      SELECT 1 FROM atendimento_itens ai
      WHERE ai.id_atendimento = at.id_atendimento
        AND ai.id_produto = p.id_produto
  );
