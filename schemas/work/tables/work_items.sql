create table work_items (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    name varchar(100) not null,
    description text,
    work_type_id int not null,

    constraint pk_work_items
        primary key (id),

    constraint fk_work_items_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict,
    constraint fk_work_items_2
        foreign key (work_type_id)
        references work.work_types (id)
        on delete restrict
);

comment on table work.work_items is 'table of work items';