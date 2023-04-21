create procedure account_add(
    p_tenant_id accounting.accounts.tenant_id%type,
    p_account_id accounting.accounts.account_id%type,
    p_name accounting.accounts.name%type,
    p_description accounting.accounts.description%type,
    p_currency_id accounting.accounts.currency_id%type
)
language plpgsql
as $$
begin
    insert into accounting.account (
        id,
        tenant_id,
        name,
        description,
        currency_id
    ) values (
        p_account_id,
        p_tenant_id,
        p_name,
        p_description,
        p_currency_id
    );
end
$$;

comment on procedure accounting.account_add is 'add account record';