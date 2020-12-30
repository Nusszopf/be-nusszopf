
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."projects"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "goal" text NOT NULL, "description" Text NOT NULL, "descriptionTemplate" jsonb NOT NULL, "location" jsonb NOT NULL, "period" jsonb NOT NULL, "team" text, "teamTemplate" jsonb, "motto" text, "visibility" text NOT NULL DEFAULT 'private', "contact" text NOT NULL DEFAULT 'mail@nusszopf.org', "user_id" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));

alter table "public"."projects"
           add constraint "projects_user_id_fkey"
           foreign key ("user_id")
           references "public"."users"
           ("id") on update restrict on delete restrict;

ALTER TABLE "public"."projects" ADD COLUMN "created_at" timestamptz NOT NULL DEFAULT now();

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."requests"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "description" text NOT NULL, "descriptionTemplate" jsonb NOT NULL, "category" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "user_id" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));

alter table "public"."requests"
           add constraint "requests_user_id_fkey"
           foreign key ("user_id")
           references "public"."users"
           ("id") on update restrict on delete restrict;

alter table "public"."requests" drop constraint "requests_user_id_fkey";

alter table "public"."requests" rename column "user_id" to "project_id";

ALTER TABLE "public"."projects" ALTER COLUMN "id" TYPE text;

alter table "public"."requests"
           add constraint "requests_project_id_fkey"
           foreign key ("project_id")
           references "public"."projects"
           ("id") on update restrict on delete restrict;
