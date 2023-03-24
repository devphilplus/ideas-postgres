create procedure tenant_add(
    p_tenant_id tenants.tenant.id%type,
    p_name tenants.tenant.name%type,
    p_slug tenants.tenant.slug%type,
    p_desc tenants.tenant.description%type
)
language plpgsql
as $$
begin
    insert into tenants.tenant (
        id,
        name,
        slug,
        description
    ) values (
        p_tenant_id,
        p_name,
        p_slug,
        p_desc
    );
end
$$;

comment on procedure tenant_add is 'add tenant record';