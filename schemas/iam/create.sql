/**
 * identity and access management schema
 */
create schema iam;
set schema 'iam';

\ir tables/registrations.sql
\ir tables/users.sql


\ir procs/user_register.sql