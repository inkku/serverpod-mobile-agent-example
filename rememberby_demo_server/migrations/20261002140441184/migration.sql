BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "remembered_item" (
    "id" bigserial PRIMARY KEY,
    "ownerId" text NOT NULL,
    "text" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "remembered_item_owner_idx" ON "remembered_item" USING btree ("ownerId");


--
-- MIGRATION VERSION FOR rememberby_demo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('rememberby_demo', '20261002140441184', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261002140441184', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260910193913364-string-rate-limit-keys', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260910193913364-string-rate-limit-keys', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260824182354731', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182354731', "timestamp" = now();


COMMIT;
