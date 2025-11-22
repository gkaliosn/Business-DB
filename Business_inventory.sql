CREATE TABLE Product (
  idProduct INTEGER  NOT NULL  ,
  AnalyticalDescription VARCHAR(400)    ,
  BriefDescription VARCHAR(100)    ,
  Category VARCHAR(30)    ,
  CurrentSellingPrice NUMERIC(5,2)    ,
  CurrentBuyingPrice NUMERIC(5,2)      ,
PRIMARY KEY(idProduct));



CREATE TABLE Supplier (
  idSupplier INTEGER  NOT NULL  ,
  SCompanyName VARCHAR(40)    ,
  SAddress VARCHAR(30)    ,
  SAddressNumber VARCHAR(4)    ,
  SCity VARCHAR(30)    ,
  SRegion VARCHAR(30)    ,
  STK VARCHAR(5)      ,
PRIMARY KEY(idSupplier));



CREATE TABLE Employee (
  idEmployee INTEGER  NOT NULL  ,
  Name VARCHAR(30)    ,
  Surname VARCHAR(30)    ,
  PhoneNumber VARCHAR(10)    ,
  AFM VARCHAR(9)    ,
  AT VARCHAR(8)    ,
  EAddress VARCHAR(30)    ,
  EAddressNumber VARCHAR(4)    ,
  ECity VARCHAR(30)    ,
  ERegion VARCHAR(30)    ,
  ETK VARCHAR(5)      ,
PRIMARY KEY(idEmployee));



CREATE TABLE Buyer (
  idBuyer INTEGER  NOT NULL  ,
  BCompany Name VARCHAR(40)    ,
  BAddress VARCHAR(30)    ,
  BCity VARCHAR(30)    ,
  BRegion VARCHAR(30)    ,
  BTK VARCHAR(5)    ,
  BAddressNumber VARCHAR(4)      ,
PRIMARY KEY(idBuyer));



CREATE TABLE SupplierTelephones (
  SupplierTelephone VARCHAR(10)  NOT NULL  ,
  Supplier_idSupplier INTEGER  NOT NULL    ,
PRIMARY KEY(SupplierTelephone)  ,
  FOREIGN KEY(Supplier_idSupplier)
    REFERENCES Supplier(idSupplier)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX idx_supplier_telephones_supplier_id ON SupplierTelephones (Supplier_idSupplier);



CREATE TABLE BuyerTelephones (
  BuyerPhoneNumber VARCHAR(10)  NOT NULL  ,
  Buyer_idBuyer INTEGER  NOT NULL    ,
PRIMARY KEY(BuyerPhoneNumber)  ,
  FOREIGN KEY(Buyer_idBuyer)
    REFERENCES Buyer(idBuyer)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX idx_buyer_telephones_supplier_id ON BuyerTelephones (Buyer_idBuyer);



CREATE TABLE Supply (
  idSupply INTEGER  NOT NULL  ,
  Employee_idEmployee INTEGER  NOT NULL  ,
  Supplier_idSupplier INTEGER  NOT NULL  ,
  Product_idProduct INTEGER  NOT NULL  ,
  BDate DATE    ,
  BQuantity INTEGER    ,
  BPricePerUnit NUMERIC(5,2)    ,
  BTotalPriceSupply NUMERIC(5,2)      ,
PRIMARY KEY(idSupply)      ,
  FOREIGN KEY(Product_idProduct)
    REFERENCES Product(idProduct)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Supplier_idSupplier)
    REFERENCES Supplier(idSupplier)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Employee_idEmployee)
    REFERENCES Employee(idEmployee)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX idx_supply_product_id ON Supply (Product_idProduct);
CREATE INDEX idx_supply_supplier_id ON Supply (Supplier_idSupplier);
CREATE INDEX idx_supply_employee_id ON Supply (Employee_idEmployee);



CREATE TABLE Sale (
  idSale INTEGER  NOT NULL  ,
  Employee_idEmployee INTEGER  NOT NULL  ,
  Product_idProduct INTEGER  NOT NULL  ,
  Buyer_idBuyer INTEGER  NOT NULL  ,
  SDate DATE    ,
  SPricePerUnit NUMERIC(5,2)    ,
  SQuantity INTEGER    ,
  STota SalePrice NUMERIC(5,2)      ,
PRIMARY KEY(idSale)      ,
  FOREIGN KEY(Buyer_idBuyer)
    REFERENCES Buyer(idBuyer)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Product_idProduct)
    REFERENCES Product(idProduct)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Employee_idEmployee)
    REFERENCES Employee(idEmployee)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX idx_sale_buyer_id ON Sale (Buyer_idBuyer);
CREATE INDEX idx_sale_product_id ON Sale (Product_idProduct);
CREATE INDEX idx_sale_employee_id ON Sale (Employee_idEmployee);



