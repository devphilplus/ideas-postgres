/**
 * people schema
 */
create schema people;
set schema 'people';

\ir tables/people.sql
\ir tabels/contact_number_types.sql
\ir tables/contact_addresses.sql
\ir tables/contact_emails.sql
\ir tables/contact_numbers.sql


\ir procs/people/people_add.sql
\ir procs/people/people_set_active.sql

\ir procs/contact_emails/contact_email_add.sql
\ir procs/contact_emails/contact_email_set_active.sql