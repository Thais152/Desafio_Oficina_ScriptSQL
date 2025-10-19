-- Inserções SQL

USE Oficina;


show tables;
desc Clients;
-- idClient, Fname, Minit, Lname, Address
insert into Clients (Fname, Minit, Lname, Address)
	values('Ana', 'C', 'Moreira', 'rua silva de prata 29, Carangola - Cidade das flores'),
	      ('Miguel', 'O', 'Santos', 'rua alamenda 289, Centro - Cidade das flores'),
          ('Ricardo', 'F', 'Carvalho', 'avenida alamenda vinha 1009, Centro - Cidade das flores'),
          ('Julia', 'S', 'Silva', 'rua Laranjeiras 861, Centro - Cidade das flores'),
          ('Alice', 'G', 'Silva', 'avenida Koller 19, Centro - Cidade das flores'),
          ('Arthur', 'M', 'Leal', 'rua alameda das flores 28, Centro - Cidade das flores'),
          ('Sophia', 'H', 'Assis', 'avenida Madeira 40, Centro - Cidade das Laranjeiras'),
          ('Bernardo', 'J', 'Oliveira', 'rua chuva branca 08, Floresta - Cidade das Amoreiras'),
          ('Heitor', 'N', 'Rodrigues', 'rua aves 60, Centro - Cidade das Sakuras'),
          ('Roberta', 'L', 'Gomes', 'avenida tigre 182, Centro - Cidade das Orquídeas'),
          ('Laura', 'S', 'Ferreira', 'avenida jardim 05, Centro - Cidade das Tulipas'),
          ('Gael', 'S', 'Souza', 'avenida Cabral 03, Centro - Cidade das Tangerinas');

-- idPF, idPFclient, CPF, data_nascimento, contact
desc pessoaFísica;
insert into pessoaFísica (idPFclient, CPF, data_nascimento, contact)
	values(1, 12345678912, '1975-09-18', 11923874573),
	      (2, 23456789345, '2005-03-20', 32546758),
          (5, 45367890236, '1985-04-01', 26584457),
          (6, 58492039284, '2001-02-23', 28371654),
          (7, 12398473029, '1971-10-28', 11983726401),
          (8, 23581928435, '2004-06-16', 28473629),
          (10, 12546735093, '1983-03-19', 21754327),
          (12, 12846572938, '2000-11-30', 26547325);
          
desc pessoaJuridica;
-- idPJ, idPJclient, CNPJ, socialName, contact
insert into pessoaJuridica (idPJclient, CNPJ, socialName, contact)
	values(3, 32145327894254, 'Company zélia amálio', 11945327689),
          (4, 22094837291276, 'Mel das abelhas', 92837102),
          (9, 05948371029653, 'Ilustrações condecoradas', 11928372918),
          (11, 93827439281743, 'Paninhos prontos', 11934827364);
          
desc ResponsibleTeam;
-- idResponsibleTeam, TeamName
insert into ResponsibleTeam (TeamName)
	value ('Engrenagem de Ouro'),
		  ('Força Motriz'),
          ('Pistão de Aço'),
          ('Eixo Mestre'),
          ('Oficina Suprema');

