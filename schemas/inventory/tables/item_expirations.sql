create table item_expirations (
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    item_id uuid not null,
    item_location_id not null,

    expiry timestamp with timezone not null default(now() at time zone 'utc'),

    constraint fk_item_expirations_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict,
    constraint fk_item_expirations_2
        foreign key (item_id)
        references inventory.items (item_id)
        on delete restrict,
    constraint fk_item_expirations_3
        foreign key (item_location_id)
        references inventory.item_locations (id)
        on delete restrict
);