create procedure tenant_update(
    p_tenant_id tenants.tenants.id%type,
    p_name tenants.tenants.name%type,
    p_slug tenants.tenants.slug%type,
    p_desc tenants.tenants.description%type
)
language plpgsql
as $$
begin
    update tenants.tenants set
        name = p_name,
        slug = p_slug,
        description = p_desc
    where
        id = p_tenant_id
    ;
end
$$;

comment on procedure tenant_update is 'update tenant record';