create or replace function countries_fetch()
returns table (
    id common.countries.iso_3166_1_numeric%type,
    name common.countries.official_name_en%type,
    iso_3166_1_alpha_2 common.countries.iso_3166_1_alpha_2%type,
    iso_3166_1_alpha_3 common.countries.iso_3166_1_alpha_3%type,
    iso_4217_currency_numeric_code common.countries.iso_4217_currency_numeric_code%type
)
language plpgsql
as $$
begin
    return query
    select
        a.iso_3166_1_numeric,
        a.official_name_en,
        a.iso_3166_1_alpha_2,
        a.iso_3166_1_alpha_3,
        a.iso_4217_currency_numeric_code
    from common.countries a
    ;
end
$$;

comment on function countries_fetch is 'retrieve all countries';