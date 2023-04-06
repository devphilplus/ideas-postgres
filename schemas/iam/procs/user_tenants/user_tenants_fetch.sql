create function user_tenants_fetch(
    p_tenant_id iam.user_tenants.tenant_id%type
)
returns table(
    user_id iam.users.id%type,
    email iam.users.email%type,
    active iam.user_tenants.active%type
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
        join iam.users b
            on a.user_id = b.id
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;

comment on function user_tenants_fetch is 'retrieve users associated with tenant';