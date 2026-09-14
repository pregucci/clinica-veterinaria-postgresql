-- Dados de exemplo para pessoas e seus papéis

INSERT INTO pessoas (nome, cpf, email, telefone)
VALUES
('Ana Souza', '11111111111', 'ana@email.com', '69999990001'),
('Bruno Lima', '22222222222', 'bruno@email.com', '69999990002'),
('Carla Mendes', '33333333333', 'carla@email.com', '69999990003'),
('Diego Alves', '44444444444', 'diego@email.com', '69999990004')
ON CONFLICT (cpf) DO NOTHING;

INSERT INTO clientes (id_pessoa)
SELECT id_pessoa FROM pessoas
WHERE cpf IN ('11111111111', '22222222222', '44444444444')
ON CONFLICT DO NOTHING;

-- Carla será apenas atendente.
INSERT INTO atendentes (id_pessoa)
SELECT id_pessoa FROM pessoas
WHERE cpf = '33333333333'
ON CONFLICT DO NOTHING;

-- Ana também será atendente, demonstrando que uma pessoa
-- pode exercer mais de uma função.
INSERT INTO atendentes (id_pessoa)
SELECT id_pessoa FROM pessoas
WHERE cpf = '11111111111'
ON CONFLICT DO NOTHING;

INSERT INTO veterinarios (id_pessoa, crmv, especialidade)
SELECT id_pessoa, 'CRMV-RO-1001', 'Clínica de pequenos animais'
FROM pessoas WHERE cpf = '44444444444'
ON CONFLICT DO NOTHING;
