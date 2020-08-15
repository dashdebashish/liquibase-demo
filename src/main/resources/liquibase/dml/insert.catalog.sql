--liquibase formatted sql

--changeset Debashish:1
insert into catalog (catalog_code, catalog_id) values('cat-code',123456);
--rollback delete from catalog where catalog_code='cat-code'