create procedure contact_email_add(
    p_id people.contact_emails.id%type,
    p_people_id people.contact_emails.people_id%type,
    p_email people.contact_emails.email%type
)
language plpgsql
as $$
begin
    insert into people.contact_emails (
        id,
        people_id,
        email
    ) values (
        p_id,
        p_people_id,
        p_email
    );
end
$$;

comment on procedure contact_email_add is 'add a record to the contact_emails table';