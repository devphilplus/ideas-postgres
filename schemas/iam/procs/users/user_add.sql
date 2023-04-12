create procedure user_add(
    p_user_id iam.users.id%type,
    p_email iam.users.email%type,
    p_pw iam.users.pw%type
)
language plpgsql
as $$
declare
    v_default_tenant_id tenants.tenants.id%type;
begin
    insert into iam.users (
        id,
        active,
        email,
        pw
    ) values (
        p_user_id,
        true,
        p_email,
        public.crypt(p_pw, public.gen_salt('md5'))
    );

    -- add user to default tenant
    select
        id into v_default_tenant_id
    from tenants.tenant_default_fetch()
    ;

    call iam.user_tenant_add(
        p_user_id,
        v_default_tenant_id
    );

    call iam.user_tenant_set_active(
        p_user_id,
        v_default_tenant_id,
        true
    );

    call iam.user_tenant_set_default(
        p_user_id,
        v_default_tenant_id
    );
end
$$;

comment on procedure user_add is 'add a record to the users table';