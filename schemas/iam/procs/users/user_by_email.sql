create function user_by_email(
    p_email iam.users.email%type
)
returns table (
    email common.email_address%type,
    given_name people.people.given_name%type,
    middle_name people.people.middle_name%type,
    family_name people.people.family_name%type,
    prefix people.people.prefix%type,
    suffix people.people.suffix%type
)
language plpgsql
as $$
declare
    user_id iam.users.id%type;
begin
    select
        id into user_id
    from iam.users a
    where
        a.email = p_email
    ;

    return query
    select
        p_email,
        a.given_name,
        a.middle_name,
        a.family_name,
        a.prefix,
        a.suffix
    from people.people a
    where
        a.id = user_id
    ;
end
$$;

comment on function user_by_email is 'retrieve user details given an email address';