create procedure contact_email_set_active(
    p_email_id people.contact_emails.id%type,
    p_active people.contact_emails.active%type
)
language plpsql
as $$
begin
    update people.contact_emails set
        active = p_active
    where
        id = p_email_id
    ;
end
$$;
