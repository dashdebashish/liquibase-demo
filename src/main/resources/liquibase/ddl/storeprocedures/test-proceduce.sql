--liquibase formatted sql

--changeset Debashish:2 runAlways:True
CREATE OR REPLACE FUNCTION TestFunction() 
RETURNS void AS 
'DECLARE
BEGIN
--insert into logging values(''log_seq'', ''My First Message'');
END;'
LANGUAGE plpgsql;

--rollback drop function TestFunction()