create procedure user_tenant_set_active(
    p_user_id iam.user_tenants.user_id%type,
    p_tenant_id iam.user_tenants.tenant_id%type,
    p_active iam.user_tenants.active%type
)
language plpgsql
as $$
begin
    insert into iam.user_tenants_scd (
        user_id,
        active,
        tenant_id
    )
    select
        a.user_id,
        a.active,
        a.tenant_id
    from iam.user_tenants a
    where
        a.user_id = p_user_id
        and a.tenant_id = p_tenant_id
    ;

    update iam.user_tenants set
        active = p_active
    where
        user_id = p_user_id
        and tenant_id = p_tenant_id
    ;
end
$$;

comment on procedure user_tenant_set_active is 'set user-tenant active status';