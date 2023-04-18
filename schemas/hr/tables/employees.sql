create table employees (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    people_id uuid not null,

    constraint pk_employees
        primary key (id),

    constraint u_employees_1
        unique (tenant_id, people_id),

    constraint fk_employees_1
        foreign key (people_id)
        references people.people (id)
);

comment on table employees is 'table of employees';