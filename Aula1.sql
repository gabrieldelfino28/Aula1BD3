use master;
drop database bd3;
create database bd3;
use bd3;

create table tab_vda(
	id int identity(1,1)not null,
	data date,
	id_l int not null,
	vlr decimal(6,2) not null,
	primary key (id)
);

create table tab_cod_prod(
	id int identity(1,1)not null,
	nome nvarchar(100) not null, 
	preco decimal(6,2) not null,
	primary key (id)
);

create table tab_prod_vendido(
	id int identity(1,1)not null,
	id_vda int not null,
	id_prod int not null,
	qtd int not null,
	primary key (id),
	
);

create table tab_cliente(
	id int identity(1,1)not null,
	nome varchar(150)not null,
	primary key (id),
);

go

alter table tab_vda
add constraint fk_vda_cliente
foreign key (id_l) references tab_cliente(id)

alter table tab_prod_vendido
add constraint fk_prod_vendido_codprod
foreign key (id_prod) references tab_cod_prod(id)

alter table tab_prod_vendido
add constraint fk_prod_vendido_vda
foreign key (id_vda) references tab_vda(id)

go

INSERT INTO tab_cod_prod (nome, preco) VALUES ('Monitor', 500.00);
INSERT INTO tab_cod_prod (nome, preco) VALUES ('Mouse', 40.00);
INSERT INTO tab_cod_prod (nome, preco) VALUES ('Teclado', 10.00);
INSERT INTO tab_cliente (nome) VALUES ('Izuku');
INSERT INTO tab_vda (data, id_l, vlr) VALUES('2020-02-21',1,550.00);
INSERT INTO tab_prod_vendido (id_prod, id_vda, qtd) VALUES (1,1,3);
