alter table "public"."users" add foreign key ("email") references "public"."leads"("email") on update restrict on delete restrict;
