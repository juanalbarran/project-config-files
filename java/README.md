# Java and Spring Boot Configuration files

Here are files needed to make easier to start working with a java/spring boot project

## Database

### Database Credentials

There is an application.yaml file with some defaults

### Persistent Data

For the local database files `devenv` stores them in a local `.devenv` directory.
To wipe the database and start fresh just run

```bash
rm -rf .devenv/state/postgres
```

### Automatic Migrations

Using Liquibase or Flyway can be eun perfectly when `mvn spring-boot:run` is executed

## POM

### Liquibase

To work with `liquibase` add this to the `pom.xml`

```xml
<dependency>
    <groupId>org.liquibase</groupId>
    <artifactId>liquibase-core</artifactId>
</dependency>
```

Also to work with `liquibase` the `yaml` file `db.changelog-master.yaml` goes in `src/main/resources/db/changelog/db.changelog-master.yaml`
All the changes should be in `src/main/resources/db/changelog/changes/`
It is recommended to that the name of the change file is the same as the id of the change, just so it is easier to identify where is the change when we look at the database changelog, also the number of the change as the date 20260415 (2026-04-15)

### PostgreSQL

To work with `postgresql` add this to the `pom.xml`

```xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
```
