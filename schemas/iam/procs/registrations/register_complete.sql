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
        a.id,
        a.email
        into
            v_registration_id,
            v_email
    from iam.registrations a
    where
        a.token = p_token
        and a.active = true
        and a.verified is null
    ;

    if v_registration_id is null then
        raise exception 'unknown registration token: %', p_token;
    end if;

    update iam.registrations set
        active = false,
        verified = now() at time zone 'utc'
    where
        id = v_registration_id
    ;

    -- create user account
    call iam.user_add(
        v_registration_id,
        v_email,
        p_pw
    );

    -- add record to people.people
    insert into people.people (
        id,
        active,
        given_name,
        middle_name,
        family_name
    ) values (
        v_registration_id,
        true,
        '',
        '',
        ''
    );

    insert into people.contact_emails (
        id,
        active,
        people_id,
        email,
        verified
    ) values (
        v_registration_id,
        true,
        v_registration_id,
        v_email,
        true
    );

    commit;

    exception
        when no_data_found then
            rollback;
            raise;
        when integrity_constraint_violation then
            rollback;
            raise;
end
$$;

comment on procedure register_complete is 'create user account, set registration email as verified';