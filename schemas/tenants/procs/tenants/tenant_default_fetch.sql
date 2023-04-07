create function tenant_default_fetch()
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
        a.name = 'default'
    ;
end
$$;

comment on function tenant_default_fetch is 'retrieve default tenant';