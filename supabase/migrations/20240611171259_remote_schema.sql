revoke delete on table "public"."cart_product" from "anon";

revoke insert on table "public"."cart_product" from "anon";

revoke references on table "public"."cart_product" from "anon";

revoke select on table "public"."cart_product" from "anon";

revoke trigger on table "public"."cart_product" from "anon";

revoke truncate on table "public"."cart_product" from "anon";

revoke update on table "public"."cart_product" from "anon";

revoke delete on table "public"."cart_product" from "authenticated";

revoke insert on table "public"."cart_product" from "authenticated";

revoke references on table "public"."cart_product" from "authenticated";

revoke select on table "public"."cart_product" from "authenticated";

revoke trigger on table "public"."cart_product" from "authenticated";

revoke truncate on table "public"."cart_product" from "authenticated";

revoke update on table "public"."cart_product" from "authenticated";

revoke delete on table "public"."cart_product" from "service_role";

revoke insert on table "public"."cart_product" from "service_role";

revoke references on table "public"."cart_product" from "service_role";

revoke select on table "public"."cart_product" from "service_role";

revoke trigger on table "public"."cart_product" from "service_role";

revoke truncate on table "public"."cart_product" from "service_role";

revoke update on table "public"."cart_product" from "service_role";

alter table "public"."cart_product" drop constraint "cart_product_cart_id_fkey";

alter table "public"."cart_product" drop constraint "cart_product_product_id_fkey";

alter table "public"."cart_product" drop constraint "cart_product_tax_rate_id_fkey";

alter table "public"."cart_product" drop constraint "cart_product_pkey";

drop index if exists "public"."cart_product_pkey";

drop table "public"."cart_product";


