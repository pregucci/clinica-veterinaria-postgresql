-- DELETE de exemplo:
-- remove um item específico de um atendimento.
-- A subconsulta encontra o atendimento de Rex e o produto vermífugo.

DELETE FROM atendimento_itens ai
WHERE ai.id_item = (
    SELECT ai2.id_item
    FROM atendimento_itens ai2
    JOIN atendimentos a ON a.id_atendimento = ai2.id_atendimento
    JOIN animais an ON an.id_animal = a.id_animal
    JOIN produtos p ON p.id_produto = ai2.id_produto
    WHERE an.nome = 'Rex'
      AND p.descricao = 'Vermífugo para cães'
    LIMIT 1
);
