
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."BodyCopy" (
    "id" bigint NOT NULL,
    "site_id" bigint,
    "text" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."BodyCopy" OWNER TO "postgres";

ALTER TABLE "public"."BodyCopy" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."BodyCopy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."Headline" (
    "id" bigint NOT NULL,
    "site_id" bigint,
    "text" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."Headline" OWNER TO "postgres";

ALTER TABLE "public"."Headline" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."Headline_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."Site" (
    "id" bigint NOT NULL,
    "created_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "site_name" "text" DEFAULT 'New Site'::"text" NOT NULL
);

ALTER TABLE "public"."Site" OWNER TO "postgres";

ALTER TABLE "public"."Site" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."Site_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."URL" (
    "id" bigint NOT NULL,
    "site_id" bigint,
    "text" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."URL" OWNER TO "postgres";

ALTER TABLE "public"."URL" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."URL_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY "public"."BodyCopy"
    ADD CONSTRAINT "BodyCopy_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."Headline"
    ADD CONSTRAINT "Headline_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."Site"
    ADD CONSTRAINT "Site_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."URL"
    ADD CONSTRAINT "URL_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."BodyCopy"
    ADD CONSTRAINT "public_BodyCopy_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."Site"("id");

ALTER TABLE ONLY "public"."Headline"
    ADD CONSTRAINT "public_Headline_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."Site"("id");

ALTER TABLE ONLY "public"."URL"
    ADD CONSTRAINT "public_URL_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."Site"("id");

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON TABLE "public"."BodyCopy" TO "anon";
GRANT ALL ON TABLE "public"."BodyCopy" TO "authenticated";
GRANT ALL ON TABLE "public"."BodyCopy" TO "service_role";

GRANT ALL ON SEQUENCE "public"."BodyCopy_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."BodyCopy_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."BodyCopy_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."Headline" TO "anon";
GRANT ALL ON TABLE "public"."Headline" TO "authenticated";
GRANT ALL ON TABLE "public"."Headline" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Headline_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Headline_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Headline_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."Site" TO "anon";
GRANT ALL ON TABLE "public"."Site" TO "authenticated";
GRANT ALL ON TABLE "public"."Site" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Site_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Site_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Site_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."URL" TO "anon";
GRANT ALL ON TABLE "public"."URL" TO "authenticated";
GRANT ALL ON TABLE "public"."URL" TO "service_role";

GRANT ALL ON SEQUENCE "public"."URL_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."URL_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."URL_id_seq" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
