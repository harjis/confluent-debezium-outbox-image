create database posts;
\c posts;
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
VALUES ('579e5184-23c9-43de-8ec3-8c42b26acd7c', 'Post', 1,
        'PostCreated', now(), '{
    "Id": 1,
    "Title": "a",
    "Content": "a"
  }');
