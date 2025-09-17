CREATE DATABASE projetointegrador;
USE projetointegrador;

-- PROFISSIONAL
CREATE TABLE profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cnpj VARCHAR(18),
    data_nascimento DATE,
    profissao VARCHAR(100),
    valor_referencial DECIMAL(10,2),
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    genero ENUM('M', 'F', 'Outro')
);

-- CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(15),
    genero ENUM('M', 'F', 'Outro'),
    email VARCHAR(255) NOT NULL
);

-- ENDEREÇO (pode ser usado por cliente ou profissional)
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(255),
    numero VARCHAR(10),
    cep VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    profissional_id INT,
    cliente_id INT,
    FOREIGN KEY (profissional_id) REFERENCES profissional(id_profissional),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

-- CONTATO (chat entre cliente e profissional)
CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    profissional_id INT NOT NULL,
    cliente_id INT NOT NULL,
    remetente ENUM('profissional', 'cliente') NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (profissional_id) REFERENCES profissional(id_profissional),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

-- AGENDA DO PROFISSIONAL
CREATE TABLE agenda_profissional (
    id_agenda INT AUTO_INCREMENT PRIMARY KEY,
    profissional_id INT NOT NULL,
    dia_semana ENUM('Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    FOREIGN KEY (profissional_id) REFERENCES profissional(id_profissional)
);

-- INSERINDO DADOS DE TESTE
INSERT INTO profissional (nome, cpf, cnpj, data_nascimento, profissao, valor_referencial, email, telefone, genero)
VALUES
    ('João Silva', '123.456.789-00', '12.345.678/0001-90', '1980-05-20', 'Médico', 5000.00, 'joao.silva@email.com', '(11) 98765-4321', 'M'),
    ('Maria Oliveira', '987.654.321-00', '98.765.432/0001-98', '1992-08-15', 'Nutricionista', 7000.00, 'maria.oliveira@email.com', '(21) 91234-5678', 'F');

INSERT INTO cliente (nome, cpf, data_nascimento, telefone, genero, email)
VALUES
    ('Carlos Souza', '112.233.445-66', '1990-03-10', '(11) 99876-5432', 'M', 'carlos.souza@email.com'),
    ('Ana Pereira', '223.344.556-77', '1985-12-25', '(21) 98765-4321', 'F', 'ana.pereira@email.com');

INSERT INTO endereco (logradouro, numero, cep, bairro, cidade, estado, profissional_id, cliente_id)
VALUES
    ('Rua A', '123', '12345-678', 'Bairro X', 'Cidade Y', 'SP', 1, NULL),
    ('Avenida B', '456', '98765-432', 'Bairro Z', 'Cidade W', 'RJ', 2, NULL),
    ('Rua C', '789', '55555-111', 'Bairro Q', 'Cidade Z', 'MG', NULL, 1),
    ('Rua D', '101', '66666-222', 'Bairro R', 'Cidade V', 'PR', NULL, 2);

INSERT INTO contato (profissional_id, cliente_id, remetente, mensagem)
VALUES
    (1, 1, 'profissional', 'Olá Carlos, tudo bem? Podemos marcar sua consulta.'),
    (1, 1, 'cliente', 'Olá Dr. João, gostaria sim! Qual horário tem disponível?'),
    (2, 2, 'profissional', 'Oi Ana, já revisei seu plano alimentar.'),
    (2, 2, 'cliente', 'Obrigada Maria, vou seguir direitinho!');

INSERT INTO agenda_profissional (profissional_id, dia_semana, hora_inicio, hora_fim)
VALUES
    (1, 'Segunda', '09:00:00', '12:00:00'),
    (1, 'Quarta', '14:00:00', '18:00:00'),
    (2, 'Terça', '08:30:00', '12:30:00'),
    (2, 'Quinta', '10:00:00', '16:00:00');
