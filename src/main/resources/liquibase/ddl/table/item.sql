--liquibase formatted sql

--changeset Debashish:1 labels:item-v1
CREATE TABLE item (product_code VARCHAR NOT NULL, product_name VARCHAR, uda JSON, product_desc VARCHAR, item_id INTEGER, created_by VARCHAR, updated_by VARCHAR, created_ts TIMESTAMP WITHOUT TIME ZONE, updated_ts TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT item_pkey PRIMARY KEY (product_code));

--changeset Debashish:2 labels:item-v1
CREATE SEQUENCE  IF NOT EXISTS item_seq AS bigint START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CACHE 1;

--changeset Debashish:3 labels:item-v2
ALTER TABLE item ADD product_def VARCHAR;

--changeset Debashish:4 labels:item-v3
ALTER TABLE item ADD product_def_another VARCHAR;

