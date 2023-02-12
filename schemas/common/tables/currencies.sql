create table currencies (
    id int not null,
    currency varchar(10) not null,
    unit_text varchar(100) not null,
    symbol varchar(10),

    constraint pk_currencies
        primary key (id),

    constraint u_currencies_1
        unique (currency),
    constraint u_currencies_2
        unique (unit_text)
);


-- https://www.postgresql.org/docs/12/app-psql.html
-- currencies

create sequence if not exists seq_currency as int
;

alter table if exists currencies
alter column id set default nextval('seq_currency')
;


\copy common.currencies (currency, unit_text, symbol) from '/docker-entrypoint-initdb.d/init/currencies.csv' with delimiter ',' csv header quote '"'; 



alter table if exists currencies
alter column id drop default
;

drop sequence seq_currency
;