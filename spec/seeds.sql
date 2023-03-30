TRUNCATE TABLE posts, comments RESTART IDENTITY;

INSERT INTO "public"."posts" ("title", "content") VALUES
('Vacation mode', 'Im going to Miami this week'),
('New job!!!', 'Im starting a new position as a software engineer');

INSERT INTO "public"."comments" ("comments", "post_id") VALUES
('Have a nice trip',1),
('Congratulations!',2),
('Well done!',2);
