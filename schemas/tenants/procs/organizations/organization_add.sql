create procedure organization_add(
    p_tenant_id tenants.organizations.tenant_id%type,
    p_organization_id tenants.organizations.id%type,
    p_name tenants.organizations.name%type,
    p_description tenants.organizations.description%type
)
language plpgsql
as $$
begin
    insert into tenants.organizations (
        id,
        tenant_id,
        name,
        description
    ) valeus (
        p_organization_id,
        p_tenant_id,
        p_name,
        p_description
    );
end
$$;

comment on procedure tenants.organization_add is 'add a record to the organizations table';
