create function user_by_id(
    p_user_id iam.users.id%type
)
returns table (
    id iam.users.id%type,
    active iam.users.active%type,
    email iam.users.email%type,
    given_name people.people.given_name%type,
    middle_name people.people.middle_name%type,
    family_name people.people.family_name%type,
    prefix people.people.prefix%type,
    suffix people.people.suffix%type
)
language plpgsql
as $$
begin
    return query
    select
        p_user_id,
        a.active,
        p_email,
        a.given_name,
        a.middle_name,
        a.family_name,
        a.prefix,
        a.suffix
    from people.people a
    where
        a.id = p_user_id
    ;
end
$$;

comment on function user_by_id is 'retrieve user details given a user id';