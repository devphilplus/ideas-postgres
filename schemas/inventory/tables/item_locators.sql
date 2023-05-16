create table item_locators (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    warehouse_id uuid not null,

    floor varchar(10),
    level varchar(10),
    aisle varchar(10),
    shelf varchar(10),
    row varchar(10),
    bin varchar(10),

    constraint pk_item_locators
        primary key (id),

    constraint fk_item_locators_1
        foreign key (tenant_id)
        references tenant.tenants (id)
        on delete restrict
);

comment on table inventory.item_locators is 'table of inventory item locators';