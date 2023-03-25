create function tenant_by_name(
    p_name tenants.tenants.name%type
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
        a.name = p_name
    ;
end
$$;

comment on function tenant_by_name is 'retrieve tenant by name';