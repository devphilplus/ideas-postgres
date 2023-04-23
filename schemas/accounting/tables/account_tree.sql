create table account_tree (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    account_id uuid not null,
    parent_account_id uuid not null,

    constraint pk_account_tree
        primary key (tenant_id, account_id, parent_account_id),

    constraint fk_account_tree_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict,
    constraint fk_account_tree_2
        foreign key (account_id)
        references accounting.accounts (id)
        on delete restrict,
    constraint fk_account_tree_2
        foreign key (parent_account_id)
        references accounting.accounts (id)
        on delete restrict
);

comment on table accounting.account_tree is 'account hierarchy'