create table accounts (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    currency_id int not null,

    name varchar(300) not null,
    description text,

    constraint pk_accounts
        primary key (id),

    constraint u_accounts_1
        unique (tenant_id, name),

    constraint fk_accounts_1
        foreign key (currency_id)
        references common.currencies (id)
        on delete restrict,
    constraint fk_accounts_2
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict
);

comment on table accounting.accounts is 'chart of accounts';