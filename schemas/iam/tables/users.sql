create table users (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    people_id uuid not null,
    pw text not null,

    constraint pk_users
        primary key (id),
    constraint u_users_1
        unique (people_id),
    constraint fk_users_1
        foreign key (people_id)
        references people.people (id)
);