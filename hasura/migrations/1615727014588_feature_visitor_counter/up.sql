
CREATE TABLE "public"."projects_analytics"("project_id" text NOT NULL, "views" Numeric NOT NULL DEFAULT 0, "contact_requests" Numeric NOT NULL DEFAULT 0, PRIMARY KEY ("project_id") , UNIQUE ("project_id"), CONSTRAINT "max_views" CHECK (views<=1000000), CONSTRAINT "max_contact_requests" CHECK (contact_requests<=1000000));

alter table "public"."projects_analytics"
           add constraint "projects_analytics_project_id_fkey"
           foreign key ("project_id")
           references "public"."projects"
           ("id") on update cascade on delete cascade;

alter table "public"."projects_analytics" rename column "contact_requests" to "contactRequests";

alter table "public"."projects_analytics" drop constraint "max_contact_requests";
alter table "public"."projects_analytics" add constraint "max_contact_requests" check ("contactRequests" <= 1000000::numeric);

ALTER TABLE "public"."projects" DROP COLUMN "views" CASCADE;

alter table "public"."projects_analytics" drop constraint "max_contact_requests";
alter table "public"."projects_analytics" add constraint "max_contact_requests" check ("contactRequests" <= 1000000::numeric AND "contactRequests" >= 0::numeric);

alter table "public"."projects_analytics" drop constraint "max_contact_requests";
alter table "public"."projects_analytics" add constraint "max_min_contact_requests" check ("contactRequests" <= 1000000::numeric AND "contactRequests" >= 0::numeric);

alter table "public"."projects_analytics" drop constraint "max_views";
alter table "public"."projects_analytics" add constraint "max_min_views" check (views <= 1000000::numeric AND views >= 0::numeric);

ALTER TABLE "public"."projects_analytics" ALTER COLUMN "views" DROP NOT NULL;

ALTER TABLE "public"."projects_analytics" ALTER COLUMN "contactRequests" DROP NOT NULL;
