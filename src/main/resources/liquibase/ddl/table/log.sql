--liquibase formatted sql

--changeset Debashish:1
CREATE TABLE logging (log_id INTEGER NOT NULL, log_desc VARCHAR, created_by VARCHAR, updated_by VARCHAR, created_ts TIMESTAMP WITHOUT TIME ZONE, updated_ts TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT log_pkey PRIMARY KEY (log_id));

--changeset Debashish:2
CREATE SEQUENCE  IF NOT EXISTS log_seq AS bigint START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CACHE 1;

