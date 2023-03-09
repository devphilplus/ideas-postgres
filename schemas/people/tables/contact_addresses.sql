create table contact_addresses (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    people_id uuid not null,

    street text,
    country_id int not null,

    constraint fk_contact_addresses_1
        foreign key (country_id)
        references common.countries (iso_3166_1_numeric)
);