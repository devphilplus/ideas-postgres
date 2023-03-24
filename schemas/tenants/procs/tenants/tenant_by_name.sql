create function tenant_by_name(
    p_name tenants.tenant.name%type
)
returns table (
    id tenants.tenant.id%type,
    active tenants.tenant.active%type,
    name tenants.tenant.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from tenants.tenant a
    where
        a.name = p_name
    ;
end
$$;

comment on function tenant_by_name is 'retrieve tenant by name';