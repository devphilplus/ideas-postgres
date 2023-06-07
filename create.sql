create database eas;
\c eas

create extension if not exists pgcrypto;


\ir schemas/create.sql
\ir schemas/init.sql
\ir schemas/init_test.sql
\ir schemas/init_test1.sql
