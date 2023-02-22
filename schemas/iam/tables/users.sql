create table users (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    email common.email_address,
    pw text not null,

    email_verified boolean,

    constraint pk_users
        primary key (id)
);