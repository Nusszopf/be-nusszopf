
ALTER TABLE "public"."leads" ADD COLUMN "email" text NOT NULL UNIQUE;

ALTER TABLE "public"."leads" ADD COLUMN "hasConfirmed" boolean NOT NULL DEFAULT false;

ALTER TABLE "public"."leads" ADD COLUMN "test" text NULL;

ALTER TABLE "public"."leads" ADD COLUMN "created_at" timestamptz NOT NULL DEFAULT now();

ALTER TABLE "public"."leads" DROP COLUMN "test" CASCADE;
