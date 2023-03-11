/**
 * identity and access management schema
 */
set schema 'iam';

\ir procs/registrations/register.sql
\ir procs/registrations/register_get_info.sql
\ir procs/registrations/register_complete.sql

\ir procs/users/user_add.sql
\ir procs/users/user_authenticate.sql
\ir procs/users/user_by_email.sql