create procedure register_complete(
    p_token iam.registrations.token%type,
    p_pw iam.users.pw%type
)
language plpgsql
as $$
declare
    v_registration_id iam.users.id%type;
    v_email common.email_address; 
begin
    select
        id,
        email
        into
            v_registration_id,
            v_email
    from iam.registrations
    where
        token = p_token
        and active = true
        and verified is null
    ;

    update iam.registrations set
        active = false,
        verified = now() at time zone 'utc'
    where
        id = v_registration_id
    ;

    insert into iam.users (
        id,
        active,
        email,
        pw
    ) values (
        v_registration_id,
        true,
        v_email,
        public.crypt(p_pw, public.gen_salt('md5'))
    );
end
$$;

comment on procedure register_complete is 'create user account, set registration email as verified';