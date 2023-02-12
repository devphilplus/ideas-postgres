create table members (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    client_id uuid not null,
    people_id uuid not null,

    constraint pk_members
        primary key (id),
    constraint u_members_1
        unique (client_id, people_id),
    constraint fk_members_1
        foreign key (client_id)
        references client.clients (id),
    constraint fk_members_2
        references people.people (id)
);