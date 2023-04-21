create table org_tree (
    id uuid not null,
    active boolean not null default false,
    created timestamp with time zone not null default(now() at time zone 'utc'),

    tenant_id uuid not null,
    org_id uuid not null,
    parent_org_id uuid not null,

    constraint pk_org_tree
        primary key (tenant_id, org_id, parent_org_id),

    constraint fk_org_tree_1
        foreign key (tenant_id)
        references tenants.tenants (id)
        on delete restrict,
    constraint fk_org_tree_2
        foreign key (org_id)
        references tenants.organizations (id)
        on delete restrict,
    constraint fk_org_tree_3
        foreign key (parent_org_id)
        references tenants.organizations (id)
        on delete restrict
);

comment on table tenants.org_tree is 'organizational tree';
