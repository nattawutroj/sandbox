alter table "public"."category" alter column "image_url" set default ''::character varying;

alter table "public"."product" alter column "machine_length_cm" drop not null;

alter table "public"."product" alter column "machine_width_cm" drop not null;

alter table "public"."product" alter column "max_working_height_cm" drop not null;

alter table "public"."product" alter column "weight" drop not null;

alter table "public"."product" alter column "weight_capacity_on_platform" drop not null;


