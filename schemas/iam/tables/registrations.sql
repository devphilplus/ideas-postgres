create table registrations (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    email common.email_address,
    is_verified boolean not null default false,
    
    constraint pk_registrations
        primary key (id)
);