CREATE DATABASE Oficina;
USE Oficina;

-- Ordem de Serviço

CREATE TABLE Orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    Price FLOAT,
    ConclusionDate DATE NOT NULL,
    EmissionDate DATE NOT NULL,
    ServiceType VARCHAR(45) NOT NULL,
    OrderStatus ENUM('Aguardando Autorização', 'Em Conserto', 'Finalizado') default 'Aguardando Autorização'
);

-- Revisão

CREATE TABLE Revision(
	idRevision INT AUTO_INCREMENT PRIMARY KEY,
    RevisionType VARCHAR(45) NOT NULL,
    RevisionDate DATE NOT NULL,
    idRevisionOrder INT,
    CONSTRAINT fk_Revision_Order FOREIGN KEY(idRevisionOrder) REFERENCES Orders(idOrder)
);

-- Equipe de Mecanicos

CREATE TABLE MecCrew(
	idMecCrew INT AUTO_INCREMENT PRIMARY KEY,
    FuncionarioNumber VARCHAR(45) NOT NULL
);

-- Mecanico

CREATE TABLE Mechanic(
	idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    MName VARCHAR(45) NOT NULL,
    MCode VARCHAR(45) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Speciality VARCHAR(45) NOT NULL,
    idCrew INT,
    CONSTRAINT fk_Mechanic_Crew FOREIGN KEY (idCrew) REFERENCES MecCrew(idMecCrew)
);

-- Conserto

CREATE TABLE Conserto(
	idConserto INT AUTO_INCREMENT PRIMARY KEY,
    ConsertoType VARCHAR(45),
    idServiceOrder INT,
    CONSTRAINT fk_Conserto_ServiceOrder FOREIGN KEY (idServiceOrder) REFERENCES Orders(idOrder)
);

-- Carro

CREATE TABLE Car(
	idCar INT AUTO_INCREMENT PRIMARY KEY,
    CarModel VARCHAR(45) NOT NULL,
    CarMarca VARCHAR(45) NOT NULL,
    CarYear INT NOT NULL,
    CarPlate CHAR(11) NOT NULL,
    idCarConserto INT,
    idCarOrder INT,
    CONSTRAINT fk_Car_Conserto FOREIGN KEY(idCarConserto) REFERENCES Conserto(idConserto),
    CONSTRAINT fk_Car_Order FOREIGN KEY(idCarOrder) REFERENCES Orders(idOrder)
);

-- Cliente

CREATE TABLE Clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(45) NOT NULL,
    Mname VARCHAR(45) NOT NULL,
    Lname VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Contact CHAR(11) NOT NULL,
    idCarClient INT,
    CONSTRAINT unique_cpf_client unique(CPF),
    CONSTRAINT fk_Client_Car FOREIGN KEY(idCarClient) REFERENCES Car(idCar)
);

-- CHAVES N PARA M

CREATE TABLE Client_Autoriza_Revisão(
	idRClient INT,
    idRRevision INT,
    CONSTRAINT fk_Client_Revision FOREIGN KEY(idRClient) REFERENCES Clients(idClient),
    CONSTRAINT fk_Revision_Client FOREIGN KEY(idRRevision) REFERENCES Revision(idRevision)
);

CREATE TABLE Client_Autoriza_Conserto(
	idCClient INT,
    idCConserto INT,
    CONSTRAINT fk_Client_Conserto FOREIGN KEY(idCClient) REFERENCES Clients(idClient),
    CONSTRAINT fk_Conserto_Client FOREIGN KEY(idCConserto) REFERENCES Conserto(idConserto)
);

CREATE TABLE MecCrew_Avalia_Revision(
	idRMecCrew INT,
    idRRevision INT,
    CONSTRAINT fk_MecCrew_Revision FOREIGN KEY(idRMecCrew) REFERENCES MecCrew(idMecCrew),
    CONSTRAINT fk_Revision_MecCrew FOREIGN KEY(idRRevision) REFERENCES Revision(idRevision)
);

CREATE TABLE MecCrew_Avalia_Conserto(
	idMMecCrew INT,
    idMConserto INT,
    CONSTRAINT fk_MecCrew_Conserto FOREIGN KEY(idMMecCrew) REFERENCES MecCrew(idMecCrew),
    CONSTRAINT fk_Conserto_MecCrew FOREIGN KEY(idMConserto) REFERENCES Conserto(idConserto)
);

CREATE TABLE MecCrew_Valor_Orders(
	idMOMecCrew INT,
    idMOOrder INT,
    idMORevision INT,
    idMOConserto INT,
    CONSTRAINT fk_MecCrew_Order FOREIGN KEY(idMOMecCrew) REFERENCES MecCrew(idMecCrew),
    CONSTRAINT fk_Order_MecCrew FOREIGN KEY(idMOOrder) REFERENCES Orders(idOrder),
    CONSTRAINT fk_MecCrew_Order_Revision FOREIGN KEY(idMORevision) REFERENCES Revision(idRevision),
    CONSTRAINT fk_MecCrew_Order_Conserto FOREIGN KEY(idMOConserto) REFERENCES Conserto(idConserto)
);



