CREATE TABLE public.listing_task

(

"ID" bigint NOT NULL,

"ISIN" text COLLATE pg_catalog."default" NOT NULL,

"Platform" text COLLATE pg_catalog."default" NOT NULL,

"Section" text COLLATE pg_catalog."default" NOT NULL,

CONSTRAINT "listing_task_pkey" PRIMARY KEY ("ID")

);


COPY public.listing_task

FROM 'C:\IT\listing_task.csv'

DELIMITERS ';' CSV HEADER ENCODING 'WIN 1251'
;