desc Mechanic;
-- idMechanic, idMechanicTeam, Fname, Minit, Lname, Address, specialty
insert into Mechanic (idMechanicTeam, Fname, Minit, Lname, Address, specialty)
	value (1, 'Rafael', 'O', 'Costa', 'Rua das Palmeiras 182, Jardim Aurora – Bela Vista', 'Mecânico de motores (reparação e manutenção de motores a combustão)'),
		  (3, 'Henrique', 'P', 'Moreira', 'Avenida Central 950, Centro – Nova Esperança', 'Mecânico de transmissão (caixa de câmbio manual e automática)'),
          (3, 'Lucas', 'J', 'Ferreira', 'Rua do Carvalho 47, Bairro Industrial – Campo Verde', 'Mecânico de motores (reparação e manutenção de motores a combustão)'),
          (1, 'Diego', 'I', 'Martins', 'Avenida dos Ipês 1200, Parque das Águas – Vila Serena', null),
          (2, 'Mariana', 'P', 'Lopes', 'Rua Dom Pedro II 325, Alto da Colina – São Gabriel', 'Mecânico de suspensão e direção'),
          (1, 'Camila', 'L', 'Barbosa', 'Travessa das Acácias 78, Vila Nova – Estrela do Sul', 'Eletricista automotivo (bateria, alternador, arranque, iluminação)'),
          (2, 'João', 'K', 'Almeida', 'Avenida Horizonte Azul 401, Bairro das Flores – Pedra Branca', null),
          (2, 'Pedro', 'H', 'Silva', 'Rua do Sol 15, Jardim Primavera – Lagoa Dourada', 'Mecânico de preparação de motores (performance, turbo, remapeamento)'),
          (5, 'Beatriz', 'C', 'Castro', 'Rua Monte Alegre 210, Bairro Esperança – Vale Verde', 'Diagnóstico computadorizado (scanner automotivo, sensores, ECU)'),
          (5, 'Ana', 'F', 'Machado', 'Avenida dos Bandeirantes 555, Centro Histórico – Porto Real', 'Eletricista automotivo (bateria, alternador, arranque, iluminação)'),
          (5, 'Caio', 'L', 'Oliveira', 'Avenida Central 1450, Bairro Jardim Europa – Nova Aurora', null),
          (4, 'Thiago', 'M', 'Moura', 'Rua Presidente Vargas 820, Centro – Porto das Águas', 'Mecânico de freios'),
          (3, 'Alex', 'K', 'Torres', 'Avenida Industrial 2999, Bairro São Cristóvão – Vale do Sol', null),
          (4, 'Ricardo', 'R', 'Santana', 'Rua Dom Pedro I 410, Bairro Santa Clara – Monte Verde', 'Mecânico de freios'),
          (4, 'Sabrina', 'J', 'Moretti', 'Avenida das Nações 1725, Bairro Alto da Serra – Vila Horizonte', 'Mecânico de competição (carros de corrida, track day, rally)');

desc Orders;
-- idOrder, idOrderClient, idOrderTeam, PaymentType, orderType 
-- ('1. Manutenção preventiva','2. Reparos corretivos','3. Diagnósticos e serviços adicionais'), 
-- orderDescription, vehicleType, released
insert into Orders (idOrderClient, idOrderTeam, PaymentType, orderType, orderDescription, vehicleType, released)
	value (2, 5, 'Dinheiro', '1. Manutenção preventiva', 'Solicitação de troca de óleo e filtro do motor', 'Moto', 1),
		  (6, 2, 'Cartão de crédito', '2. Reparos corretivos', 'Solicitação de verificação e substituição de pastilhas/discos de freio', 'Carro', 1),
          (3, 1, 'Cartão de crédito', '3. Diagnósticos e serviços adicionais', 'Solicitação de diagnóstico em bateria com descarga rápida', 'Moto', 0),
          (9, 1, 'PIX', '1. Manutenção preventiva', 'Solicitação de alinhamento e balanceamento das rodas', 'Moto', 1),
          (5, 3, 'PIX', '2. Reparos corretivos', 'Solicitação de substituição de lâmpadas do sistema de iluminação', 'Carro', 0),
          (11, 4, 'Dinheiro', '3. Diagnósticos e serviços adicionais', 'Solicitação de verificação de falhas de ignição durante aceleração', 'Carro', 1),
          (7, 2, 'Cartão de crédito', '2. Reparos corretivos', 'Solicitação de verificação e substituição de pastilhas/discos de freio', 'Carro', 1),
          (10, 1, 'PIX', '1. Manutenção preventiva', 'Solicitação de alinhamento e balanceamento das rodas', 'Moto', 1),
		  (12, 3, 'PIX', '2. Reparos corretivos', 'Solicitação de substituição de lâmpadas do sistema de iluminação', 'Carro', 1),
          (1, 4, 'Dinheiro', '3. Diagnósticos e serviços adicionais', 'Solicitação de verificação de falhas de ignição durante aceleração', 'Carro', 0);

