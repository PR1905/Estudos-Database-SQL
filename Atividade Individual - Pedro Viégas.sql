

create table notas.empresa (
	idempresa serial primary key,
	razaosocial varchar(100),
	endereco varchar(120),
	cnpj varchar(20)
);

create table notas.cliente (
	idcliente serial primary key,
	nome varchar(100),
	endereco varchar(120),
	telefone varchar(20),
	cpf varchar(11)
);

create table notas.marca (
	idmarca serial primary key,
	nmmarca varchar(80),
	contato varchar(100),
	imagem bytea,
	ativo boolean
);

create table notas.produto (
	idproduto serial primary key,
	nmproduto varchar(150),
	quant_estoque integer,
	preco double precision,
	custo double precision,
	vlimposto double precision,
	idmarca integer references notas.marca
);

create table notas.documento (
	iddocumento serial primary key,
	serie varchar(3),
	idcliente integer references notas.cliente,
	idempresa integer references notas.empresa,
	valortotal double precision,
	dtemissao date,
	numero_doc varchar(10),
	tipodoc varchar(1)
);

create table notas.documento_itens (
	iddocitem serial primary key,
	idproduto integer references notas.produto,
	iddocumento integer references notas.documento,
	vlunitario double precision,
	quantidade integer,
	custo double precision,
	vldesconto double precision,
	vlimposto double precision
);

insert into notas.empresa
	(razaosocial, endereco, cnpj)
	values
	('Distribuidora Pague 3 e Leve 1', 'Avenida Marechal, 123 - Centro - Teresópolis', '12345678000195'),
	('Loja O Amigo da Vizinhaça', 'Rua das Flores, 52 - Alto', '526598566000152');
	
insert into notas.empresa
	(idempresa)
	values
	(001),
	(002);
	
insert into notas.cliente
    (idcliente, nome, endereco, telefone, cpf)
    values
	(001, 'Ernesto da Silva', 'Rua Labrador 150', '40028922', '187326718790'),
    (002, 'Beatriz Portugal', 'Avenida Jeremias Brasileiro 53', '929381903', '12378645618'),
	(003, 'Almir Costa', 'Alameda Oscar Niemeyer 77', '987624790', '18265448911'),
	(004, 'Humberto Neto', 'Rua Um 34', '912893747', '18235698711'),
	(005, 'Alverinda Margarida', 'Avenida José Alves de Azevedo 87', '981450098', '16285990431'),
	(006, 'Jacob Jeffrey Peralta', 'Avenida do Brooklyn 99', '976849000', '11787690584'),
	(007, 'Raquel Andrade', 'Rua Doutor Paulo Fernando 75', '987786432', '12332145600'),
	(008, 'Tabitha José', 'Rua Mondrian 98', '923781988', '15792860411'),
	(009, 'John Lennon', 'Rua dos Beatles 85', '952349877', '87699902344'),
	(010, 'Karen Dunne', 'Rua Warren 32', '987659900', '11654328901');
	
INSERT INTO notas.marca 
	(idmarca, nmmarca, contato, ativo) 
	VALUES 
	(1, 'Autopeças Geraldo', '987651232', true),
	(2, 'Pharmaceutica', '982719881', false),
	(3, 'Alimenticia', '987612341', true),
	(4, 'Soluções Tecnológicas', '923871662', true),
	(5, 'Artigos de Luxo', '976672813', false),
	(6, 'Vestimentas', '917724661', false),
	(7, 'Artigos de Pescaria', '916662341', true),
	(8, 'Papelaria', '25512887', true),
	(9, 'Loja de Jogos', '999990523', true),
	(10, 'Peças Eletrônicas', '28839113', false);
	
INSERT INTO notas.produto
	(nmproduto, quant_estoque, preco, custo, vlimposto, idmarca)
	VALUES
	('Cereal Sucrilhos', 10, 8.50, 6, 1.50, 3),
	('Medicamento para pressão', 75, 25., 20, 5.00, 2),
	('Relógio Luxuoso', 3, 3500.00, 2750 250.00, 5),
	('Kit Canetas', 15, 10.00, 5, 2.5, 8),
	('Controle Videogame', 15, 250.00, 175, 25.00, 9),
	('PCB Controlador', 25, 20.00, 15, 2.5, 10),
	('Kit Vara e Anzol', 20, 300.00, 250, 50.00, 7),
	('Kit Memória RAM 8GB', 40, 80.00, 60, 15.00, 4),
	('Casaco Moletom', 10, 80.00, 60, 25.00, 6),
	('Kit Radiador Fiat Uno', 2, 200.00, 70, 50.00, 1);
	
INSERT INTO notas.documento
	(serie, idcliente, idempresa, valortotal, dtemissao, numero_doc, tipodoc)
	VALUES
	('001', 2, 2, 3500, '26-03-2023', 5, 'V'),
	('002', 3, 1, 40, '22-03-2023', 4, 'C'),
	('003', 4, 2, 80, '20-03-2023', 1, 'T'),
 	('004', 4, 2, 10, '18-03-2023', 6, 'D'),
	('005', 5, 1, 10, '16-03-2023', 2, 'V'),
	('006', 4, 1, 15, '15-03-2023', 11, 'V'),
	('007', 2, 1, 200, '13-03-2023', 2, 'V'),
	('008', 3, 1, 250, '14-03-2023', 3, 'T'),
	('009', 7, 2, 300, '06-03-2023', 8, 'D'),
	('010', 8, 1, 10, '14-03-2023', 7, 'C');
	
INSERT INTO notas.documento_itens
	(idproduto, iddocumento, vlunitario, quantidade, custo, vldesconto, vlimposto)
	VALUES
 	(1, 2, 8.5, 1, 6, 0, 1.5),
	(2, 1, 50, 2, 40, 0, 2),
	(3, 5, 3500, 1, 2750, 0, 250),
	(4, 3, 15, 1, 10, 0, 2.5),
	(5, 4, 2750, 1, 5, 0, 2.0),
	(6, 4, 3000, 3, 6, 0, 2.5),
	(7, 5, 100, 2, 6, 2, 50),
	(8, 7, 250, 2, 7, 0, 100),
	(9, 9, 200, 5, 8, 0, 175),
	(10, 2, 100, 5, 9, 0, 25)
