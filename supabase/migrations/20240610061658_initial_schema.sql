create type "public"."CartStatus" as enum ('Created', 'Checkout');

create table "public"."address" (
    "id" uuid not null default gen_random_uuid(),
    "user_detail_id" uuid,
    "name" character varying not null,
    "address" character varying not null,
    "zipcode" character varying not null
);


create table "public"."area" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null
);


create table "public"."cart" (
    "id" uuid not null default gen_random_uuid(),
    "user_detail_id" uuid,
    "status" "CartStatus" not null default 'Created'::"CartStatus"
);


create table "public"."cart_product" (
    "id" uuid not null default gen_random_uuid(),
    "cart_id" uuid not null,
    "product_id" uuid not null,
    "tax_rate_id" uuid,
    "quantity" integer not null default 1,
    "deliver_at" date,
    "pick_up_at" date
);


create table "public"."category" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null
);


create table "public"."county" (
    "id" uuid not null default gen_random_uuid(),
    "area_id" uuid not null,
    "name" character varying not null
);


create table "public"."order" (
    "id" uuid not null default gen_random_uuid(),
    "user_detail_id" uuid,
    "visitor_id" uuid,
    "address_id" uuid not null,
    "total_price" numeric not null,
    "signed_at" timestamp without time zone not null,
    "signator" character varying not null
);


create table "public"."order_product" (
    "id" uuid not null default gen_random_uuid(),
    "order_id" uuid not null,
    "product_id" uuid not null,
    "tax_rate_id" uuid,
    "delivery_time" numeric not null,
    "distance" numeric not null,
    "state_rate" numeric,
    "county_rate" numeric,
    "city_rate" numeric,
    "special_rate" numeric,
    "combined_rate" numeric not null default 0,
    "quantity" integer not null,
    "rush_fee" numeric,
    "weekend_days" integer not null default 0,
    "deliver_at" date,
    "pick_up_at" date
);


create table "public"."product" (
    "id" uuid not null default gen_random_uuid(),
    "yard_id" uuid not null,
    "name" character varying not null,
    "description" text not null,
    "sku" text not null,
    "image_url" character varying not null,
    "details" character varying not null,
    "capacity" character varying not null,
    "options" character varying not null,
    "fuels" character varying not null,
    "models" character varying not null,
    "category_id" uuid not null,
    "equipment_id" character varying not null
);


create table "public"."product_prices" (
    "id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null,
    "yard_id" uuid not null,
    "daily_rental_price" numeric not null,
    "weekly_rental_price" numeric not null,
    "monthly_rental_price" numeric not null,
    "delivery_fee" numeric not null,
    "pickup_fee" numeric not null,
    "extra_delivery_fee" numeric not null,
    "delivery_distance_minutes" integer not null,
    "apply_tax_rate" boolean not null,
    "rpp_fees" numeric not null default 10,
    "fees" numeric not null default 8,
    "weight" integer not null default 0
);


create table "public"."product_yard" (
    "product_yard_id" uuid not null,
    "yard_id" uuid not null
);


create table "public"."state" (
    "id" uuid not null default gen_random_uuid(),
    "county_id" uuid not null,
    "name" character varying not null
);


create table "public"."tax_rate" (
    "id" uuid not null default gen_random_uuid(),
    "state_id" uuid not null,
    "zipcode" character varying not null,
    "tax_region_name" character varying not null,
    "state_rate" numeric not null default 0.06,
    "county_rate" numeric not null default 0.0025,
    "city_rate" numeric not null default 0,
    "special_rate" numeric not null default 0.0325,
    "risk_level" integer not null default 0
);


create table "public"."user_detail" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "rental_agreed_at" timestamp without time zone not null
);


create table "public"."vendor" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null
);


create table "public"."visitor" (
    "id" uuid not null default gen_random_uuid(),
    "firstname" character varying not null,
    "lastname" character varying not null,
    "email" character varying not null,
    "phone_number" character varying not null
);


create table "public"."yard" (
    "id" uuid not null default gen_random_uuid(),
    "vendor_id" uuid not null,
    "state_id" uuid not null,
    "name" character varying not null,
    "address" character varying not null
);


CREATE UNIQUE INDEX address_pkey ON public.address USING btree (id);

CREATE UNIQUE INDEX area_pkey ON public.area USING btree (id);

