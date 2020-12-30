
ALTER TABLE "public"."leads" ADD COLUMN "test" text;
ALTER TABLE "public"."leads" ALTER COLUMN "test" DROP NOT NULL;

ALTER TABLE "public"."leads" DROP COLUMN "created_at";

ALTER TABLE "public"."leads" DROP COLUMN "test";

ALTER TABLE "public"."leads" DROP COLUMN "hasConfirmed";

ALTER TABLE "public"."leads" DROP COLUMN "email";
