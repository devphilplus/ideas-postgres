create procedure contact_email_set_verified(
    p_id people.contact_emails.id%type,
    p_active people.contact_emails.verified%type
)
language plpgsql
as $$
begin
    update people.contact_emails set
        active = p_active
    where
        id = p_id
    ;
end
$$;


comment on procedure contact_email_set_verified is 'set contact email verified status';