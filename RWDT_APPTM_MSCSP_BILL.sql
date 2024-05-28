
	`Customer Name` VARCHAR(255) NOT NULL,
	`Publisher Name` VARCHAR(255) NOT NULL, 
	`Cloud Account Name` VARCHAR(255) NOT NULL 
	`Product Name` VARCHAR(255)  
	`SKU Name` VARCHAR(300)  
	`Term And Billing Cycle` VARCHAR(100)  
	`Price book` VARCHAR(255)  
	`Seller Cost (AUD)` DECIMAL(19,10) NOT NULL 
	`Customer Cost (AUD)` DECIMAL(19,15) NOT NULL 
	`Margin (AUD)` DECIMAL(19,10) NOT NULL 
	`Usage Quantity` INT NOT NULL 
	Unit VARCHAR(100),
	Region VARCHAR(255),
	`Seat Count` DECIMAL(19,8)  
	`Availability ID` VARCHAR(20),
	`Azure Customer Country` VARCHAR(3),
	`Azure Customer ID` VARCHAR(36),
	`Billing Cycle` VARCHAR(255)  
	`Billing Frequency` VARCHAR(100),
	`Charge EndDate` TIMESTAMP NOT NULL 
	`Charge StartDate` TIMESTAMP NOT NULL 
	`Charge Type` VARCHAR(100)  
	`Charge or Savings Plan` STRING,
	`Currency Conversion Rates` VARCHAR(255),
	`Customer Company` VARCHAR(255)  
	`Customer Company Reseller` VARCHAR(255)  
	`Customer Cost (Invoiced Currency)` DECIMAL(19,15)  
	`Customer Cost (Provider Currency)` DECIMAL(19,15)  
	`Customer Country` VARCHAR(255)  
	`Customer ID` INT  
	`Customer State` VARCHAR(255)  
	`Domain Name` VARCHAR(255)  
	`Effective Unit Price` DECIMAL(19,10)  
	EntitlementID VARCHAR(36),
	`Group Tag Label` VARCHAR(255)  
	`Entitlement Description` VARCHAR(255),
	`Discount Rate` DECIMAL(19,10),
	`Group Tag ID` INT  
	`Invoice Currency` VARCHAR(3)  
	`Invoice Number` VARCHAR(20),
	`MPN ID` VARCHAR(20),
	`MSRP (AUD)` DECIMAL(19,10)  
	`Margin (Invoiced Currency)` DECIMAL(19,15)  
	`Margin (Provider Currency)` DECIMAL(19,10)  
	`Meter Category` VARCHAR(300),
	`Meter ID` VARCHAR(36),
	`Meter Name` VARCHAR(300),
	`Meter Sub Category` VARCHAR(300),
	`Metered Region` VARCHAR(50),
	`Order Date` TIMESTAMP  
	`Order Number` VARCHAR(20)  
	`PAC of Origin` VARCHAR(50),
	`Period Quantity` INT,
	`Price book ID` INT  
	`Product ID` VARCHAR(20)  
	`Promotion EndDate` TIMESTAMP,
	`Promotion Rate` INT,
	`Promotion StartDate` TIMESTAMP,
	PromotionID INT,
	`Provider Currency` VARCHAR(3)  
	`Publisher ID` VARCHAR(20),
	Rate INT,
	`Reseller ID` INT  
	`Reseller MPN ID` VARCHAR(20)  
	`Reseller Name` VARCHAR(255),
	`Reservation Order ID` VARCHAR(100),
	`Resource Group` VARCHAR(300),
	`Resource URI` VARCHAR(300),
	`SKU ID` INT  
	`Savings Plan ID` INT,
	`Savings Plan Order ID` INT,
	Segment VARCHAR(50),
	`Seller Cost (Invoiced Currency)` DECIMAL(19,10)  
	`Invoiced Currency` VARCHAR(3)  
	`Seller Cost (Provider Currency)` DECIMAL(19,10)  
	`Subscription EndDate` TIMESTAMP,
	`Subscription ID` VARCHAR(36)  
	`Subscription StartDate` TIMESTAMP,
	Type VARCHAR(50),
	`Unit Price` DECIMAL(15, 4),
	`Usage Type` VARCHAR(20),
	`Company ABN (customer)` VARCHAR(50) NOT NULL,
	`Customer ACN (customer)` VARCHAR(50) NOT NULL,
	`Billing Account Number (customer)` VARCHAR(50) NOT NULL,
	`Billing Account Status (customer)` VARCHAR(50) NOT NULL,
	`optusCustomerId (customer)` VARCHAR(50) NOT NULL,
	`FA Id (customer)` VARCHAR(50) NOT NULL,
	`Contact Id (customer)` VARCHAR(50) NOT NULL,
	`FA Status (customer)` VARCHAR(50) NOT NULL,
	`Collection Status (customer)` VARCHAR(50) NOT NULL,
	`Current Bill Cycle End Date` VARCHAR(50) NOT NULL
