--
-- Class User as table users
--

CREATE TABLE "users" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "adress" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


