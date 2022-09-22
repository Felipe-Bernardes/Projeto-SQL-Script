use ecommerce;

insert into Clients(Fname, Mname, Lname, Birthdate, CPF, Adress)
			values('Maria', 'M', 'Silva', 12/03/2022 ,12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
            ('Matheus', 'O', 'Pimentel', 08/05/2022 ,12356789,'rua alemeda 289, Centro - Cidade das flores'),
            ('Ricardo', 'F', 'Silva', 28/01/2022 ,12366789,'rua alemeda vinha 1009, Centro - Cidade das flores'),
            ('Julia', 'S', 'França', 24/11/2022 ,12376789,'rua lareiras 861, Centro - Cidade das flores'),
            ('Roberta', 'G', 'Assis', 14/10/2022 ,12386789,'avenida koller 19, Centro - Cidade das flores'),
            ('Isabela', 'M', 'Cruz', 17/09/2022 ,12396789,'rua alameda das flores 28, Centro - Cidade das flores');

INSERT INTO Product(Pname, Kids_Classification, Category, Avaliation, About, Price, Size)
			VALUES('Fone de Ouvido', false ,'Eletronico', '4', 'Fones Bom', '4.50', null),
            ('Barbie Elsa', true, 'Brinaquedo', '3', '', '5.80', null),
            ('Body Carters', true, 'Vestimento', '5', '', '8.00', null),
            ('Microfone Vedo', false ,'Eletronico', '4', 'Bom audio', '6.00', null),
            ('Sofá Retrátil', false ,'Móveis', '3', 'Bom acabamento', '7.00', '3x57x80'),
            ('Farinha de Arroz', false ,'Alimento', '2', '', '4.00', null),
            ('Fire stick Amazon', false ,'Eletronico', '3', '', '7.00', null);

INSERT INTO Orders(OrderStatus, OrderDescription, sendValue, idOrderClient, PaymentCash) VALUES
			(null, 'Compra via Aplicativo', null, 1, 1),
            (null, 'Compra via Aplicativo', 50, 2, 0),
            ('Confirmado', null, null, 3, 1),
            (null, 'Compra via Aplicativo', 150, 4, 0);
                     
INSERT INTO productOrder(idPOproduct, idPOOrder, POQuantity, POStatus) VALUES
		(15, 1, 2, null),
        (16, 1, 1, null),
        (17, 2, 1, null);

INSERT INTO productStorage(LocalStorage, Quantity) VALUES
		('Rio de Janeiro', 1000),
        ('Rio de Janeiro', 500),
        ('São Paulo', 10),
        ('São Paulo', 100),
        ('São Paulo', 10),
        ('Brasilia', 60);
        
INSERT INTO storageLocation(idLproduct, idLstorage, location) VALUES
		(15, 2, 'RJ'),
        (16, 6, 'GO');

INSERT INTO Supplier(SocialName, CNPJ, Contact) VALUES
		('Almeida e Filhos', 123456789123456, '21985474'),
        ('Eletrônicos Silva', 123456789987654, '21985484'),
        ('Eletrônicos Vilma', 987456321123456, '21975474');

INSERT INTO productSupplier(idPSProduct, idPSSupplier, Quantity) VALUES
		(15, 1, 500),
        (16, 1, 400),
        (18, 2, 633),
        (17, 3, 5),
        (16, 2, 10);
        
INSERT INTO SELLER(SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
		('Tech Eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
        ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
        ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

INSERT INTO productSeller(idPSeller, idProduct, ProdQuantity) VALUES
		(1, 20, 80),
        (2, 21, 10);