CREATE UNIQUE INDEX cart_pkey ON public.cart USING btree (id);

CREATE UNIQUE INDEX cart_product_pkey ON public.cart_product USING btree (id);

CREATE UNIQUE INDEX category_pkey ON public.category USING btree (id);

CREATE UNIQUE INDEX county_pkey ON public.county USING btree (id);

CREATE UNIQUE INDEX order_pkey ON public."order" USING btree (id);

CREATE UNIQUE INDEX order_product_pkey ON public.order_product USING btree (id);

CREATE UNIQUE INDEX product_pkey ON public.product USING btree (id);

CREATE UNIQUE INDEX product_prices_pkey ON public.product_prices USING btree (id);

CREATE UNIQUE INDEX product_yard_pkey ON public.product_yard USING btree (product_yard_id, yard_id);

CREATE UNIQUE INDEX state_pkey ON public.state USING btree (id);

CREATE UNIQUE INDEX tax_rate_pkey ON public.tax_rate USING btree (id);

CREATE UNIQUE INDEX user_detail_pkey ON public.user_detail USING btree (id);

CREATE UNIQUE INDEX vendor_pkey ON public.vendor USING btree (id);

CREATE UNIQUE INDEX visitor_pkey ON public.visitor USING btree (id);

CREATE UNIQUE INDEX yard_id_unique ON public.product USING btree (yard_id);

CREATE UNIQUE INDEX yard_pkey ON public.yard USING btree (id);

alter table "public"."address" add constraint "address_pkey" PRIMARY KEY using index "address_pkey";

alter table "public"."area" add constraint "area_pkey" PRIMARY KEY using index "area_pkey";

alter table "public"."cart" add constraint "cart_pkey" PRIMARY KEY using index "cart_pkey";

alter table "public"."cart_product" add constraint "cart_product_pkey" PRIMARY KEY using index "cart_product_pkey";

alter table "public"."category" add constraint "category_pkey" PRIMARY KEY using index "category_pkey";

alter table "public"."county" add constraint "county_pkey" PRIMARY KEY using index "county_pkey";

alter table "public"."order" add constraint "order_pkey" PRIMARY KEY using index "order_pkey";

alter table "public"."order_product" add constraint "order_product_pkey" PRIMARY KEY using index "order_product_pkey";

alter table "public"."product" add constraint "product_pkey" PRIMARY KEY using index "product_pkey";

alter table "public"."product_prices" add constraint "product_prices_pkey" PRIMARY KEY using index "product_prices_pkey";

alter table "public"."product_yard" add constraint "product_yard_pkey" PRIMARY KEY using index "product_yard_pkey";

alter table "public"."state" add constraint "state_pkey" PRIMARY KEY using index "state_pkey";

alter table "public"."tax_rate" add constraint "tax_rate_pkey" PRIMARY KEY using index "tax_rate_pkey";

alter table "public"."user_detail" add constraint "user_detail_pkey" PRIMARY KEY using index "user_detail_pkey";

alter table "public"."vendor" add constraint "vendor_pkey" PRIMARY KEY using index "vendor_pkey";

alter table "public"."visitor" add constraint "visitor_pkey" PRIMARY KEY using index "visitor_pkey";

alter table "public"."yard" add constraint "yard_pkey" PRIMARY KEY using index "yard_pkey";

alter table "public"."address" add constraint "address_user_detail_id_fkey" FOREIGN KEY (user_detail_id) REFERENCES user_detail(id) not valid;

alter table "public"."address" validate constraint "address_user_detail_id_fkey";

alter table "public"."cart" add constraint "cart_user_detail_id_fkey" FOREIGN KEY (user_detail_id) REFERENCES user_detail(id) not valid;

alter table "public"."cart" validate constraint "cart_user_detail_id_fkey";

