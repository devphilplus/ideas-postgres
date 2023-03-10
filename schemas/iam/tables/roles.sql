create table roles (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    client_id uuid not null,
    name varchar(100) not null,
    slug common.slug_text not null,
    description text not null,

    constraint pk_roles
        primary key (id),
    constraint u_roles_1
        unique (client_id, name),
    constraint u_roles_2
        unique (client_id, slug),
    constraint fk_roles_1
        foreign key (client_id)
        references client.clients (id)
);