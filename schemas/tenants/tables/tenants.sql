create table tenants (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    name varchar(100) not null,
    slug common.slug_text,
    description text,

    constraint pk_tenants
        primary key (id),

    constraint u_tenants_1
        unique (name),
    constraint u_tenants_2
        unique (slug)
);

comment on table tenants is 'table of tenants';