alter table "public"."cart_product" add constraint "cart_product_cart_id_fkey" FOREIGN KEY (cart_id) REFERENCES cart(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_cart_id_fkey";

alter table "public"."cart_product" add constraint "cart_product_product_id_fkey" FOREIGN KEY (product_id) REFERENCES product(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_product_id_fkey";

alter table "public"."cart_product" add constraint "cart_product_tax_rate_id_fkey" FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_tax_rate_id_fkey";

alter table "public"."county" add constraint "county_area_id_fkey" FOREIGN KEY (area_id) REFERENCES area(id) not valid;

alter table "public"."county" validate constraint "county_area_id_fkey";

alter table "public"."order" add constraint "order_address_id_fkey" FOREIGN KEY (address_id) REFERENCES address(id) not valid;

alter table "public"."order" validate constraint "order_address_id_fkey";

alter table "public"."order" add constraint "order_user_detail_id_fkey" FOREIGN KEY (user_detail_id) REFERENCES user_detail(id) not valid;

alter table "public"."order" validate constraint "order_user_detail_id_fkey";

alter table "public"."order" add constraint "order_visitor_id_fkey" FOREIGN KEY (visitor_id) REFERENCES visitor(id) not valid;

alter table "public"."order" validate constraint "order_visitor_id_fkey";

alter table "public"."order_product" add constraint "order_product_order_id_fkey" FOREIGN KEY (order_id) REFERENCES "order"(id) not valid;

alter table "public"."order_product" validate constraint "order_product_order_id_fkey";

alter table "public"."order_product" add constraint "order_product_product_id_fkey" FOREIGN KEY (product_id) REFERENCES product(id) not valid;

alter table "public"."order_product" validate constraint "order_product_product_id_fkey";

alter table "public"."order_product" add constraint "order_product_tax_rate_id_fkey" FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id) not valid;

alter table "public"."order_product" validate constraint "order_product_tax_rate_id_fkey";

alter table "public"."product" add constraint "product_category_id_fkey" FOREIGN KEY (category_id) REFERENCES category(id) not valid;

alter table "public"."product" validate constraint "product_category_id_fkey";

alter table "public"."product" add constraint "yard_id_unique" UNIQUE using index "yard_id_unique";

alter table "public"."product_prices" add constraint "product_prices_product_id_fkey" FOREIGN KEY (product_id) REFERENCES product(id) not valid;

alter table "public"."product_prices" validate constraint "product_prices_product_id_fkey";

alter table "public"."product_prices" add constraint "product_prices_yard_id_fkey" FOREIGN KEY (yard_id) REFERENCES yard(id) not valid;

alter table "public"."product_prices" validate constraint "product_prices_yard_id_fkey";

alter table "public"."product_yard" add constraint "product_yard_product_yard_id_fkey" FOREIGN KEY (product_yard_id) REFERENCES product(yard_id) not valid;

alter table "public"."product_yard" validate constraint "product_yard_product_yard_id_fkey";

alter table "public"."product_yard" add constraint "product_yard_yard_id_fkey" FOREIGN KEY (yard_id) REFERENCES yard(id) not valid;

alter table "public"."product_yard" validate constraint "product_yard_yard_id_fkey";

alter table "public"."state" add constraint "state_county_id_fkey" FOREIGN KEY (county_id) REFERENCES county(id) not valid;

alter table "public"."state" validate constraint "state_county_id_fkey";

alter table "public"."tax_rate" add constraint "tax_rate_state_id_fkey" FOREIGN KEY (state_id) REFERENCES state(id) not valid;

alter table "public"."tax_rate" validate constraint "tax_rate_state_id_fkey";

alter table "public"."yard" add constraint "yard_state_id_fkey" FOREIGN KEY (state_id) REFERENCES state(id) not valid;

alter table "public"."yard" validate constraint "yard_state_id_fkey";

alter table "public"."yard" add constraint "yard_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES vendor(id) not valid;

alter table "public"."yard" validate constraint "yard_vendor_id_fkey";

grant delete on table "public"."address" to "anon";

grant insert on table "public"."address" to "anon";

grant references on table "public"."address" to "anon";

grant select on table "public"."address" to "anon";

grant trigger on table "public"."address" to "anon";

grant truncate on table "public"."address" to "anon";

grant update on table "public"."address" to "anon";

grant delete on table "public"."address" to "authenticated";

grant insert on table "public"."address" to "authenticated";

grant references on table "public"."address" to "authenticated";

grant select on table "public"."address" to "authenticated";

grant trigger on table "public"."address" to "authenticated";

grant truncate on table "public"."address" to "authenticated";

grant update on table "public"."address" to "authenticated";

grant delete on table "public"."address" to "service_role";

grant insert on table "public"."address" to "service_role";

grant references on table "public"."address" to "service_role";

grant select on table "public"."address" to "service_role";

grant trigger on table "public"."address" to "service_role";

grant truncate on table "public"."address" to "service_role";

grant update on table "public"."address" to "service_role";

grant delete on table "public"."area" to "anon";

grant insert on table "public"."area" to "anon";

grant references on table "public"."area" to "anon";

grant select on table "public"."area" to "anon";

grant trigger on table "public"."area" to "anon";

grant truncate on table "public"."area" to "anon";

grant update on table "public"."area" to "anon";

grant delete on table "public"."area" to "authenticated";

grant insert on table "public"."area" to "authenticated";

grant references on table "public"."area" to "authenticated";

grant select on table "public"."area" to "authenticated";

grant trigger on table "public"."area" to "authenticated";

grant truncate on table "public"."area" to "authenticated";

grant update on table "public"."area" to "authenticated";

grant delete on table "public"."area" to "service_role";

grant insert on table "public"."area" to "service_role";

grant references on table "public"."area" to "service_role";

grant select on table "public"."area" to "service_role";

grant trigger on table "public"."area" to "service_role";

grant truncate on table "public"."area" to "service_role";

grant update on table "public"."area" to "service_role";

grant delete on table "public"."cart" to "anon";

grant insert on table "public"."cart" to "anon";

grant references on table "public"."cart" to "anon";

grant select on table "public"."cart" to "anon";

grant trigger on table "public"."cart" to "anon";

grant truncate on table "public"."cart" to "anon";

grant update on table "public"."cart" to "anon";

grant delete on table "public"."cart" to "authenticated";

grant insert on table "public"."cart" to "authenticated";

grant references on table "public"."cart" to "authenticated";

grant select on table "public"."cart" to "authenticated";

grant trigger on table "public"."cart" to "authenticated";

grant truncate on table "public"."cart" to "authenticated";

grant update on table "public"."cart" to "authenticated";

grant delete on table "public"."cart" to "service_role";

grant insert on table "public"."cart" to "service_role";

grant references on table "public"."cart" to "service_role";

grant select on table "public"."cart" to "service_role";

grant trigger on table "public"."cart" to "service_role";

grant truncate on table "public"."cart" to "service_role";

grant update on table "public"."cart" to "service_role";

grant delete on table "public"."cart_product" to "anon";

grant insert on table "public"."cart_product" to "anon";

grant references on table "public"."cart_product" to "anon";

grant select on table "public"."cart_product" to "anon";

grant trigger on table "public"."cart_product" to "anon";

grant truncate on table "public"."cart_product" to "anon";

grant update on table "public"."cart_product" to "anon";

grant delete on table "public"."cart_product" to "authenticated";

grant insert on table "public"."cart_product" to "authenticated";

grant references on table "public"."cart_product" to "authenticated";

grant select on table "public"."cart_product" to "authenticated";

grant trigger on table "public"."cart_product" to "authenticated";

grant truncate on table "public"."cart_product" to "authenticated";

grant update on table "public"."cart_product" to "authenticated";

grant delete on table "public"."cart_product" to "service_role";

grant insert on table "public"."cart_product" to "service_role";

grant references on table "public"."cart_product" to "service_role";

grant select on table "public"."cart_product" to "service_role";

grant trigger on table "public"."cart_product" to "service_role";

grant truncate on table "public"."cart_product" to "service_role";

grant update on table "public"."cart_product" to "service_role";

grant delete on table "public"."category" to "anon";

grant insert on table "public"."category" to "anon";

grant references on table "public"."category" to "anon";

grant select on table "public"."category" to "anon";

grant trigger on table "public"."category" to "anon";

grant truncate on table "public"."category" to "anon";

grant update on table "public"."category" to "anon";

grant delete on table "public"."category" to "authenticated";

grant insert on table "public"."category" to "authenticated";

grant references on table "public"."category" to "authenticated";

grant select on table "public"."category" to "authenticated";

grant trigger on table "public"."category" to "authenticated";

grant truncate on table "public"."category" to "authenticated";

grant update on table "public"."category" to "authenticated";

grant delete on table "public"."category" to "service_role";

grant insert on table "public"."category" to "service_role";

grant references on table "public"."category" to "service_role";

grant select on table "public"."category" to "service_role";

grant trigger on table "public"."category" to "service_role";

grant truncate on table "public"."category" to "service_role";

grant update on table "public"."category" to "service_role";

grant delete on table "public"."county" to "anon";

grant insert on table "public"."county" to "anon";

grant references on table "public"."county" to "anon";

grant select on table "public"."county" to "anon";

grant trigger on table "public"."county" to "anon";

grant truncate on table "public"."county" to "anon";

grant update on table "public"."county" to "anon";

grant delete on table "public"."county" to "authenticated";

grant insert on table "public"."county" to "authenticated";

grant references on table "public"."county" to "authenticated";

grant select on table "public"."county" to "authenticated";

grant trigger on table "public"."county" to "authenticated";

grant truncate on table "public"."county" to "authenticated";

grant update on table "public"."county" to "authenticated";

grant delete on table "public"."county" to "service_role";

grant insert on table "public"."county" to "service_role";

grant references on table "public"."county" to "service_role";

grant select on table "public"."county" to "service_role";

grant trigger on table "public"."county" to "service_role";

grant truncate on table "public"."county" to "service_role";

grant update on table "public"."county" to "service_role";

grant delete on table "public"."order" to "anon";

grant insert on table "public"."order" to "anon";

grant references on table "public"."order" to "anon";

grant select on table "public"."order" to "anon";

grant trigger on table "public"."order" to "anon";

grant truncate on table "public"."order" to "anon";

grant update on table "public"."order" to "anon";

grant delete on table "public"."order" to "authenticated";

grant insert on table "public"."order" to "authenticated";

grant references on table "public"."order" to "authenticated";

grant select on table "public"."order" to "authenticated";

grant trigger on table "public"."order" to "authenticated";

grant truncate on table "public"."order" to "authenticated";

grant update on table "public"."order" to "authenticated";

grant delete on table "public"."order" to "service_role";

grant insert on table "public"."order" to "service_role";

grant references on table "public"."order" to "service_role";

grant select on table "public"."order" to "service_role";

grant trigger on table "public"."order" to "service_role";

grant truncate on table "public"."order" to "service_role";

grant update on table "public"."order" to "service_role";

grant delete on table "public"."order_product" to "anon";

grant insert on table "public"."order_product" to "anon";

grant references on table "public"."order_product" to "anon";

grant select on table "public"."order_product" to "anon";

grant trigger on table "public"."order_product" to "anon";

grant truncate on table "public"."order_product" to "anon";

grant update on table "public"."order_product" to "anon";

grant delete on table "public"."order_product" to "authenticated";

grant insert on table "public"."order_product" to "authenticated";

grant references on table "public"."order_product" to "authenticated";

grant select on table "public"."order_product" to "authenticated";

grant trigger on table "public"."order_product" to "authenticated";

grant truncate on table "public"."order_product" to "authenticated";

grant update on table "public"."order_product" to "authenticated";

grant delete on table "public"."order_product" to "service_role";

grant insert on table "public"."order_product" to "service_role";

grant references on table "public"."order_product" to "service_role";

grant select on table "public"."order_product" to "service_role";

grant trigger on table "public"."order_product" to "service_role";

grant truncate on table "public"."order_product" to "service_role";

grant update on table "public"."order_product" to "service_role";

grant delete on table "public"."product" to "anon";

grant insert on table "public"."product" to "anon";

grant references on table "public"."product" to "anon";

grant select on table "public"."product" to "anon";

grant trigger on table "public"."product" to "anon";

grant truncate on table "public"."product" to "anon";

grant update on table "public"."product" to "anon";

grant delete on table "public"."product" to "authenticated";

grant insert on table "public"."product" to "authenticated";

grant references on table "public"."product" to "authenticated";

grant select on table "public"."product" to "authenticated";

grant trigger on table "public"."product" to "authenticated";

grant truncate on table "public"."product" to "authenticated";

grant update on table "public"."product" to "authenticated";

grant delete on table "public"."product" to "service_role";

grant insert on table "public"."product" to "service_role";

grant references on table "public"."product" to "service_role";

grant select on table "public"."product" to "service_role";

grant trigger on table "public"."product" to "service_role";

grant truncate on table "public"."product" to "service_role";

grant update on table "public"."product" to "service_role";

grant delete on table "public"."product_prices" to "anon";

grant insert on table "public"."product_prices" to "anon";

grant references on table "public"."product_prices" to "anon";

grant select on table "public"."product_prices" to "anon";

grant trigger on table "public"."product_prices" to "anon";

grant truncate on table "public"."product_prices" to "anon";

grant update on table "public"."product_prices" to "anon";

grant delete on table "public"."product_prices" to "authenticated";

grant insert on table "public"."product_prices" to "authenticated";

grant references on table "public"."product_prices" to "authenticated";

grant select on table "public"."product_prices" to "authenticated";

grant trigger on table "public"."product_prices" to "authenticated";

grant truncate on table "public"."product_prices" to "authenticated";

grant update on table "public"."product_prices" to "authenticated";

grant delete on table "public"."product_prices" to "service_role";

grant insert on table "public"."product_prices" to "service_role";

grant references on table "public"."product_prices" to "service_role";

grant select on table "public"."product_prices" to "service_role";

grant trigger on table "public"."product_prices" to "service_role";

grant truncate on table "public"."product_prices" to "service_role";

grant update on table "public"."product_prices" to "service_role";

grant delete on table "public"."product_yard" to "anon";

grant insert on table "public"."product_yard" to "anon";

grant references on table "public"."product_yard" to "anon";

grant select on table "public"."product_yard" to "anon";

grant trigger on table "public"."product_yard" to "anon";

grant truncate on table "public"."product_yard" to "anon";

grant update on table "public"."product_yard" to "anon";

grant delete on table "public"."product_yard" to "authenticated";

grant insert on table "public"."product_yard" to "authenticated";

grant references on table "public"."product_yard" to "authenticated";

grant select on table "public"."product_yard" to "authenticated";

grant trigger on table "public"."product_yard" to "authenticated";

grant truncate on table "public"."product_yard" to "authenticated";

grant update on table "public"."product_yard" to "authenticated";

grant delete on table "public"."product_yard" to "service_role";

grant insert on table "public"."product_yard" to "service_role";

grant references on table "public"."product_yard" to "service_role";

grant select on table "public"."product_yard" to "service_role";

grant trigger on table "public"."product_yard" to "service_role";

grant truncate on table "public"."product_yard" to "service_role";

grant update on table "public"."product_yard" to "service_role";

grant delete on table "public"."state" to "anon";

grant insert on table "public"."state" to "anon";

grant references on table "public"."state" to "anon";

grant select on table "public"."state" to "anon";

grant trigger on table "public"."state" to "anon";

grant truncate on table "public"."state" to "anon";

grant update on table "public"."state" to "anon";

grant delete on table "public"."state" to "authenticated";

grant insert on table "public"."state" to "authenticated";

grant references on table "public"."state" to "authenticated";

grant select on table "public"."state" to "authenticated";

grant trigger on table "public"."state" to "authenticated";

grant truncate on table "public"."state" to "authenticated";

grant update on table "public"."state" to "authenticated";

grant delete on table "public"."state" to "service_role";

grant insert on table "public"."state" to "service_role";

grant references on table "public"."state" to "service_role";

grant select on table "public"."state" to "service_role";

grant trigger on table "public"."state" to "service_role";

grant truncate on table "public"."state" to "service_role";

grant update on table "public"."state" to "service_role";

grant delete on table "public"."tax_rate" to "anon";

grant insert on table "public"."tax_rate" to "anon";

grant references on table "public"."tax_rate" to "anon";

grant select on table "public"."tax_rate" to "anon";

grant trigger on table "public"."tax_rate" to "anon";

grant truncate on table "public"."tax_rate" to "anon";

grant update on table "public"."tax_rate" to "anon";

grant delete on table "public"."tax_rate" to "authenticated";

grant insert on table "public"."tax_rate" to "authenticated";

grant references on table "public"."tax_rate" to "authenticated";

grant select on table "public"."tax_rate" to "authenticated";

grant trigger on table "public"."tax_rate" to "authenticated";

grant truncate on table "public"."tax_rate" to "authenticated";

grant update on table "public"."tax_rate" to "authenticated";

grant delete on table "public"."tax_rate" to "service_role";

grant insert on table "public"."tax_rate" to "service_role";

grant references on table "public"."tax_rate" to "service_role";

grant select on table "public"."tax_rate" to "service_role";

grant trigger on table "public"."tax_rate" to "service_role";

grant truncate on table "public"."tax_rate" to "service_role";

grant update on table "public"."tax_rate" to "service_role";

grant delete on table "public"."user_detail" to "anon";

grant insert on table "public"."user_detail" to "anon";

grant references on table "public"."user_detail" to "anon";

grant select on table "public"."user_detail" to "anon";

grant trigger on table "public"."user_detail" to "anon";

grant truncate on table "public"."user_detail" to "anon";

grant update on table "public"."user_detail" to "anon";

grant delete on table "public"."user_detail" to "authenticated";

grant insert on table "public"."user_detail" to "authenticated";

grant references on table "public"."user_detail" to "authenticated";

grant select on table "public"."user_detail" to "authenticated";

grant trigger on table "public"."user_detail" to "authenticated";

grant truncate on table "public"."user_detail" to "authenticated";

grant update on table "public"."user_detail" to "authenticated";

grant delete on table "public"."user_detail" to "service_role";

grant insert on table "public"."user_detail" to "service_role";

grant references on table "public"."user_detail" to "service_role";

grant select on table "public"."user_detail" to "service_role";

grant trigger on table "public"."user_detail" to "service_role";

grant truncate on table "public"."user_detail" to "service_role";

grant update on table "public"."user_detail" to "service_role";

grant delete on table "public"."vendor" to "anon";

grant insert on table "public"."vendor" to "anon";

grant references on table "public"."vendor" to "anon";

grant select on table "public"."vendor" to "anon";

grant trigger on table "public"."vendor" to "anon";

grant truncate on table "public"."vendor" to "anon";

grant update on table "public"."vendor" to "anon";

grant delete on table "public"."vendor" to "authenticated";

grant insert on table "public"."vendor" to "authenticated";

grant references on table "public"."vendor" to "authenticated";

grant select on table "public"."vendor" to "authenticated";

grant trigger on table "public"."vendor" to "authenticated";

grant truncate on table "public"."vendor" to "authenticated";

grant update on table "public"."vendor" to "authenticated";

grant delete on table "public"."vendor" to "service_role";

grant insert on table "public"."vendor" to "service_role";

grant references on table "public"."vendor" to "service_role";

grant select on table "public"."vendor" to "service_role";

grant trigger on table "public"."vendor" to "service_role";

grant truncate on table "public"."vendor" to "service_role";

grant update on table "public"."vendor" to "service_role";

grant delete on table "public"."visitor" to "anon";

grant insert on table "public"."visitor" to "anon";

grant references on table "public"."visitor" to "anon";

grant select on table "public"."visitor" to "anon";

grant trigger on table "public"."visitor" to "anon";

grant truncate on table "public"."visitor" to "anon";

grant update on table "public"."visitor" to "anon";

grant delete on table "public"."visitor" to "authenticated";

grant insert on table "public"."visitor" to "authenticated";

grant references on table "public"."visitor" to "authenticated";

grant select on table "public"."visitor" to "authenticated";

grant trigger on table "public"."visitor" to "authenticated";

grant truncate on table "public"."visitor" to "authenticated";

grant update on table "public"."visitor" to "authenticated";

grant delete on table "public"."visitor" to "service_role";

grant insert on table "public"."visitor" to "service_role";

grant references on table "public"."visitor" to "service_role";

grant select on table "public"."visitor" to "service_role";

grant trigger on table "public"."visitor" to "service_role";

grant truncate on table "public"."visitor" to "service_role";

grant update on table "public"."visitor" to "service_role";

grant delete on table "public"."yard" to "anon";

grant insert on table "public"."yard" to "anon";

grant references on table "public"."yard" to "anon";

grant select on table "public"."yard" to "anon";

grant trigger on table "public"."yard" to "anon";

grant truncate on table "public"."yard" to "anon";

grant update on table "public"."yard" to "anon";

grant delete on table "public"."yard" to "authenticated";

grant insert on table "public"."yard" to "authenticated";

grant references on table "public"."yard" to "authenticated";

grant select on table "public"."yard" to "authenticated";

grant trigger on table "public"."yard" to "authenticated";

grant truncate on table "public"."yard" to "authenticated";

grant update on table "public"."yard" to "authenticated";

grant delete on table "public"."yard" to "service_role";

grant insert on table "public"."yard" to "service_role";

grant references on table "public"."yard" to "service_role";

grant select on table "public"."yard" to "service_role";

grant trigger on table "public"."yard" to "service_role";

grant truncate on table "public"."yard" to "service_role";

grant update on table "public"."yard" to "service_role";


