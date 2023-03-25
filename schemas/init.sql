create procedure init()
language plpgsql
as $$
declare
    default_tenant_id uuid;
    admin_user_id uuid;
begin
    -- create default client
    default_tenant_id := public.gen_random_uuid();
    admin_user_id := default_tenant_id;

    call tenants.tenant_add(
        default_tenant_id,
        'default',
        'default',
        'default tenant'
    );

    call tenants.tenant_set_active(
        default_tenant_id,
        true
    );

    -- create admin user id
    call iam.user_add(
        admin_user_id,
        'admin@default.com',
        'admin'
    );

    call iam.user_set_active(
        admin_user_id,
        true
    );
end
$$;

call init();
drop procedure init();