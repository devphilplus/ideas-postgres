create function tenant_by_name(
    p_name tenants.tenants.name%type
)
returns table (
    id tenants.tenants.id%type,
    active tenants.tenants.active%type,
    name tenants.tenants.name%type,
    slug tenants.tenants.slug%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name,
        a.slug
    from tenants.tenants a
    where
        a.name = p_name
    ;
end
$$;

comment on function tenant_by_name is 'retrieve tenant by name';