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