-- CREATE ALUNO - TRIGGER - FUNCTION

CREATE SEQUENCE seq_ra START 1;

CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    ra VARCHAR (7) UNIQUE NOT NULL,
    nome VARCHAR (80) NOT NULL,
    sobrenome VARCHAR (80) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR (200),
    email VARCHAR (80),
    celular VARCHAR (20) NOT NULL
);

CREATE OR REPLACE FUNCTION gerar_ra() RETURNS TRIGGER AS $$
BEGIN
    NEW.ra := 'AAA' || TO_CHAR(nextval('seq_ra'), 'FM0000');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_gerar_ra
BEFORE INSERT ON Aluno
FOR EACH ROW EXECUTE FUNCTION gerar_ra();
-- CREATE LIVRO
CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR (200) NOT NULL,
    autor VARCHAR (150) NOT NULL,
    editora VARCHAR (100) NOT NULL,
    ano_publicacao VARCHAR (5),
    isbn VARCHAR (20),
    quant_total INTEGER NOT NULL,
    quant_disponivel INTEGER NOT NULL,
    valor_aquisicao DECIMAL (10,2),
    status_livro_emprestado VARCHAR (20)
);
-- CREATE EMPRESTIMO
CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_aluno INT REFERENCES Aluno(id_aluno),
    id_livro INT REFERENCES Livro(id_livro),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR (20)
);
-- ALUNO jm
INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Conor', 'McGregor', '2005-01-15', 'Rua UFC, 123', 'mcgregor@ufc.com', '16998959876'),
('Amanda', 'Nunes', '2004-03-22', 'Rua UFC, 456', 'amanda.nunes@ufc.com', '16995992305'),
('Angelina', 'Jolie', '2003-07-10', 'Rua Hollywood, 789', 'jolie@cinema.com', '16991915502'),
('Natalie', 'Portman', '2002-11-05', 'Rua Hollywood, 101', 'natalie.portman@cinema.com', '16993930703'),
('Shaquille', 'ONeal', '2004-09-18', 'Rua NBA, 202', 'shaquille@gmail.com', '16993937030'),
('Harry', 'Kane', '2000-05-18', 'Rua Futebol, 2024', 'kane@futi.com', '16998951983'),
('Jaqueline', 'Carvalho', '2001-12-10', 'Rua Volei, 456', 'jack@volei.com', '16991993575'),
('Sheilla', 'Castro', '2003-04-25', 'Rua Volei, 2028', 'sheilla.castro@volei.com', '16981974547'),
('Gabriela', 'Guimarães', '2007-08-19', 'Rua Volei, 2028', 'gaby@volei.com', '16983932215'),
('Magic', 'Johnson', '2003-07-08', 'Rua NBA, 1999', 'magic@gmail.com', '16993932020');

-- LIVRO jm
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '1954', '978-0007525546', 10, 10, 150.00, 'Disponível'),
('1984', 'George Orwell', 'Companhia das Letras', '1949', '978-8535906770', 8, 8, 90.00, 'Disponível'),
('Dom Quixote', 'Miguel de Cervantes', 'Penguin Classics', '1605', '978-0142437230', 6, 6, 120.00, 'Disponível'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', '1943', '978-8522008731', 12, 12, 50.00, 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', 'Penguin', '1945', '978-0141036137', 7, 7, 80.00, 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '1937', '978-0007458424', 9, 9, 140.00, 'Disponível'),
('O Conde de Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', '1844', '978-0140449266', 5, 5, 110.00, 'Disponível'),
('Orgulho e Preconceito', 'Jane Austen', 'Penguin Classics', '1813', '978-0141439518', 7, 7, 90.00, 'Disponível'),
('Moby Dick', 'Herman Melville', 'Penguin Classics', '1851', '978-0142437247', 4, 4, 100.00, 'Disponível'),
('Guerra e Paz', 'Liev Tolstói', 'Companhia das Letras', '1869', '978-8535922343', 3, 3, 130.00, 'Disponível');


