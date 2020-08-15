--liquibase formatted sql

--changeset Debashish:1
insert into item (product_code, item_id) values('item-code',123456);
--rollback delete from item where product_code='item-code'
