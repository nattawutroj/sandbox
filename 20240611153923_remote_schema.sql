alter table "public"."area" drop constraint "area_state_id_fkey";

alter table "public"."tax_rate" drop constraint "tax_rate_county_id_fkey";

alter table "public"."yard" drop constraint "yard_county_id_fkey";

alter table "public"."area" drop column "state_id";

alter table "public"."state" add column "county_id" uuid not null;

alter table "public"."tax_rate" drop column "county_id";

alter table "public"."tax_rate" add column "state_id" uuid not null;

alter table "public"."yard" drop column "county_id";

alter table "public"."yard" add column "state_id" uuid not null;

alter table "public"."state" add constraint "state_county_id_fkey" FOREIGN KEY (county_id) REFERENCES county(id) not valid;

alter table "public"."state" validate constraint "state_county_id_fkey";

alter table "public"."tax_rate" add constraint "tax_rate_state_id_fkey" FOREIGN KEY (state_id) REFERENCES state(id) not valid;

alter table "public"."tax_rate" validate constraint "tax_rate_state_id_fkey";

alter table "public"."yard" add constraint "yard_state_id_fkey" FOREIGN KEY (state_id) REFERENCES state(id) not valid;

alter table "public"."yard" validate constraint "yard_state_id_fkey";


