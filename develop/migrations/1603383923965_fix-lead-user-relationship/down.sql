
alter table "public"."users" rename to "user";

alter table "public"."user" drop constraint "user_email_fkey",
          add constraint "user_email_fkey"
          foreign key ("email")
          references "public"."leads"
          ("email")
          on update set default
          on delete set default;

alter table "public"."user" drop constraint "user_email_fkey",
          add constraint "user_email_fkey"
          foreign key ("email")
          references "public"."leads"
          ("email")
          on update set null
          on delete set null;

alter table "public"."user" drop constraint "user_email_fkey",
          add constraint "user_email_fkey"
          foreign key ("email")
          references "public"."leads"
          ("email")
          on update restrict
          on delete restrict;

alter table "public"."user" drop constraint "user_email_fkey",
          add constraint "user_email_fkey"
          foreign key ("email")
          references "public"."user"
          ("email")
          on update restrict
          on delete restrict;

alter table "public"."user" drop constraint "user_email_fkey";

alter table "public"."user" add foreign key ("email") references "public"."leads"("email") on update restrict on delete restrict;
