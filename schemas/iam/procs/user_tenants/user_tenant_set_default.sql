create procedure user_tenant_set_default(
    p_user_id iam.user_tenants.user_id%type,
    p_tenant_id iam.user_tenants.tenant_id%type
)
language plpgsql
as $$
begin
    update iam.user_tenants set
        is_default = false
    where
        user_id = p_user_id
    ;

    update iam.user_tenants set
        is_default = true
    where
        user_id = p_user_id
        and tenant_id = p_tenant_id
    ;
end
$$;

comment on procedure user_tenant_set_default is 'set default tenant for user';