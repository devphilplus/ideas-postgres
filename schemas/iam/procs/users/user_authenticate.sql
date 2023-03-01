create function user_authenticate(
    p_email iam.users.email%type,
    p_pw iam.users.pw%type
)
returns boolean
language plpgsql
as $$
declare
    v_authentic boolean;
begin
    select
        a.pw = public.crypt(p_pw, a.pw)
        into strict
        v_authentic
    from iam.users a
    where
        a.email = p_email
        and a.active = true
    ;

    return v_authentic;

    exception
        when no_data_found then
            return false;
end
$$;