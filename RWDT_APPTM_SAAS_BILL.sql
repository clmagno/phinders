--clean slate
DROP TABLE IF EXISTS UDP_RAW.RWDT_APPTM_SAAS_BILL_RPT;
-- create table
CREATE TABLE IF NOT EXISTS UDP_RAW.RWDT_APPTM_SAAS_BILL_RPT(
  Provider VARCHAR(255) NOT NULL COMMENT 'Provider name of the subscription',
	Company VARCHAR(255) NOT NULL COMMENT 'Plan name of the subscription',
	`Cloud Account Number` VARCHAR(255) NOT NULL COMMENT 'Provider account number',
	Description VARCHAR(255)  ,
	`Customer ID` INT  COMMENT 'CCP Unique Identifier for the Customer',
	`Seller Cost (AUD)` DECIMAL(19,10) NOT NULL COMMENT 'Total cost incurred for the sale',
	`Customer Cost (AUD)` DECIMAL(19,10) NOT NULL COMMENT 'cost from reseller to customer',
	`Margin (AUD)` DECIMAL(19,10) NOT NULL COMMENT 'difference of seller and customer cost',
	`Usage Quantity` DECIMAL(19,10) NOT NULL COMMENT 'number of licence',
	`Billing Start Date` TIMESTAMP NOT NULL COMMENT 'Start date of the usage',
	`Billing End Date` TIMESTAMP NOT NULL COMMENT 'End Date of the usage',
	`Price Book` VARCHAR(255)  COMMENT 'Price book name which is applied for the subscription',
	`Seat Count` DECIMAL(19,8) NOT NULL COMMENT 'Number of users',
	`Account Status` STRING  COMMENT '(uploading,pending,processing,completed)',
	`Billing Year Month` VARCHAR(10)  ,
	`Charge Type` VARCHAR(100)  COMMENT 'Type of the charge can be Full completed cycle, etc',
	`Cost Of Unit (AUD)` DECIMAL(19,10)  ,
	`Currency Conversion Rates` VARCHAR(255)  ,
	`Customer Company` VARCHAR(255)  COMMENT 'System maintained customer profile details - when creating the customer profile',
	`Customer Company Reseller` VARCHAR(255)  COMMENT 'System maintained reseller profile details - when creating the reseller profile',
	`Customer Cost (Invoiced Currency)` DECIMAL(19,10)  COMMENT 'converted in customer currency',
	`Customer Cost (Provider Currency)` DECIMAL(19,10)  COMMENT 'converted in provider currency',
	`Customer Country` VARCHAR(255)  COMMENT 'Country of the customer',
	`Customer External ID` VARCHAR(255)  COMMENT 'CCP Unique Identifier for the Customer - ',
	`Customer State` VARCHAR(255)  COMMENT 'State of the customer',
	`Domain Name` VARCHAR(255)  COMMENT 'Discount rate from reseller',
	`Invoice Currency` VARCHAR(3)  COMMENT 'Depending on GEO location (customer supported currency)',
	`Margin (Invoiced Currency)` DECIMAL(19,10)  COMMENT 'converted in customer currency',
	`Margin (Provider Currency)` DECIMAL(19,10)  COMMENT 'converted in provider currency',
	`Offer ID` VARCHAR(255)  ,
	`Payer Account ID` VARCHAR(255)  ,
	`Period Quantity` DECIMAL(19,10)  ,
	`Price Book ID` INT  COMMENT 'Unique Identifier for the Pricebook , Eg: 1500',
	`Provider Currency` VARCHAR(3)  COMMENT 'Depending on GEO location (Provider supported currency)',
	`Provider ID` INT  COMMENT 'Identifier of the Cloud Provider specified',
	`Reseller External ID` VARCHAR(255)  ,
	`Reseller External Name` VARCHAR(255)  ,
	`Reseller ID` INT  COMMENT 'Unique Identifier for the Reseller Account',
	`Sales Price Of Unit (AUD)` DECIMAL(19,10)  ,
	`Seller Cost (Invoiced Currency)` DECIMAL(19,10)  COMMENT 'converted in customer currency',
	`Invoiced Currency` VARCHAR(3)  COMMENT 'Customer currency',
	`Seller Cost (Provider Currency)` DECIMAL(19,10)  COMMENT 'converted in provider currency',
	`Company ABN (customer)` VARCHAR(50) NOT NULL ,
	`Customer ACN (customer)` VARCHAR(50) NOT NULL ,
	`Billing Account Number (customer)` VARCHAR(50) NOT NULL ,
	`Billing Account Status (customer)` VARCHAR(50) NOT NULL ,
	`optusCustomerId (customer)` VARCHAR(50) NOT NULL ,
	`FA Id (customer)` VARCHAR(50) NOT NULL ,
	`Contact Id (customer)` VARCHAR(50) NOT NULL,
	`FA Status (customer)` VARCHAR(50) NOT NULL,
	`Collection Status (customer)` VARCHAR(50) NOT NULL,
	`Current Bill Cycle End Date (customer)` VARCHAR(50) NOT NULL


)
USING delta
TBLPROPERTIES(
   'delta.minReaderVersion' = '1',
   'delta.minWriterVersion' = '2',
  'delta.columnMapping.mode'='name'
);