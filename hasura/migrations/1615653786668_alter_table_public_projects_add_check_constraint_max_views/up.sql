alter table "public"."projects" add constraint "max_views" check (views <= 10000);
