create table user_tenants (
    user_id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,

    constraint pk_user_tenants
        primary key (user_id, tenant_id),
    constraint fk_tenants_1
        foreign key (user_id)
        references iam.users (id),
    constraint fk_user_tenants_2
        foreign key (tenant_id)
        references tenants.tenants (id)
);

comment on table user_tenants is 'user tenants';


create table user_tenants_scd (
    user_id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,

    constraint fk_user_tenants_scd_1
        foreign key (user_id)
        references iam.users (id),
    constraint fk_user_tenants_scd_2
        foreign key (tenant_id)
        references tenants.tenants (id)
);

comment on table user_tenants_scd is 'user-tenants changes';