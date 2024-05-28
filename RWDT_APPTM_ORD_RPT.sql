
CREATE TABLE IF NOT EXISTS UDP_RAW.RWDT_APPTM_ORD_RPT(
	name VARCHAR(100) NOT NULL COMMENT 'Resource name of the order accounts//customers//orders/*',
	referenceId VARCHAR(100) NOT NULL COMMENT 'internal ref Id',
	displayName VARCHAR(255)  COMMENT 'Client specified display name for the order , eg: plan order azure',
	userId BIGINT NOT NULL COMMENT 'Unique Identifier of the User: eg: 123',
	userName VARCHAR(255)  COMMENT 'Name of the User under Reseller ',
	userEmail VARCHAR(255)  COMMENT 'Contact Email of the User under Reseller',
	status STRING  COMMENT '(new,confirmed,on_hold,completed,error,canceled,in_progress,scheduled)',
	currencyCode VARCHAR(3)  COMMENT 'Currency codes are unique three-letter identifiers that denote a specific currency. Eg: US Dollar - (USD) ',
	total DECIMAL(12,4),
	cartId BIGINT,
	orderItems  STRING NOT NULL COMMENT 'Array of line items',
	orderProvisioningInfoPId VARCHAR(100)  COMMENT 'ProvisioningInfo stores information related to the provisioning that was made from this order or order item . It will be used for troubleshooting issues with orders.',
	orderProvisioningInfoPName VARCHAR(100)  COMMENT 'It will be used for troubleshooting issues with orders. ',
	orderCreatedTime TIMESTAMP  COMMENT 'Datetime indication of Order creation in the UTC format',
	orderUpdatedTime TIMESTAMP  COMMENT 'Datetime indication of  recent Update of an Order in the UTC format',
	optusCompanyABN VARCHAR(50) NOT NULL ,
	optusCustomerACN VARCHAR(50) NOT NULL ,
	billingAccountNumber VARCHAR(50) NOT NULL,
	baStatus VARCHAR(50) NOT NULL,
	optusCustomerId VARCHAR(50) NOT NULL ,
	faId VARCHAR(50) NOT NULL,
	optusContactId VARCHAR(50) NOT NULL,
	faStatus VARCHAR(50) NOT NULL,
	optusCollectionStatus VARCHAR(50) NOT NULL,
	optusCurrentBillingEndDate VARCHAR(50) NOT NULL
)
USING delta
TBLPROPERTIES(
   'delta.minReaderVersion' = '1',
   'delta.minWriterVersion' = '2',
   'mergeSchema'='true'
   
);

