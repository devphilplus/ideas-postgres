/**
 * accounting schema
 */
create schema accounting;
set schema 'accounting';


\ir tables/account_types.sql
\ir tables/accounts.sql
\ir tables/accounts_scd.sql
\ir tables/account_balances.sql
\ir tables/account_tree.sql