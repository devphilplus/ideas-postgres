create function user_tenants_fetch(
    p_user_id iam.user_tenants.user_id%type
)
returns table(
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
        b.id,
        b.active,
        b.name,
        b.slug
    from iam.user_tenants a
        join tenants.tenants b
            on a.tenant_id = b.id
    where
        a.user_id = p_user_id
    ;

    exception
        when no_data_found then
            return query
            select
                a.id,
                a.active,
                a.active,
                a.name
            from tenants.tenants a
            where
                a.name = 'default'
            ;
end
$$;

comment on function user_tenants_fetch is 'retrieve tenants associated with a user';