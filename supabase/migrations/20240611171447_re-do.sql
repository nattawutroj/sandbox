create table "public"."cart_product" (
    "id" uuid not null default gen_random_uuid(),
    "cart_id" uuid not null,
    "product_id" uuid not null,
    "tax_rate_id" uuid,
    "quantity" integer not null default 1,
    "deliver_at" date,
    "pick_up_at" date
);


CREATE UNIQUE INDEX cart_product_pkey ON public.cart_product USING btree (id);

alter table "public"."cart_product" add constraint "cart_product_pkey" PRIMARY KEY using index "cart_product_pkey";

alter table "public"."cart_product" add constraint "cart_product_cart_id_fkey" FOREIGN KEY (cart_id) REFERENCES cart(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_cart_id_fkey";

alter table "public"."cart_product" add constraint "cart_product_product_id_fkey" FOREIGN KEY (product_id) REFERENCES product(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_product_id_fkey";

alter table "public"."cart_product" add constraint "cart_product_tax_rate_id_fkey" FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id) not valid;

alter table "public"."cart_product" validate constraint "cart_product_tax_rate_id_fkey";

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


