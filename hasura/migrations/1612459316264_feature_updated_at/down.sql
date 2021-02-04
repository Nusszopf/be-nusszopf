
DROP TRIGGER IF EXISTS "set_public_requests_updated_at" ON "public"."requests";
ALTER TABLE "public"."requests" DROP COLUMN "updated_at";

DROP TRIGGER IF EXISTS "set_public_projects_updated_at" ON "public"."projects";
ALTER TABLE "public"."projects" DROP COLUMN "updated_at";
