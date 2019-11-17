alter table public.listing_task

add column "IssuerName" text,

add column "IssuerName_NRD" text,

add column "IssuerOKPO" bigint,

add column "BOARDID" text,

add column "BOARDNAME" text;


Update listing_task

SET "IssuerName" = public.bond_description_task."IssuerName",

"IssuerName_NRD" = public.bond_description_task."IssuerName_NRD",

"IssuerOKPO" = public.bond_description_task."IssuerOKPO"

FROM public.bond_description_task

WHERE public.listing_task."ISIN" = public.bond_description_task."ISINCode";

UPDATE listing_task

SET "BOARDID" = public.quotes_task."BOARDID",

"BOARDNAME" = public.quotes_task."BOARDNAME"

FROM public.quotes_task

WHERE public.listing_task."ISIN" = public.quotes_task."ISIN";
