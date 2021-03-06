create database posts;
\c posts;
create extension "uuid-ossp";
create table outbox
(
    id            uuid         not null
        constraint outbox_pkey
            primary key,
    aggregatetype varchar(255) not null,
    aggregateid   varchar(255) not null,
    type          varchar(255) not null,
    timestamp     varchar      not null,
    payload       jsonb
);

INSERT INTO outbox(id, aggregatetype, aggregateid, type, timestamp, payload)
VALUES (uuid_generate_v4(), 'Post', 1, 'PostCreated', now(), '{
  "Id": 1,
  "Title": "a",
  "Content": "a"
}');
