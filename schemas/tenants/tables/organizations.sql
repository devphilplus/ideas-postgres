create table organizations (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    name varchar(100) not null,
    description text,

    constraint pk_organizations
        primary key (id),

    constraint u_organizations_1
        unique (tenant_id, name),

    constraint fk_organizations_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict
);

comment on table tenants.organizations is 'table of organizations';
