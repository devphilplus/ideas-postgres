create table permissions (
    id bigint not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    name varchar(100) not null,
    description text,

    constraint pk_permissions
        primary key (id),
    constraint u_permissions_1
        unique (name)
);



-- https://www.postgresql.org/docs/12/app-psql.html
permissions
\copy iam.permissions (id, active, name, description) from '/docker-entrypoint-initdb.d/init/permissions.csv' with delimiter ',' csv header quote '"'; 