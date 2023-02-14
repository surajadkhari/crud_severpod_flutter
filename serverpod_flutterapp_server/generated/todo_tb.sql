--
-- Class TodoModel as table todo_tb
--

CREATE TABLE "todo_tb" (
  "id" serial,
  "title" text NOT NULL,
  "description" text NOT NULL,
  "isCompleted" boolean NOT NULL
);

ALTER TABLE ONLY "todo_tb"
  ADD CONSTRAINT todo_tb_pkey PRIMARY KEY (id);




