CREATE TABLE IF NOT EXISTS EP_SSOT_STGE.STGE_APPTM_SUBS_RPT(
   id INT NOT NULL COMMENT 'Internal Id',
   CustomerId INT NOT NULL COMMENT 'Unique Identifier Id of the Customer in the CCP',
   resellerId INT NOT NULL COMMENT 'Unique Identifier Id of the Reseller',
   isvId INT NOT NULL COMMENT 'ISV account Id ' ,
   cloudProviderId INT NOT NULL COMMENT 'Unique Identifier Id of the Cloud Provider',
   subscriptionId VARCHAR(36) NOT NULL COMMENT 'Eg: d3da2e14-95fd-449b-d22b-c67c316b35c4',
   subscriptionName VARCHAR(255) ,
   resourceType STRING COMMENT 'Eg: (subscrition, provision)',
   ccpProductId VARCHAR(255) COMMENT 'Product ref id in the CCP',
   ccpSkuId VARCHAR(255) COMMENT 'sku ref id in the CCP',
   ccpPlanId VARCHAR(100), 
   subscriptionProductId VARCHAR(100),
   subscriptionSkuId VARCHAR(255),
   subscriptionOfferId VARCHAR(255),
   subscriptionTotalLicenses INT NOT NULL COMMENT 'No of licences',
   unitType VARCHAR(100),
   subscriptionStatus STRING NOT NULL COMMENT '(trial,Pending,active,suspended,past_due,expired,canceled)',
   subscriptionPurchasedDate TIMESTAMP COMMENT 'Datetime referred in the UTC timezone ',
   subscriptionStartDate TIMESTAMP NOT NULL COMMENT 'Datetime referred in the UTC timezone ',
   subscriptionEndDate TIMESTAMP NOT NULL COMMENT 'Datetime referred in the UTC timezone ',
   cancellationAllowedUntilDate TIMESTAMP COMMENT 'Datetime referred in the UTC timezone ',
   subscriptionBillingType VARCHAR(100) COMMENT 'E.G. LICENCE',
   subscriptionBillingCycle VARCHAR(100) NOT NULL COMMENT 'E.G. MONTHLY',
   subscriptionBillingTerm  VARCHAR(100)  COMMENT 'E.G. P1M',
   subscriptionRenewStatus  VARCHAR(100),
   resellerPO VARCHAR(100),
   customerPO VARCHAR(100),
   ccpProductInfoProductId VARCHAR(100),
   ccpProductInfoProductDisplayName VARCHAR(100),
   ccpProductInfoSkuId VARCHAR(50),
   ccpProductInfoSkuDisplayName VARCHAR(255) COMMENT 'Display name of the SKU',
   ccpProductInfoPlanId VARCHAR(100),
   ccpProductInfoPlanDisplayName VARCHAR(255),
   autoRenew BOOLEAN NOT NULL,
   customerName VARCHAR(255) NOT NULL COMMENT 'Display Name of the Customer',
   partnerName VARCHAR(50) NOT NULL COMMENT 'Display Name of the RESELLER',
   optusCompanyABN VARCHAR(50) NOT NULL,
   optusCustomerACN VARCHAR(50) NOT NULL,
   optusBillingAccountId VARCHAR(50) NOT NULL,
   optusAccountStatus VARCHAR(50) NOT NULL,
   optusCustomerId VARCHAR(50) NOT NULL,
   optusFAId VARCHAR(50) NOT NULL,
   optusContactId VARCHAR(50) NOT NULL

)
USING delta
TBLPROPERTIES(
   'delta.minReaderVersion' = '1',
   'delta.minWriterVersion' = '2'
);

-- Add the CHECK constraints
ALTER TABLE EP_SSOT_STGE.STGE_APPTM_SUBS_RPT ADD CONSTRAINT resourceTypeCheck CHECK (RESOURCETYPE LIKE '%Subscription' or RESOURCETYPE LIKE '%Provision%');
ALTER TABLE EP_SSOT_STGE.STGE_APPTM_SUBS_RPT ADD CONSTRAINT subscriptionStatusCheck CHECK (SUBSCRIPTIONSTATUS IN ('trial','pending','active','suspended','past_due','expired','canceled'));
