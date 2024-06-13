alter table "public"."product" drop constraint "yard_id_unique";

alter table "public"."product_prices" drop constraint "product_prices_yard_id_fkey";

alter table "public"."product_yard" drop constraint "product_yard_product_yard_id_fkey";

alter table "public"."yard" drop constraint "yard_county_id_fkey";

alter table "public"."product_yard" drop constraint "product_yard_pkey";

drop index if exists "public"."yard_id_unique";

drop index if exists "public"."product_yard_pkey";

alter table "public"."product" drop column "yard_id";

alter table "public"."product_prices" drop column "delivery_distance_minutes";

alter table "public"."product_prices" drop column "delivery_fee";

alter table "public"."product_prices" drop column "pickup_fee";

alter table "public"."product_prices" drop column "yard_id";

alter table "public"."product_prices" add column "base_delivery_distance_minutes" integer not null;

alter table "public"."product_prices" add column "base_delivery_fee" numeric not null;

alter table "public"."product_prices" add column "base_pickup_fee" numeric not null;

alter table "public"."product_yard" drop column "product_yard_id";

alter table "public"."product_yard" add column "product_id" uuid not null;

alter table "public"."tax_rate" alter column "zipcode" drop not null;

alter table "public"."yard" drop column "county_id";

alter table "public"."yard" add column "zipcode" character varying not null;

CREATE UNIQUE INDEX tax_rate_zipcode_key ON public.tax_rate USING btree (zipcode);

CREATE UNIQUE INDEX product_yard_pkey ON public.product_yard USING btree (product_id, yard_id);

alter table "public"."product_yard" add constraint "product_yard_pkey" PRIMARY KEY using index "product_yard_pkey";

alter table "public"."product_yard" add constraint "public_product_yard_product_id_fkey" FOREIGN KEY (product_id) REFERENCES product(id) not valid;

alter table "public"."product_yard" validate constraint "public_product_yard_product_id_fkey";

alter table "public"."tax_rate" add constraint "tax_rate_zipcode_key" UNIQUE using index "tax_rate_zipcode_key";

alter table "public"."yard" add constraint "public_yard_zipcode_fkey" FOREIGN KEY (zipcode) REFERENCES tax_rate(zipcode) not valid;

alter table "public"."yard" validate constraint "public_yard_zipcode_fkey";


