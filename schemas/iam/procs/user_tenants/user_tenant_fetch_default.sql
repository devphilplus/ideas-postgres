create function user_tenant_fetch_default(
    p_user_id iam.user_tenants.user_id%type
)
returns table (
    tenant_id tenants.tenants.id%type,
    name tenants.tenants.name%type,
    slug tenants.tenants.slug%type
)
language plpgsql
as $$
begin
    return query
    select
        distinct
        a.id,
        a.name,
        a.slug
    from tenant.tenants a
        join iam.user_tenants b
            on a.id = b.tenant_id
    where
        b.user_id = p_user_id
    ;
end
$$;

comment on function user_tenant_fetch_default is 'fetch default tenant for user';