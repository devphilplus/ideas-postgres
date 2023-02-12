create table account_balances (
    account_id uuid not null,
    balance numeric(12,4) not null,

    constraint pk_account_balances
        primary key (account_id),
    constraint fk_account_balances_1
        foreign key (account_id)
        references accounting.accounts (id)
);