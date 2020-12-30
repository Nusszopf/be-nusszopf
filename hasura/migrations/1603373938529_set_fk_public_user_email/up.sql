alter table "public"."user"
           add constraint "user_email_fkey"
           foreign key ("email")
           references "public"."leads"
           ("email") on update restrict on delete restrict;
