create database loja_aula2;

create table LinhaDeProdutos (
	linhaDeProdutos int not null auto_increment,
    descricaoProduto varchar(200) not null,
    descricaoHtml varchar(50) not null,
    imagem blob not null,
    primary key (linhaDeProdutos) 
);

create table escritorios(
	codigoEscritorio int not null auto_increment,
    cidade varchar(20) not null,
    telefone varchar(11) not null,
    endereco1 varchar(30) not null,
    endereco2 varchar(30),
    estado varchar(20) not null,
    pais varchar(20) not null,
    codigoPostal varchar(8) not null,
    teritorio varchar(30) not null,
    primary key (codigoEscritorio)
);

create table Produtos(
	codigoProduto int not null auto_increment,
    nomeProduto varchar(30) not null,
    linhaDeProdutos int not null,
    escalaProduto int not null,
    vendedorProduto varchar(30) not null,
    descricaoProduto varchar(200) not null,
    quantidadeEstoque int not null,
    precoCompra numeric(10,2) not null,
    msrp numeric(10,2) not null,
    primary key(codigoProduto),
    constraint fk_produtos_linhaDeProdutos foreign key (linhaDeProdutos) references LinhaDeProdutos(linhaDeProdutos)
);



create table empregados(
	
	idEmpregado int not null auto_increment,
    ultimoNome varchar(10) not null,
    primeiroNome varchar(10) not null,
    extensao varchar(20) not null,
    email varchar(100) not null,
    codigoEscritorio int not null,
    relatoriosPara int not null,
    cargo varchar(20) not null,
    primary key(idEmpregado),
    constraint  fk_empregados_escritorios foreign key (codigoEscritorio) references escritorios(codigoEscritorio),
	constraint  fk_relatorios_superior foreign key (relatoriosPara) references empregados(idEmpregado)
);




create table clientes(
	idCliente int not null auto_increment,
    nomeCliente varchar(30) not null,
    contatoUltimoNome varchar(15) not null,
    contatoPrimeiroNome varchar(15) not null,
    telefone varchar(11) not null,
    endereco1 varchar(50) not null,
    endereco2 varchar(50),
    cidade varchar(20) not null,
    estado varchar(20) not null,
    codigoPostal varchar(8) not null,
    pais varchar(20) not null,
    vendedorResponsavel int not null,
    limiteCredito numeric(10,2) not null,
    primary key(idCliente),
    constraint fk_clientes_empregados foreign key (vendedorResponsavel) references empregados(idEmpregado)
);



create table pagamento(
	idCliente int not null,
    numeroDoCheque int not null,
    dataPagamento date not null,
    quantidade int not null,
    primary key (idCliente, numeroDoCheque),
    constraint fk_pagamento_cliente foreign key (idCliente) references clientes(idCliente)
	


);


create table pedidos(
	numeroPedido int not null auto_increment,
    dataPedito date not null,
    dataRequerida date not null,
    dataEnvio date not null,
    condicao varchar(20) not null,
    idCliente int not null,
    primary key (numeroPedido),
    constraint fk_pedidos_clientes foreign key (idCliente) references clientes(idCliente)




);


create table detalhesPedido(
	numeroPedido int not null,
    codigoProduto int not null,
    quantidadeEncomendada int not null,
    precoUnitario numeric(10,2) not null,
    numeroDeLinhaDoProduto int not null,
    primary key (numeroPedido, codigoProduto),
    constraint fk_detalhesPedido_Pedidos foreign key (numeroPedido) references pedidos(numeroPedido),
	constraint fk2_detalhesPedido_Produtos foreign key (codigoProduto) references Produtos(codigoProduto)


);


describe clientes;
describe LinhaDeProdutos;


alter table LinhaDeProdutos modify column imagem blob;


insert into LinhaDeProdutos (descricaoProduto, descricaoHtml, imagem) values('produtos para uso de limpeza da area externa de imoveis', 'quiboa.com', null);
insert into LinhaDeProdutos (descricaoProduto, descricaoHtml, imagem) values('produtos para higienização da boa', 'colgate.com', null);

describe Produtos;

insert into Produtos (nomeProduto, LinhaDeProdutos, escalaProduto, vendedorProduto, descricaoProduto, quantidadeEstoque, precoCompra, msrp) values ('colgate', 2, "100", 'Colgate', 'colgate é uma pasta dental', '50', '1.25', '2.00'); 
insert into Produtos (nomeProduto, LinhaDeProdutos, escalaProduto, vendedorProduto, descricaoProduto, quantidadeEstoque, precoCompra, msrp) values ('quiboa', 1, "200", 'quiboa', 'quiboa é uma água sanitaria', '50', '7', '8.5'); 

create database bd4;describe escritorios;

insert into escritorios (cidade, telefone, endereco1, estado, pais,codigoPostal, teritorio) values('Ituiutaba', '34940028922', 'rua 1', 'mg', 'brasil', '38800000', 'america latina');
insert into escritorios (cidade, telefone, endereco1, estado, pais,codigoPostal, teritorio) values('sao gotardo', '34940028922', 'rua 4', 'mg', 'brasil', '38800000', 'america latina');
