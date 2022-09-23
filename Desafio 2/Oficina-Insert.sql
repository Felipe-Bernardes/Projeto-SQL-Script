use Oficina;

desc MecCrew;

INSERT INTO MecCrew(FuncionarioNumber) VALUES 
		(10),
        (20),
        (15);

INSERT INTO Mechanic(Mname, Mcode, Address, Speciality, idCrew) VALUES 
		('Roberto', '2A1B', 'Rua das Flores, 259', 'Borracheiro', 1),
        ('Marcos', '5I6O', 'Jovenal Trajano, 571', 'Mecanico', 2);

INSERT INTO Orders(Price, ConclusionDate, EmissionDate, ServiceType, OrderStatus) VALUES
		(150.00, 28/09/2022, 23/09/2022, 'Troca de Pneus', null),
        (100, 23/09/2022, 20/09/2022, 'Troca de Óleo', 'Finalizado'),
        (300, 25/09/2022, 23/09/2022, 'Revisão Completa', 'Em Conserto');
        
INSERT INTO Conserto(ConsertoType, idServiceOrder) VALUES
		('Pneus', 1),
        ('Óleo', 2),
        ('Revisão', 3);

INSERT INTO Car(CarModel, CarMarca, CarYear, CarPlate, idCarConserto, idCarOrder) VALUES
		('Volkswagem', 'Fox', 2013, 'A2E8-D7P9', 2, 2),
        ('Honda', 'Civic', 2021, 'A9D6-FG8D', 1, 1),
        ('Fiat', 'UNO', 2014, 'K9J8-IH8D', 3, 3);
	
INSERT INTO Clients(Fname, Mname, Lname, CPF, Address, Contact, idCarClient) VALUES
		('Maurico', 'Augusto', 'Souza', '59842136412', 'Avenida Marechal, 221', '3145246871', 1),
        ('Mario', 'Lopes', 'Silva', '47823615958', 'Rua Nova Iguaçu, 231', '21981357468', 2),
        ('Vanessa', 'Machado', 'Moreira', '47823617958', 'Rua Piratuba, 1871', '21971357468', 3);
        
INSERT INTO Revision(RevisionType, RevisionDate, idRevisionOrder) VALUES
		('Completa', 23/09/2022, 3);

INSERT INTO Client_Autoriza_Revisão(idRClient, idRRevision) VALUES
		(3, 1);

INSERT INTO Client_Autoriza_Conserto(idCClient, idCConserto) VALUES
		(1, 2),
        (2, 1);
        
INSERT INTO MecCrew_Avalia_Revision(idRMecCrew, idRRevision) VALUES
		(2, 1);
	
INSERT INTO MecCrew_Avalia_Conserto(idMMecCrew, idMConserto) VALUES
		(1, 1),
        (2, 2);
        
INSERT INTO MecCrew_Valor_Orders(idMOMecCrew, idMOOrder, idMORevision, idMOConserto) VALUES
	(1, 1, null, 1),
	(2, 2, null, 2),
    (2, 3, 1, 3);
