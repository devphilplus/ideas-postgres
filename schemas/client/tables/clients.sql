create table clients (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    name varchar(100) not null,
    slug common.slug_text,
    description text,

    constraint pk_clients
        primary key (id),

    constraint u_clients_1
        unique (name),
    constraint u_clients_2
        unique (slug)
);