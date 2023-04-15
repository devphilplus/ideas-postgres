create table warehouses (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    name varchar(100) not null,
    slug common.slug_text,
    description text,

    constraint pk_warehouses
        primary key (id),
    
    constraint u_warehouses_1
        unique (tenant_id, name),
    constraint u_warehouses_2
        unique (tenant_id, slug)
);

comment on table warehouses is 'table of warehouses';