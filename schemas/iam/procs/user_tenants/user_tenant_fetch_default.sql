create function user_tenant_fetch_default(
    p_user_id iam.user_tenants.user_id%type
)
returns table (
    tenant_id tenants.tenants.id%type,
    active tenants.tenants.active%type,
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
        a.active,
        a.name,
        a.slug
    from tenants.tenants a
        join iam.user_tenants b
            on a.id = b.tenant_id
    where
        b.user_id = p_user_id
        and b.is_default = true
    ;

    exception
        when no_data_found then
            return query
            select
                a.id,
                a.active,
                a.name,
                a.slug
            from tenants.tenants a
            where
                a.name = 'default'
            ;
end
$$;

comment on function user_tenant_fetch_default is 'fetch default tenant for user';