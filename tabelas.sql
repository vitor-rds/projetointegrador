create database projetointegrador;
use projetointegrador;

CREATE TABLE profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cnpj VARCHAR(18),
    data_nascimento DATE,
    profissao VARCHAR(100),
    valor_referencial DECIMAL(10,2),
    horario_atendimento TIME,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    genero ENUM('M', 'F', 'Outro'),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id_endereco)
);
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    endereco_id INT,
    telefone VARCHAR(15),
    genero ENUM('M', 'F', 'Outro'),
    email VARCHAR(255) NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id_endereco)
);
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(255),
    numero VARCHAR(10),
    cep VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);
CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    profissional_id INT,
    cliente_id INT,
    mensagem TEXT,
    FOREIGN KEY (profissional_id) REFERENCES profissional(id_profissional),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);



INSERT INTO endereco (logradouro, numero, cep, bairro, cidade, estado)
VALUES
    ('Rua A', '123', '12345-678', 'Bairro X', 'Cidade Y', 'SP'),
    ('Avenida B', '456', '98765-432', 'Bairro Z', 'Cidade W', 'RJ');

INSERT INTO profissional (nome, cpf, cnpj, data_nascimento, profissao, valor_referencial, horario_atendimento, email, telefone, genero, endereco_id)
VALUES
    ('João Silva', '123.456.789-00', '12.345.678/0001-90', '1980-05-20', 'Médico', 5000.00, '09:00:00', 'joao.silva@email.com', '(11) 98765-4321', 'M', 1),
    ('Maria Oliveira', '987.654.321-00', '98.765.432/0001-98', '1992-08-15', 'Advogada', 7000.00, '08:30:00', 'maria.oliveira@email.com', '(21) 91234-5678', 'F', 2);

INSERT INTO cliente (nome, cpf, data_nascimento, endereco_id, telefone, genero, email)
VALUES
    ('Carlos Souza', '112.233.445-66', '1990-03-10', 1, '(11) 99876-5432', 'M', 'carlos.souza@email.com'),
    ('Ana Pereira', '223.344.556-77', '1985-12-25', 2, '(21) 98765-4321', 'F', 'ana.pereira@email.com');

INSERT INTO contato (profissional_id, cliente_id, mensagem)
VALUES
    (1, 1, 'Olá Carlos, como posso ajudá-lo com seu problema médico?'),
    (2, 2, 'Oi Ana, em que posso lhe auxiliar em relação ao seu processo jurídico?');
    
    
    

select * from profissional;
select * from cliente;
select * from endereco;
select * from contato;