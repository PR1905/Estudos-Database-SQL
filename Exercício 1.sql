create database caixa

create schema sistema
drop table sistema.produto

create table sistema.produto(
	idproduto integer,
	nmproduto varchar(150),
	codigo varchar(10),
	custo double precision,
	preco double precision,
	cod_barras varchar(13),
	tributacao varchar(1),
	idgrupo integer
)

create table sistema.fornecedor(
	idfornecedor integer,
	nmfornecedor varchar(100),
	cnpj varchar(15),
	endereco varchar(100),
	idcidade integer,
	idbairro integer
)

create table sistema.estoque(
	idproduto integer,
	dtestoque date,
	qtvenda double precision,
	qtcompra double precision,
	qtsaida double precision,
	qtentrada double precision,
	vlvenda double precision,
	vlcompra double precision,
	vlentrada double precision,
	vlsaida double precision,
	estoque double precision
)

create table sistema.cliente(
	idcliente integer,
	nome character varying(150),
	cnpj_cpf character varying(15),
	endereco character varying(150),
	idcidade integer,
	idbairro integer,
	rg character varying	
)

create table sistema.movimento(
	idmovimento integer,
	dia date,
	idpessoa integer,
	tipo_movimento varchar,
	quantidade double precision,
	valor_un double precision,
	desconto double precision,
	acrescimo double precision,
	imposto double precision
	
)

create table sistema.cidade(
	idcidade integer,
	nmcidade varchar(100),
	uf varchar(2)
)

create table sistema.bairro(
	idbairro integer,
	nmbairro varchar(100),
	idcidade integer
)

create table sistema.grupo(
	idgrupo integer,
	nmgrupo varchar(100)
)
