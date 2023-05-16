create table item_locations (
    id uuid not null,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    item_id uuid not null,
    item_locator_id uuid not null,

    uom_id bigint not null,
    quantity decimal(10,6) not null,

    constraint pk_item_locations
        primary key (id),

    constraint fk_item_locations_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict,
    constraint fk_item_locations_2
        foreign key (item_id)
);

comment on table inventory.item_locations is 'item locations';