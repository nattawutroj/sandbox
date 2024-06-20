create table "public"."quick_contact" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null,
    "phone_number" character varying not null,
    "email" character varying not null,
    "created_at" timestamp without time zone
);


CREATE UNIQUE INDEX quick_contact_pkey ON public.quick_contact USING btree (id);

alter table "public"."quick_contact" add constraint "quick_contact_pkey" PRIMARY KEY using index "quick_contact_pkey";

grant delete on table "public"."quick_contact" to "anon";

grant insert on table "public"."quick_contact" to "anon";

grant references on table "public"."quick_contact" to "anon";

grant select on table "public"."quick_contact" to "anon";

grant trigger on table "public"."quick_contact" to "anon";

grant truncate on table "public"."quick_contact" to "anon";

grant update on table "public"."quick_contact" to "anon";

grant delete on table "public"."quick_contact" to "authenticated";

grant insert on table "public"."quick_contact" to "authenticated";

grant references on table "public"."quick_contact" to "authenticated";

grant select on table "public"."quick_contact" to "authenticated";

grant trigger on table "public"."quick_contact" to "authenticated";

grant truncate on table "public"."quick_contact" to "authenticated";

grant update on table "public"."quick_contact" to "authenticated";

grant delete on table "public"."quick_contact" to "service_role";

grant insert on table "public"."quick_contact" to "service_role";

grant references on table "public"."quick_contact" to "service_role";

grant select on table "public"."quick_contact" to "service_role";

grant trigger on table "public"."quick_contact" to "service_role";

grant truncate on table "public"."quick_contact" to "service_role";

grant update on table "public"."quick_contact" to "service_role";


