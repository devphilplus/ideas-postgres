create function tenant_by_id(
    p_tenant_id tenants.tenants.id%type
)
returns table (
    id tenants.tenants.id%type,
    active tenants.tenants.active%type,
    name tenants.tenants.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from tenants.tenants a
    where
        a.id = p_tenant_id
    ;
end
$$;

comment on function tenant_by_id is 'retrieve tenant by id';