create procedure tenant_add(
    p_tenant_id tenants.tenants.id%type,
    p_name tenants.tenants.name%type,
    p_slug tenants.tenants.slug%type,
    p_desc tenants.tenants.description%type
)
language plpgsql
as $$
begin
    insert into tenants.tenants (
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