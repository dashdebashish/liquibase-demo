--liquibase formatted sql

--changeset Debashish:1
CREATE TABLE catalog (catalog_code VARCHAR NOT NULL, catlog_name VARCHAR, catalog_id INTEGER, created_by VARCHAR, updated_by VARCHAR, created_ts TIMESTAMP WITHOUT TIME ZONE, updated_ts TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT catalog_pkey PRIMARY KEY (catalog_code));

--changeset Debashish:2
CREATE SEQUENCE  IF NOT EXISTS catalog_seq AS bigint START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CACHE 1;

--changeset Debashish:3
ALTER TABLE catalog ADD catalog_desc VARCHAR;


