alter table "public"."state" drop constraint "state_county_id_fkey";

alter table "public"."tax_rate" drop constraint "tax_rate_state_id_fkey";

alter table "public"."yard" drop constraint "yard_state_id_fkey";

alter table "public"."area" add column "state_id" uuid not null;

alter table "public"."state" drop column "county_id";

alter table "public"."tax_rate" drop column "state_id";

alter table "public"."tax_rate" add column "county_id" uuid not null;

alter table "public"."yard" drop column "state_id";

alter table "public"."yard" add column "county_id" uuid not null;

alter table "public"."area" add constraint "area_state_id_fkey" FOREIGN KEY (state_id) REFERENCES state(id) not valid;

alter table "public"."area" validate constraint "area_state_id_fkey";

alter table "public"."tax_rate" add constraint "tax_rate_county_id_fkey" FOREIGN KEY (county_id) REFERENCES county(id) not valid;

alter table "public"."tax_rate" validate constraint "tax_rate_county_id_fkey";

alter table "public"."yard" add constraint "yard_county_id_fkey" FOREIGN KEY (county_id) REFERENCES county(id) not valid;

alter table "public"."yard" validate constraint "yard_county_id_fkey";


