create function tenant_by_slug(
    p_slug tenants.tenants.slug%type
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
        a.slug = p_slug
    ;
end
$$;

comment on function tenant_by_slug is 'retrieve tenant by slug';