-- ALUNO lh
INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Deon', 'Wilson', '2007-05-14', 'Rua JBL, 321', 'wilson.deon@gmail.com', '47888959876'),
('Helena', 'Gomes', '2003-03-22', 'Rua Brooklyn, 334', 'helena.gomes@ofc.com', '16995992459'),
('Hana', 'Yumehara', '2002-01-10', 'Rua Shibuya, 782', 'hara@yume@hotmail.com', '16991915098'),
('Peter', 'Olsen', '2001-12-04', 'Rua America, 120', 'natalie.portman@cinema.com', '16993930456'),
('Shawn', 'Mendes', '2006-08-18', 'Rua ASK, 204', 'mendes@gmail.com', '16923037030'),
('Henry', 'Bayers', '2000-05-18', 'Rua Soccer, 2022', 'bayer.hen@gmail.com', '78698951983'),
('Julia', 'Castro', '2001-12-10', 'Rua Tenis, 455', 'castrojulia@gmail.com', '16996673575'),
('Rafael', 'Aires', '2003-04-25', 'Rua Basketball, 2025', 'airesrafael@gmail.com', '16981972247'),
('Gabriela', 'Esteves', '2009-04-18', 'Rua Soccer, 2027', 'gaby@ste.com', '16983812215'),
('Yuji', 'Itadori', '2000-03-09', 'Rua CBA, 1992', 'itadori.yuji@gmail.com', '16994902020');


-- LIVRO
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('O Chamado de Cthulhu', 'H.P Lovecraft', 'Principis', '1928', '978-0007525754', 15, 2, 120.00, 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', 'Companhia das Letras', '1945', '978-8535906231', 5, 1, 80.00, 'Disponível'),
('Alice no País das Maravilhas', 'Lewis', 'Carroll', '1865', '978-0142437991', 6, 3, 150.00, 'Disponível'),
('It- A Coisa', 'Stephen King', 'Suma', '2014', '978-8522008788', 12, 10, 20.00, 'Disponível'),
('O Alquimista', 'Paulo Coelho', 'Paralela', '1988', '978-0141036013', 7, 2, 60.00, 'Disponível'),
('A Culpa É das Estrelas', 'Renata Pettengill', 'Intrínseca', '2012', '978-0007458453', 9, 6, 180.00, 'Disponível'),
('A Divina Comédia', 'Dante Alighieri', 'Editora 34', '1321', '978-0140449005', 10, 5, 100.00, 'Disponível'),
('Os Gatos de Ulthar', 'H.P Lovecraft', 'Skript', '1920', '978-0141439908', 7, 3, 90.00, 'Disponível'),
('O Poder do Silêncio', 'Eckhart Tolle', 'Editora Sextante', '2003', '978-0142437127', 4, 4, 35.00, 'Disponível'),
('O Homem de Giz', 'C.J. Tudor', 'Intrínseca', '2018', '978-8535922470', 3, 1, 170.00, 'Disponível');



-- Inserindo Emprestimos jm
INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(1, 2, '2024-09-01', '2024-09-15', 'Em andamento'),
(2, 1, '2024-09-02', '2024-09-16', 'Em andamento'),
(3, 5, '2024-09-03', '2024-09-17', 'Em andamento'),
(5, 3, '2024-09-04', '2024-09-18', 'Em andamento'),
(4, 6, '2024-09-05', '2024-09-19', 'Em andamento'),
(6, 4, '2024-09-06', '2024-09-20', 'Em andamento'),
(7, 8, '2024-09-07', '2024-09-21', 'Em andamento'),
(8, 7, '2024-09-08', '2024-09-22', 'Em andamento'),
(10, 9, '2024-09-09', '2024-09-23', 'Em andamento'),
(9, 10, '2024-09-10', '2024-09-24', 'Em andamento'),
(1, 10, '2024-09-11', '2024-09-25', 'Em andamento'),
(2, 3, '2024-09-11', '2024-09-25', 'Em andamento'),
(4, 5, '2024-09-11', '2024-09-25', 'Em andamento'),
(6, 2, '2024-09-11', '2024-09-25', 'Em andamento');


INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(20, 11, '2024-09-01', '2024-09-15', 'Em andamento'),
(19, 13, '2024-09-02', '2024-09-16', 'Em andamento'),
(18, 12, '2024-09-03', '2024-09-17', 'Em andamento'),
(15, 14, '2024-09-04', '2024-09-18', 'Em andamento'),
(16, 15, '2024-09-05', '2024-09-19', 'Em andamento'),
(17, 16, '2024-09-06', '2024-09-20', 'Em andamento'),
(14, 17, '2024-09-07', '2024-09-21', 'Em andamento'),
(12, 18, '2024-09-08', '2024-09-22', 'Em andamento'),
(13, 19, '2024-09-09', '2024-09-23', 'Em andamento'),
(10, 20, '2024-09-10', '2024-09-24', 'Em andamento'),
(11, 10, '2024-09-11', '2024-09-25', 'Em andamento');

