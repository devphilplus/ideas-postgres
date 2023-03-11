create procedure user_add(
    p_user_id iam.users.id%type,
    p_email iam.users.email%type,
    p_pw iam.users.pw%type
)
language plpgsql
as $$
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
end
$$;

comment on procedure user_add is 'add a record to the users table';