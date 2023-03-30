DROP TABLE IF EXISTS "public"."comments";

DROP TABLE IF EXISTS "public"."posts";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "content" text,
    PRIMARY KEY ("id")
);



-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS comments_id_seq;

-- Table Definition
CREATE TABLE "public"."comments" (
    "id" SERIAL,
    "comments" text,
    "post_id" int4,
    "author" text,
    PRIMARY KEY ("id"),
    constraint fk_post foreign key(post_id)
    references posts(id) 
    on delete cascade 
);

INSERT INTO "public"."posts" ("id", "title", "content") VALUES
(1, 'Vacation mode', 'Im going to Miami this week'),
(2, 'New job!!!', 'Im starting a new position as a software engineer');

INSERT INTO "public"."comments" ("id", "comments", "post_id", "author") VALUES
(1, 'Have a nice trip',1, 'Bob'),
(2, 'Congratulations!',2, 'Anne'),
(3, 'Well done!',2,'Tom');


