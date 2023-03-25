create procedure create_default_roles_for_tenant (
    p_tenant_id tenants.tenants.id%type
)
language plpgsql
as $$
declare
    p_role_id iam.roles.id%type;
begin
    p_role_id := public.gen_random_uuid();

    call iam.role_add(
        p_tenant_id,
        p_role_id,
        'default',
        'default',
        'default tenant role'
    );

    call iam.role_set_active(
        p_role_id,
        true
    );
end
$$;

comment on procedure create_default_roles_for_tenant is 'create default role for tenant';