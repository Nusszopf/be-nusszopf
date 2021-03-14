
ALTER TABLE "public"."projects_analytics" ALTER COLUMN "contactRequests" SET NOT NULL;

ALTER TABLE "public"."projects_analytics" ALTER COLUMN "views" SET NOT NULL;

alter table "public"."projects_analytics" drop constraint "max_min_views";
alter table "public"."projects_analytics" add constraint "max_views" check (CHECK (views <= 1000000::numeric));

alter table "public"."projects_analytics" drop constraint "max_min_contact_requests";
alter table "public"."projects_analytics" add constraint "max_contact_requests" check (CHECK ("contactRequests" <= 1000000::numeric AND "contactRequests" >= 0::numeric));

alter table "public"."projects_analytics" drop constraint "max_contact_requests";
alter table "public"."projects_analytics" add constraint "max_contact_requests" check (CHECK ("contactRequests" <= 1000000::numeric));

ALTER TABLE "public"."projects" ADD COLUMN "views" numeric;
ALTER TABLE "public"."projects" ALTER COLUMN "views" DROP NOT NULL;
ALTER TABLE "public"."projects" ALTER COLUMN "views" SET DEFAULT 0;

alter table "public"."projects_analytics" drop constraint "max_contact_requests";
alter table "public"."projects_analytics" add constraint "max_contact_requests" check (CHECK ("contactRequests" <= 1000000::numeric));

alter table "public"."projects_analytics" rename column "contactRequests" to "contact_requests";

alter table "public"."projects_analytics" drop constraint "projects_analytics_project_id_fkey";

DROP TABLE "public"."projects_analytics";
