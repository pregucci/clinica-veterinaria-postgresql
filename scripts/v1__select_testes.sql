-- Consultas para conferir se os relacionamentos funcionaram.

SELECT
    an.nome AS animal,
    p.nome AS tutor,
    a.data_atendimento,
    pv.nome AS veterinario,
    a.descricao
FROM atendimentos a
JOIN animais an ON an.id_animal = a.id_animal
JOIN pessoas p ON p.id_pessoa = a.id_cliente
JOIN pessoas pv ON pv.id_pessoa = a.id_veterinario
ORDER BY a.data_atendimento;

SELECT
    a.id_atendimento,
    an.nome AS animal,
    COALESCE(pr.descricao, s.nome) AS item,
    ai.quantidade,
    ai.valor_unitario,
    ai.quantidade * ai.valor_unitario AS subtotal
FROM atendimento_itens ai
JOIN atendimentos a ON a.id_atendimento = ai.id_atendimento
JOIN animais an ON an.id_animal = a.id_animal
LEFT JOIN produtos pr ON pr.id_produto = ai.id_produto
LEFT JOIN servicos s ON s.id_servico = ai.id_servico
ORDER BY a.id_atendimento, ai.id_item;
