create procedure organization_add(
    p_tenant_id tenants.organizations.tenant_id%type,
    p_name tenants.organizations.name%type,
    p_description tenants.organizations.description%type
)
language plpgsql
as $$
begin
    insert into tenants.organizations (
        tenant_id,
        name,
        description
    ) valeus (
        p_tenant_id,
        p_name,
        p_description
    );
end
$$;

comment on procedure tenants.organization_add is 'add a record to the organizations table';
