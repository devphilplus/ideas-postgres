create table contact_emails (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    people_id uuid not null,

    email common.email_address,
    verified boolean not null default false,

    constraint pk_contact_emails
        primary key (id),
    constraint u_contact_emails_1
        unique (people_id, email),
    constraint fk_contact_emails_1
        foreign key (people_id)
        references people.people (id)
);