CREATE TABLE public.bond_description_task

(

	"ISIN, RegCode, NRDCode" text NOT NULL,

	"FinToolType" text NOT NULL,

	"SecurityType" text NOT NULL,

	"SecurityKind" text NOT NULL,

	"CouponType" text NOT NULL,

	"RateTypeNameRus_NRD" text NOT NULL,

	"CouponTypeName_NRD" text NOT NULL,

	"HaveOffer" boolean NOT NULL,

	"AmortisedMty" boolean NOT NULL,

	"MaturityGroup" text NOT NULL,

	"IsConvertible" boolean NOT NULL,

	"ISINCode" text NOT NULL,

	"Status" text NOT NULL,

	"HaveDefault" boolean NOT NULL,

	"IsLombardCBR_NRD" boolean NOT NULL,

	"IsQualified_NRD" boolean NOT NULL,

	"ForMarketBonds_NRD" boolean NOT NULL,

	"MicexList_NRD" text NOT NULL,

	"Basis" text NOT NULL,

	"Basis_NRD" text NOT NULL,

	"Base_Month" text NOT NULL,

	"Base_Year" text NOT NULL,

	"Coupon_Period_Base_ID" smallint NOT NULL,

	"AccruedintCalcType" boolean NOT NULL,

	"IsGuaranteed" boolean NOT NULL,

	"GuaranteeType" text NOT NULL,

	"GuaranteeAmount" text NOT NULL,

	"GuarantVal" bigint NOT NULL,

	"Securitization" text NOT NULL,

	"CouponPerYear" smallint NOT NULL,

	"Cp_Type_ID" smallint NOT NULL,

	"NumCoupons" smallint NOT NULL,

	"NumCoupons_M" smallint NOT NULL,

	"NumCoupons_NRD" smallint NOT NULL,

	"Country" text NOT NULL,

	"FaceFTName" text NOT NULL,

	"FaceFTName_M" smallint NOT NULL,

	"FaceFTName_NRD" text NOT NULL,

	"FaceValue" real NOT NULL,

	"FaceValue_M" smallint NOT NULL,

	"FaceValue_NRD" real NOT NULL,

	"CurrentFaceValue_NRD" real NOT NULL,

	"BorrowerName" text NOT NULL,

	"BorrowerOKPO" bigint NOT NULL,

	"BorrowerSector" text NOT NULL,

	"BorrowerUID" integer NOT NULL,

	"IssuerName" text NOT NULL NOT NULL,

	"IssuerName_NRD" text NOT NULL,

	"IssuerOKPO" integer NOT NULL,

	"NumGuarantors" smallint NOT NULL,

	"EndMtyDate" date NOT NULL
	
	PRIMARY KEY (""ISIN, RegCode, NRDCode")

);



COPY public.bond_description_task

FROM 'C:\IT\bond_description_task.csv'

DELIMITERS ';' CSV HEADER ENCODING 'WIN 1251'
;
