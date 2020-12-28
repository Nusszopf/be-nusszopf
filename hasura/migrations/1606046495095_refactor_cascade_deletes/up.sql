
alter table "public"."projects" drop constraint "projects_user_id_fkey",
             add constraint "projects_user_id_fkey"
             foreign key ("user_id")
             references "public"."users"
             ("id") on update restrict on delete cascade;

alter table "public"."requests" drop constraint "requests_project_id_fkey",
             add constraint "requests_project_id_fkey"
             foreign key ("project_id")
             references "public"."projects"
             ("id") on update cascade on delete cascade;

alter table "public"."projects" drop constraint "projects_user_id_fkey",
             add constraint "projects_user_id_fkey"
             foreign key ("user_id")
             references "public"."users"
             ("id") on update cascade on delete cascade;
