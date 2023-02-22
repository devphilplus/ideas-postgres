create table registrations (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    email common.email_address,
    token char(30) not null,
    is_verified boolean not null default false,
    
    constraint pk_registrations
        primary key (id),

    -- limit to alphanumeric characters only
    constraint chk_registrations_1
        check (
            token ~ '^[a-zA-Z0-9]*$'
        )
);


create unique index u_registrations_1 on registrations (token)
where is_verified = false
;