desc serviceOrder;
-- idServiceOrder, idServiceOrderOrder, IssueDate, serviceOrderStatus, completionDate
insert into serviceOrder (idServiceOrderOrder, IssueDate, serviceOrderStatus, completionDate)
	values (1, '2025-01-23', 'Finalizado', '2025-02-25'),
		   (2, '2025-02-02', 'Finalizado', '2025-02-19'),
           (3, '2025-02-04', 'Finalizado', '2025-03-05'),
           (4, '2025-02-10', 'Finalizado', '2025-02-27'),
           (5, '2025-03-25', 'Em trabalho', null),
           (6, '2025-03-30', 'Em trabalho', null),
           (7, '2025-04-07', 'Em trabalho', null),
           (8, '2025-04-15', 'Em trabalho', null),
           (9, '2025-05-24', default, null),
           (10, '2025-05-26', default, null);
           
INSERT INTO piece (pieceType, pieceValue, pieceQuantity) 
	values ('Filtro de óleo - carro', 35.90, 20),
		   ('Filtro de óleo - moto', 22.50, 15),
           ('Pastilha de freio - carro', 120.00, 10),
           ('Pastilha de freio - moto', 65.00, 12),
           ('Pneu 175/65 R14 - carro', 280.00, 8),
           ('Pneu 110/90-17 - moto', 190.00, 6),
           ('Bateria 60Ah - carro', 450.00, 5),
           ('Bateria 12V - moto', 220.00, 7),
           ('Amortecedor dianteiro - carro', 320.00, 4),
           ('Amortecedor traseiro - moto', 150.00, 6),
           ('Correia dentada - carro', 85.00, 9),
           ('Corrente de transmissão - moto', 75.00, 10),
           ('Velas de ignição - carro', 25.00, 30),
           ('Velas de ignição - moto', 18.00, 25),
           ('Farol dianteiro - carro', 180.00, 3),
           ('Farol dianteiro - moto', 95.00, 4);
           
INSERT INTO service (serviceType, serviceDescription, serviceValue) 
	values ('Troca de óleo e filtro - moto', 'Substituição do óleo lubrificante e filtro do motor da motocicleta', 65.00),
		   ('Alinhamento e balanceamento - moto', 'Correção da geometria e distribuição de peso das rodas da motocicleta', 110.00),
		   ('Substituição de pastilhas/discos - carro', 'Troca das pastilhas e discos de freio dianteiros e traseiros do carro', 220.00),
		   ('Substituição de lâmpadas - carro', 'Troca de lâmpadas do sistema de iluminação frontal e traseiro do carro', 90.00),
		   ('Diagnóstico de bateria - moto', 'Verificação da bateria com teste de carga e análise de descarga rápida', 55.00),
		   ('Diagnóstico de ignição - carro', 'Análise de falhas no sistema de ignição durante aceleração', 95.00),
		   ('Lavagem completa - moto', 'Lavagem detalhada com produtos específicos para motocicletas', 45.00);


INSERT INTO serviceOrderPiece (idSOPserviceOrder, idSOPpiece) 
	values (1, 2),
		   (2, 3),
	       (2, 9),
		   (3, 8),
		   (4, 6),
		   (4, 10),
		   (5, 15),
		   (6, 13),
		   (6, 7),
		   (7, 3),
		   (7, 9),
		   (8, 6),
		   (9, 15),
		   (10, 13),
		   (10, 7);
           
INSERT INTO serviceOrderService (idSOSserviceOrder, idSOSservice) 
	values (1, 1),
		   (2, 3),
		   (2, 7),
		   (3, 5),
		   (4, 2),
		   (5, 4),
		   (6, 6),
		   (6, 5),
		   (7, 3),
		   (7, 7),
		   (8, 2),
		   (9, 4),
		   (10, 6),
		   (10, 5);









