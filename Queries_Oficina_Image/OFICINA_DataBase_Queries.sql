-- Queries SQL

USE Oficina;

show tables;
desc responsibleTeam;
desc mechanic;
--
select * from service;
select * from pessoaFísica;
--
-- 1. Todas as ordens de serviço que ainda não foram finalizadas.
select * from serviceOrder where serviceOrderStatus != "Finalizado";

-- 2. Quais são as pessoas físicas nascidas antes de 1990
select concat(Fname, " ", Minit, " ", Lname) as Nome, CPF, data_nascimento, contact from pessoaFísica 
	inner join clients on idPF = idClient
	where data_nascimento < '1990-01-01'
    order by data_nascimento;
    
-- 3. Listar os nomes dos clientes junto com o tipo de veículo e descrição do pedido que eles fizeram
select c.Fname as Name, o.vehicleType, o.orderDescription from clients as c
	inner join orders o on c.idClient = o.idOrderClient;

	-- 3.1 Agrupar por veículo
select o.vehicleType, count(*) as "Total de Veículos para manutenção" from clients as c
	inner join orders o on c.idClient = o.idOrderClient
    group by o.vehicleType;
    
-- 4. Exiba as peças utilizadas em cada ordem de serviço, mostrando o tipo da peça e o ID da ordem
select p.pieceType as "Tipo de peça", sp.idSOPserviceOrder as idService from piece as p
	inner join serviceOrderPiece as sp on p.idPiece = sp.idSOPpiece;
    
-- 5. Calcular o valor total das peças utilizadas em cada ordem de serviço.
select  sp.idSOPserviceOrder as idService, sum(p.pieceValue) as "Valor total em peças" from piece as p
	inner join serviceOrderPiece as sp on p.idPiece = sp.idSOPpiece
    group by sp.idSOPserviceOrder;

-- 6. Quantos mecânicos existem em cada time responsável.
select r.TeamName, count(m.idMechanic) as QuantityTeam from responsibleTeam as r
	inner join mechanic as m on r.idResponsibleTeam = m.idMechanicTeam
    group by r.TeamName;

-- 7. Calcular o valor total da soma dos serviços de cada ordem de serviço.
select sos.idSOSserviceOrder, sum(s.serviceValue) as TotalServico from serviceOrderService as sos
	inner join service as s on idSOSserviceOrder = s.idService
    group by sos.idSOSserviceOrder;
    
-- 8. Calcular o valor total estimado (soma dos serviços + peças) de cada ordem de serviço.
select sp.idSOPserviceOrder as idService, sum(p.pieceValue) as TotalPecas, 
	sum(s.serviceValue) as TotalServico, (sum(p.pieceValue)+sum(s.serviceValue)) as ValorTotal from piece as p
	inner join serviceOrderPiece as sp on p.idPiece = sp.idSOPpiece
    inner join serviceOrderService
	inner join service as s on idSOSserviceOrder = s.idService
    group by sp.idSOPserviceOrder;
    
-- 9. Valor total estimado (soma dos serviços + peças) de cada ordem de serviço, aparecendo apenas os valores maiores que 3000.
select sp.idSOPserviceOrder as idService, sum(p.pieceValue) as TotalPecas, 
	sum(s.serviceValue) as TotalServico, (sum(p.pieceValue)+sum(s.serviceValue)) as ValorTotal from piece as p
	inner join serviceOrderPiece as sp on p.idPiece = sp.idSOPpiece
    inner join serviceOrderService
	inner join service as s on idSOSserviceOrder = s.idService
    group by sp.idSOPserviceOrder
    having (sum(p.pieceValue)+sum(s.serviceValue)) > 3000;
    
-- 10. Valor total estimado (soma dos serviços + peças) de cada ordem de serviço, aparecendo apenas aqueles com valores totais de serviço maiores que 930.
select sp.idSOPserviceOrder as idService, sum(p.pieceValue) as TotalPecas, 
	sum(s.serviceValue) as TotalServico, (sum(p.pieceValue)+sum(s.serviceValue)) as ValorTotal from piece as p
	inner join serviceOrderPiece as sp on p.idPiece = sp.idSOPpiece
    inner join serviceOrderService
	inner join service as s on idSOSserviceOrder = s.idService
    group by sp.idSOPserviceOrder
    having sum(s.serviceValue) > 930;








