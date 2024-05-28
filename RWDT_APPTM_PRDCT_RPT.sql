--clean slate
DROP TABLE IF EXISTS UDP_RAW.RWDT_APPTM_PRDCT_RPT;
-- create table
CREATE TABLE IF NOT EXISTS UDP_RAW.RWDT_APPTM_PRDCT_RPT(
	name VARCHAR(63) NOT NULL COMMENT 'Resource names of the categories the product is associated with.',
	type STRING NOT NULL COMMENT 'Default: "PRODUCT_TYPE_UNSPECIFIED"  Enum: "PRODUCT_TYPE_UNSPECIFIED" "SUBSCRIPTION_PRODUCTS" "CLOUD_REBILLING_PRODUCT"  Defines the type of product.  SUBSCRIPTION_PRODUCT: Product defines skus, plans with subscription and/or overages.  CLOUD_REBILLING_PRODUCT: Product represents cloud rebilling product.',
	categories  STRING COMMENT 'Resource names of the categories the product is associated with.',
	hasPublishedVersions BOOLEAN  COMMENT 'Flag indicating whether this product has unpublished changes. Always false on a published product. Only set to true on an unpublished product if it differs from the published product. Output-only.',
	marketingDescription VARCHAR(255)  COMMENT 'Detailed description of the product.',
	marketingDisplayName VARCHAR(255) NOT NULL COMMENT 'Client supplied display name of the product.',
	marketingCaption VARCHAR(255)  COMMENT 'Short description of the product.',
	marketingDefaultImageTitle VARCHAR(255)  COMMENT 'Title of the media. UTF plain-text.',
	marketingDefaultImageContent VARCHAR(255)  COMMENT 'For videos, embeddable iframe code or link For images, contains the url of the image. For adding/updating image, create a new Blob using blob service and upload to the given URL. Once upload is completed, put the signature in this field and call create/update.',
	marketingDefaultImageType STRING  COMMENT 'Default: "MEDIA_TYPE_UNSPECIFIED"  Enum: "MEDIA_TYPE_UNSPECIFIED" "MEDIA_TYPE_IMAGE" "MEDIA_TYPE_VIDEO"  Type of media used.  MEDIA_TYPE_IMAGE: User uploaded image  MEDIA_TYPE_VIDEO: Link to the video',
	supportedCurrencies STRING NOT NULL COMMENT 'currency of the product' ,
	billingMode STRING  COMMENT 'Default: "BILLING_MODE_UNSPECIFIED"  Enum: "BILLING_MODE_UNSPECIFIED" "PREPAY" "POSTPAY"  Specifies when the payment should be made.  PREPAY: Payment should be made in the beginning.  POSTPAY: Payment should be made at the end of the cycle.',
	features STRING,
	skus STRING,
    addOns STRING,
    customFields STRING,
    supportPlans STRING,
    isSharedProduct BOOLEAN,
    etag varchar(255),
    tagsValues STRING,    
	createTime TIMESTAMP  COMMENT 'Datetime Indication of Product Created',
	updateTime TIMESTAMP  COMMENT 'Datetime Indication of recent Product Updated'
)USING delta

TBLPROPERTIES(
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '2'
);

-- Add the CHECK constraints
ALTER TABLE  UDP_RAW.RWDT_APPTM_PRDCT_RPT ADD CONSTRAINT typeCheck CHECK (TYPE IN ('PRODUCT_TYPE_UNSPECIFIED','SUBSCRIPTION_PRODUCT', 'CLOUD_REBILLING_PRODUCT'));
ALTER TABLE  UDP_RAW.RWDT_APPTM_PRDCT_RPT ADD CONSTRAINT marketingDefaultImageTypeCheck CHECK (MARKETINGDEFAULTIMAGETYPE IN ('MEDIA_TYPE_UNSPECIFIED' ,'MEDIA_TYPE_IMAGE','MEDIA_TYPE_VIDEO'));
ALTER TABLE  UDP_RAW.RWDT_APPTM_PRDCT_RPT ADD CONSTRAINT billingModeCheck CHECK (BILLINGMODE IN ('BILLING_MODE_UNSPECIFIED','PREPAY','POSTPAY'));