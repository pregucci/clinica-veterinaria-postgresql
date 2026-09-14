INSERT INTO produtos (tipo, marca, descricao, valor_compra)
SELECT 'Medicamento', 'VetLife', 'Vermífugo para cães', 35.00
WHERE NOT EXISTS (
    SELECT 1 FROM produtos WHERE descricao = 'Vermífugo para cães'
);

INSERT INTO produtos (tipo, marca, descricao, valor_compra)
SELECT 'Higiene', 'PetClean', 'Shampoo veterinário', 28.50
WHERE NOT EXISTS (
    SELECT 1 FROM produtos WHERE descricao = 'Shampoo veterinário'
);

INSERT INTO servicos (nome, descricao, valor)
VALUES
('Consulta clínica', 'Consulta veterinária de rotina', 120.00),
('Vacinação', 'Aplicação de vacina', 80.00),
('Banho', 'Banho higiênico para animal', 60.00)
ON CONFLICT (nome) DO NOTHING;
