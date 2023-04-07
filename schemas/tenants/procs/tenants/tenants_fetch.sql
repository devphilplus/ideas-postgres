create function tenants_fetch()
returns table (
    id tenants.tenants.id%type,
    active tenants.tenants.active%type,
    name tenants.tenants.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from tenants.tenants a
    ;
end
$$;

comment on function tenants_fetch is 'fetch tenants';
