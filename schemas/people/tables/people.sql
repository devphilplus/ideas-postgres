create table people (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    given_name varchar(100) not null,
    middle_name varchar(100) not null,
    family_name varchar(100) not null,
    prefix varchar(100),
    suffix varchar(100),

    gender_id smallint,
    ethnicity_id smallint,
    marital_status_id smallint,

    constraint pk_people
        primary key (id),
    constraint u_people_1
        unique (given_name, middle_name, family_name)
);