create table items (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,

    name varchar(200) not null,

    upc varchar(100),
    sku varchar(100),
    
    constraint pk_items
        primary key (id),

    constraint fk_items_1
        foreign key tenant_id
        references tenants.tenants (id)
        on delete restrict
);

comment on table inventory.items is 'table of inventory items';