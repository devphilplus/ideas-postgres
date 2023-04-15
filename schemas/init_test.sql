create procedure init()
language plpgsql
as $$
declare
    test_tenant_id uuid;
    test_user_id uuid;
begin
    test_tenant_id := public.gen_random_uuid();
    test_user_id := test_tenant_id;
    
    call tenants.tenant_add(
        test_tenant_id,
        'test',
        'test',
        'test tenant'

    );

    call tenants.tenant_set_active(
        test_tenant_id,
        true
    );

    call iam.create_default_roles_for_tenant(
        test_tenant_id
    );

    call iam.user_add(
        test_user_id,
        'test@mailinator.com',
        'tester'
    );

    call iam.user_set_active(
        test_user_id,
        true
    );

    -- add user to tenant
    call iam.user_tenant_add(
        test_user_id,
        test_tenant_id
    );

    call iam.user_tenant_set_active(
        test_user_id,
        test_tenant_id,
        true
    );

    -- add people record
    call people.people_add(
        test_tenant_id,
        test_user_id,
        'test',
        'test',
        'test',
        '',
        '',
        1::smallint, -- male
        2::smallint,
        2::smallint
    );

    call people.people_set_active(
        test_user_id,
        true
    );

    -- add contact email record
    call people.contact_email_add(
        test_user_id,
        test_user_id,
        'test@mailinator.com'
    );

    call people.contact_email_set_active(
        test_user_id,
        true
    );
end
$$;

call init();
drop procedure init();