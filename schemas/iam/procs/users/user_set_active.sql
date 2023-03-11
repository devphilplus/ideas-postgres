create procedure user_set_active(
    p_user_id iam.users.id%type,
    p_active iam.users.active%type
)
language plpgsql
as $$
begin
    update iam.users set
        active = p_active
    where
        id = p_user_id
    ;
end
$$;

comment on procedure user_set_active is 'set user active status';