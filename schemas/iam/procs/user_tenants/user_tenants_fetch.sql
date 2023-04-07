create function user_tenants_fetch(
    p_user_id iam.user_tenants.user_id%type
)
returns table(
    id tenants.tenants.id%type,
    active tenants.tenants.active%type,
    name tenants.tenants.name%type
)
language plpgsql
as $$
begin
    return query
    select
        b.id,
        b.email,
        b.active
    from iam.user_tenants a
        join tenants.tenants b
            on a.tenant_id = b.id
    where
        a.user_id = p_user_id
    ;
end
$$;

comment on function user_tenants_fetch is 'retrieve tenants associated with a user';