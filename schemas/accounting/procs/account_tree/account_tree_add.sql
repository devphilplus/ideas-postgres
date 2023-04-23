create procedure account_tree_add(
    p_tenant_id accounting.account_tree.tenant_id%type,
    p_account_id accounting.account_tree.account_id%type,
    p_parent_account_id accounting.account_tree.parent_account_id%type
)
language plpgsql
as $$
begin
    insert into accounting.account_tree (
        tenant_id,
        account_id,
        parent_account_id
    ) values (
        p_tenant_id,
        p_account_id,
        p_parent_account_id
    );
end
$$;

comment on procedure accounting.account_tree_add is 'add an account_tree record';