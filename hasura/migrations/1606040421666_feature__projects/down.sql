
alter table "public"."requests" drop constraint "requests_project_id_fkey";

ALTER TABLE "public"."projects" ALTER COLUMN "id" TYPE uuid;

alter table "public"."requests" rename column "project_id" to "user_id";

alter table "public"."requests" add foreign key ("user_id") references "public"."users"("id") on update restrict on delete restrict;

alter table "public"."requests" drop constraint "requests_user_id_fkey";

DROP TABLE "public"."requests";

ALTER TABLE "public"."projects" DROP COLUMN "created_at";

alter table "public"."projects" drop constraint "projects_user_id_fkey";

DROP TABLE "public"."projects";
