- Folder structure for best practices


\---src
    +---main
    |   +---java
    |   \---resources
    |       |   liquibase.properties
    |       |
    |       \---liquibase
    |           |   db.changelog-master.xml
    |           |
    |           +---ddl
    |           |   +---storeprocedures
    |           |   |       test-proceduce.sql
    |           |   |
    |           |   \---table
    |           |           catalog.sql
    |           |           item.sql
    |           |           log.sql
    |           |
    |           \---dml
    |                   insert.catalog.sql
    |                   insert.item.sql
    
    
	
- Master YAML is calling all the SQL files

  <include  file="src/main/resources/liquibase/ddl/table/catalog.sql"/>   
  <include  file="src/main/resources/liquibase/ddl/table/item.sql"/>
  <include  file="src/main/resources/liquibase/ddl/storeprocedures/test-proceduce.sql"/> 
  <include  file="src/main/resources/liquibase/dml/insert.catalog.sql"/>
  <include  file="src/main/resources/liquibase/dml/insert.item.sql"/>
  
- SQL file attributes for changeset

    "--liquibase formatted sql" 
    "--changeset Debashish:1"
	--rollback 
  (a) --liquibase formatted sql should be 1st line of the SQL to notify liquibase that type of the changeset file is SQL (Not XML/Json)
  (b) "--changeset Debashish:1594898257424-1" - Format is <<Author>>:<<Changeset Id>>. This cobination should be uniquie inside a file
  (c) When a rollaabck can not be auto generated by the liquibase --rollback  followed by SQL needs to be added. This will be used during rollback operation
  (d) runAlways:True to be added along with the Change Set Id (--changeset Debashish:1594898257424-1 runAlways:True), 
      to execute the sql everytime when there is a change
	  
- MVN Plugin for liquibase in pom.xml


	<dependency>
		<groupId>org.liquibase</groupId>
		<artifactId>liquibase-core</artifactId>
		<version>4.0.0</version>
	</dependency>
	
<build>
	<plugins>
		<plugin>  
			<groupId>org.liquibase</groupId>  
			<artifactId>liquibase-maven-plugin</artifactId>  
			<configuration>                    
			  <propertyFile>src/main/resources/liquibase.properties</propertyFile>  
			</configuration>
		</plugin>
	</plugins>
</build>
		
- How to Trigger the Deployment

#To Delete All the Objects 
mvn liquibase:dropAll
#To Install 
mvn liquibase:update
#$$ is not recognised in liquibase so to be $$ to be replaced with'
mvn liquibase:rollback -Dliquibase.rollbackCount=1
mvn liquibase:rollback -Dliquibase.rollbackDate= 2020-07-20

#Find the Mavel Goals
mvn help:describe -DgroupId=org.liquibase -DartifactId=liquibase-maven-plugin -Dversion=2.0.1 -Dfull=true
mvn liquibase:help
