create function currencies_fetch()
returns table (
    id common.currencies.id%type,
    name common.currencies.currency%type,
    unit common.currencies.unit_text%type,
    symbol common.currencies.symbol%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.currency,
        a.unit_text,
        a.symbol
    from common.currencies a
    ;
end
$$;

comment on function currencies_fetch is 'retrieve list of currencies';