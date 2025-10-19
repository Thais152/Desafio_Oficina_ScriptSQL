-- Criação do banco de dados para o cenário de Oficina Desafio

-- drop database Oficina;
CREATE DATABASE Oficina;
USE Oficina;

-- Tabela cliente Pai
CREATE TABLE Clients(
	idClient int primary key auto_increment,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Address varchar(255)
);

-- Tabela filha de cliente: pessoa física
create table pessoaFísica(
	idPF int auto_increment,
    idPFclient int,
    primary key (idPF, idPFclient),
	CPF char(11) not null,
    data_nascimento DATE,
    contact char(11) not null,
	constraint unique_cpf_client unique (CPF),
    constraint fk_PF_client foreign key (idPFclient) references Clients (idClient)
);

-- Tabela filha de cliente: pessoa jurídica
create table pessoaJuridica(
	idPJ int auto_increment,
    idPJclient int,
	primary key (idPJ, idPJclient),
	CNPJ char(15) not null,
    socialName varchar(255) not null,
    contact char(11) not null,
	constraint unique_cnpj_client unique (CNPJ),
	constraint fk_PJ_client foreign key (idPJclient) references Clients (idClient)
);

-- Tabela do time responsável
CREATE TABLE ResponsibleTeam(
	idResponsibleTeam INT primary key auto_increment,
    TeamName varchar(45)
);

-- Tabela do mecânico
CREATE TABLE Mechanic(
	idMechanic INT PRIMARY KEY AUTO_INCREMENT,
    idMechanicTeam INT,
    Fname varchar(10),
	Minit char(3),
    Lname varchar(20),
    Address varchar(255),
    specialty varchar(150),
    constraint fk_Mechanic_Team foreign key (idMechanicTeam) references ResponsibleTeam (idResponsibleTeam)
);

-- Tabela do pedido
CREATE TABLE Orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    idOrderTeam int,
    PaymentType enum ('Dinheiro', 'PIX', 'Cartão de crédito'),
    orderType enum ('1. Manutenção preventiva', '2. Reparos corretivos',
		'3. Diagnósticos e serviços adicionais'),
    orderDescription varchar(255),
    vehicleType enum ('Moto', 'Carro'),
    released bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references Clients(idClient),
    constraint fk_orders_team foreign key (idOrderTeam) references ResponsibleTeam (idResponsibleTeam)
		on update cascade
);

-- Tabela ordem de serviço
CREATE TABLE serviceOrder(
	idServiceOrder INT primary key auto_increment,
    idServiceOrderOrder int,
    IssueDate DATE not null,
    serviceOrderStatus enum('Finalizado', 'Em preparação', 'Em trabalho') default 'Em preparação',
    completionDate DATE,
    constraint fk_serviceOrder_order foreign key (idServiceOrderOrder) references Orders (idOrder)
);

-- Tabela peças 
CREATE TABLE piece(
	idPiece INT primary key auto_increment,
    pieceType varchar(45),
    pieceValue float,
    pieceQuantity int
);

-- Tabela serviços 
CREATE TABLE service(
	idService INT primary key auto_increment,
    serviceType varchar(45),
    serviceDescription varchar(255),
    serviceValue float
);

-- Tabela peças/ordem de serviço
CREATE TABLE serviceOrderPiece(
	idSOPserviceOrder int,
    idSOPpiece int,
    constraint fk_SOP_serviceOrder foreign key (idSOPserviceOrder) references serviceOrder(idServiceOrder),
	constraint fk_SOP_piece foreign key (idSOPpiece) references piece(idPiece)

);

-- Tabela serviços/ordem de serviço
CREATE TABLE serviceOrderService(
	idSOSserviceOrder int,
    idSOSservice int,
    constraint fk_SOS_serviceOrder foreign key (idSOSserviceOrder) references serviceOrder(idServiceOrder),
	constraint fk_SOS_service foreign key (idSOSservice) references service(idService)
);

























