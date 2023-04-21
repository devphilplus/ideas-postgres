create function organizations_fetch(
    p_tenant_id tenants.organizations.id%type
)
returns table (
    organization_id tenants.organizations.id%type,
    active tenants.organizations.active%type,
    name tenants.organizations.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from tenants.organizations a
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;

comment on function tenants.organizations_fetch is 'retrieve organizations';
