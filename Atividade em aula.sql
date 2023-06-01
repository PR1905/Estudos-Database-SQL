create database turma04
create schema exemplo
create table exemplo.tplogradouro(
	idTpLogr serial primary key,
	descricao varchar(10),
	sigla varchar(5)
)
-- OU /*

SELECT <CAMPOS> FROM SCHEMA.TABLE <CONDIÇÕES>
select * from exemplo.tplogradouro order by descricao

insert into exemplo.tplogradouro
(descricao,sigla)
values
('Rua', 'R.'),
('Avenida', 'Av.'),
('Travessia', 'Tv.'),
('Estrada', 'Est'),
('Servidão', 'Serv'),
('Rodovia', 'Rod.')
