create table organizations (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    client_id uuid not null,

    name varchar(100) not null,
    slug common.slug_text,
    description text,

    constraint pk_organizations
        primary key (id),
    constraint u_organizations_1
        unique (client_id, name),
    constraint u_organizations_2
        unique (client_id, slug),
    constraint fk_organizations_1
        foreign key (client_id)
        references client.clients (id)
);