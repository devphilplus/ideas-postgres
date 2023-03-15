create table user_clients (
    user_id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    client_id uuid not null,

    constraint pk_user_clients
        primary key (user_id, client_id),
    constraint fk_user_clients_1
        foreign key (user_id)
        references iam.users (id),
    constraint fk_user_clients_2
        foreign key (client_id)
        references client.clients (id)
);

comment on table user_clients is 'user clients';


create table user_clients_scd (
    user_id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    client_id uuid not null,

    constraint fk_user_clients_1
        foreign key (user_id)
        references iam.users (id),
    constraint fk_user_clients_2
        foreign key (client_id)
        references client.clients (id)
);

comment on table user_clients_scd is 'user clients changes';