create table registrations (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),
    verified timestamp with time zone null,

    email common.email_address,
    token char(30) not null,
    
    constraint pk_registrations
        primary key (id),

    -- limit to alphanumeric characters only
    constraint chk_registrations_1
        check (
            token ~ '^[a-zA-Z0-9]*$'
        )
);


create unique index u_registrations_1 on registrations (token)
where verified is null
;