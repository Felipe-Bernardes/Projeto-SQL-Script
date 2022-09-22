-- Criação do Banco de Dados para o Cenario de E-Commerce
-- DROP DATABASE ecommerce;
CREATE DATABASE ecommerce;
use ecommerce;

-- Criar Tabela Cliente
DROP TABLE Clients;
CREATE TABLE Clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Mname VARCHAR(3) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    Birthdate DATE,
    CPF CHAR(11) NOT NULL,
    Adress VARCHAR(60),
    constraint unique_cpf_cliente unique(CPF)
);

-- Criar Tabela Produto

CREATE TABLE Product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45),
    Kids_Classification BOOL default false,
    Category enum('Eletronico', 'Vestimento', 'Brinaquedo', 'Alimento', 'Móveis') NOT NULL,
    Avaliation FLOAT default 0,
	About VARCHAR(100),
    Price VARCHAR(45),
    Size VARCHAR(10)
);

-- Criar Tabela Pagamento com Cartão
-- CREATE TABLE PaymentCard(
--    idPaymentCard INT AUTO_INCREMENT PRIMARY KEY,
--    idClient INT,
-- 	  CardNumber INT NOT NULL,
--    ValidationDate DATE NOT NULL,
--    CVV INT NOT NULL,
 --   CONSTRAINT unique_cardnumber_client UNIQUE(CardNumber),
--    CONSTRAINT fk_idClient_PaymentCard FOREIGN KEY(idClient) REFERENCES Clients(idClient)
-- );

-- Criar Tabela Pedido

CREATE TABLE Orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    OrderStatus ENUM('Cancelado', 'Processando', 'Confirmado') default 'Processando',
    OrderDescription VARCHAR(255),
    sendValue FLOAT default 0,
    idOrderClient INT,
    PaymentCash BOOL default false,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES Clients(idClient)
);

-- Criar Tabela Estoque

CREATE TABLE ProductStorage(
	idProductStorage INT AUTO_INCREMENT PRIMARY KEY,
    localStorage VARCHAR(255),
    Quantity INT default 0
);

-- Criar Tabela Fornecedor

CREATE TABLE Supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(50) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11),
    CONSTRAINT unique_supplier unique(CNPJ)
);

-- Criar Tabela Vendedor

CREATE TABLE Seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CPF CHAR(11),
    CNPJ CHAR(15),
    Contact CHAR(11),
    Location VARCHAR(255),
    CONSTRAINT unique_seller_cpf unique(CPF),
    CONSTRAINT unique_seller_cnpj unique(CNPJ)
);



CREATE TABLE ProductSeller(
	idPSeller INT,
    idProduct INT,
    ProdQuantity INT default 1,
    PRIMARY KEY(idPSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPSeller) REFERENCES Seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);


CREATE TABLE ProductOrder(
	idPOproduct INT,
    idPOOrder INT,
    POQuantity INT default 1,
    POStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
    PRIMARY KEY(idPOProduct, idPOOrder),
    CONSTRAINT fk_Oproduct_orders FOREIGN KEY (idPOOrder) REFERENCES Orders(idOrder),
    CONSTRAINT fk_Oproduct_product FOREIGN KEY (idPOProduct) REFERENCES Product(idProduct)
);

CREATE TABLE storageLocation(
	idLproduct INT,
    idLStorage INT,
    Location VARCHAR(255) NOT NULL,
    PRIMARY KEY(idLProduct, idLStorage),
    CONSTRAINT fk_Lproduct_storage FOREIGN KEY (idLStorage) REFERENCES ProductStorage(idProductStorage),
    CONSTRAINT fk_Lproduct_product FOREIGN KEY (idLProduct) REFERENCES Product(idProduct)
);

CREATE TABLE ProductSupplier(
	idPSProduct INT,
    idPSSupplier INT,
    Quantity INT NOT NULL,
	PRIMARY KEY (idPSProduct, idPSSupplier),
    CONSTRAINT fk_psproduct_supplier FOREIGN KEY (idPSSupplier) REFERENCES Supplier(idSupplier),
    CONSTRAINT fk_psproduct_product FOREIGN KEY (idpsProduct) REFERENCES Product(idProduct)
);




