/**
 * accounting schema
 */
set schema 'accounting';

\ir procs/accounts/account_add.sql
\ir procs/accounts/account_set_active.sql

\ir procs/account_tree/account_tree_add.sql
\ir procs/account_tree/account_tree_set_active.sql