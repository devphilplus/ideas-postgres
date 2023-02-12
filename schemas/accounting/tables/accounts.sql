create table accounts (
    id uuid not null,

    currency_id int not null,

    name varchar(300) not null,
    description text,

    constraint pk_accounts
        primary key (id),

    constraint u_accounts_1
        unique (name),

    constraint fk_accounts_1
        foreign key (currency_id)
        references common.currencies (id)
        on delete restrict
);