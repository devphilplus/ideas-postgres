create table roles (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    name varchar(100) not null,
    slug common.slug_text not null,
    description text not null,

    constraint pk_roles
        primary key (id),
    constraint u_roles_1
        unique (tenant_id, name),
    constraint u_roles_2
        unique (tenant_id, slug),
    constraint fk_roles_1
        foreign key (tenant_id)
        references tenants.tenants (id)
);

comment on table roles is 'table of roles';