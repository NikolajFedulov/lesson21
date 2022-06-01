CREATE TABLE public."user"
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( CYCLE INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    surname character varying(20) COLLATE pg_catalog."default" NOT NULL,
    date_of_registration date NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to postgres;
	
CREATE TYPE public.currency AS ENUM
    ('UAH', 'USD', 'EUR');

ALTER TYPE public.currency
    OWNER TO postgres;
	
CREATE TABLE public.wallet
(
    wallet_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( CYCLE INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    currency currency NOT NULL,
    amount money NOT NULL,
    user_id integer NOT NULL,
    created date NOT NULL,
    CONSTRAINT wallet_pkey PRIMARY KEY (wallet_id),
    CONSTRAINT fk_user_id_wallet FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.wallet
    OWNER to postgres;
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Daniel', 'White', '2022-05-29');

INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Alvin', 'Jackson', '2022-05-29');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Ralph', 'Moreno', '2022-05-29');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Brett', 'Moran', '2022-05-29');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('James', 'Bryan', '2022-05-29');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Roger', 'Torres', '2022-05-30');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Mary', 'Medina', '2022-05-30');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Marie', 'Harris', '2022-05-30');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Sylvia', 'Taylor', '2022-05-30');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Daniel', 'McCoy', '2022-05-30');
	
INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Audrey', 'Chapman', '2022-05-30');

INSERT INTO public."user"(
	name, surname, date_of_registration)
	VALUES ('Jennifer', 'Herrera', '2022-05-30');

INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 10000, 1, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 15000, 2, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 5000, 3, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('EUR', 50000, 3, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 35000, 4, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('UAH', 100, 5, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 100000000, 5, '2022-05-29');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('EUR', 45000, 6, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 5000, 7, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('EUR', 15000, 8, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 5000, 9, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 500, 10, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('EUR', 1500, 11, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('USD', 5000, 12, '2022-05-30');
	
INSERT INTO public.wallet(
	currency, amount, user_id, created)
	VALUES ('EUR', 10000, 12, '2022-05-30');
	
SELECT name, currency, amount FROM public.user JOIN public.wallet ON "user".user_id = wallet.user_id;