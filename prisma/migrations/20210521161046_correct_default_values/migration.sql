-- AlterTable
ALTER TABLE "deadchat_question" ALTER COLUMN "last_used" SET DEFAULT 'now'::timestamp without time zone;

-- AlterTable
ALTER TABLE "topic" ALTER COLUMN "created" SET DEFAULT 'now'::timestamp without time zone;

-- AlterTable
ALTER TABLE "user_group" ALTER COLUMN "last_used" SET DEFAULT ('now'::timestamp without time zone - '01:00:00'::interval);
