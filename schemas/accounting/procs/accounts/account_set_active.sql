create procedure account_set_active(
    p_tenant_id accounting.accounts.tenant_id%type,
    p_account_id accounting.accounts.id%type,
    p_active accounting.accounts.active%type
)
language plpgsql
as $$
begin
    update accountings.accounts set
        active = p_active
    where
        tenant_id = p_tenant_id
        and id = p_account_id
    ;
end
$$;

comment on procedure accounting.account_set_active is 'set account active status';