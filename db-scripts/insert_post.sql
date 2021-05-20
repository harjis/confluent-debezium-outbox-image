\c posts;

INSERT INTO outbox(id, aggregatetype, aggregateid, type, timestamp, payload)
SELECT uuid_generate_v4(),
       'Post',
       MAX(aggregateid::INTEGER) + 1 as max,
       'PostCreated',
       now(),
       CONCAT('{"Id": ', MAX(aggregateid::INTEGER) + 1, ',"Title": "a","Content": "a"}')::json
FROM outbox;

