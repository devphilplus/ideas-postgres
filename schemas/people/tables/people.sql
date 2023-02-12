create table people (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    first_name varchar(100) not null,
    middle_name varchar(100) not null,
    last_name varchar(100) not null,
    prefix varchar(100),
    suffix varchar(100),

    constraint pk_people
        primary key (id),
    constraint u_people_1
        unique (first_name, middle_name, last_name)
);