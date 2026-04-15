# java/devenv.nix
{pkgs, ...}: let
  application_name = "application_name";
  database_name = "database_name";
  database_username = "database_username";
  database_password = "database_password";
in {
  # https://devenv.sh/basics/
  env.GREET = "Java & Spring Boot Development";
  env.application_name = application_name;
  env.database_name = database_name;
  env.database_username = database_username;
  env.database_password = database_password;

  packages = with pkgs; [
    maven
    spring-boot-cli
    pgcli
    liquibase
  ];

  # Enable Java (Temurin 21 is the current standard for modern Spring Boot)
  languages.java = {
    enable = true;
    jdk.package = pkgs.temurin-bin-21;
  };

  # Local PostgreSQL 18 configuration
  services.postgres = {
    enable = true;
    package = pkgs.postgresql_18;
    initialDatabases = [{name = database_name;}];
    listen_addresses = "127.0.0.1";
    # Optional: If you want to use a specific port to avoid conflicts
    port = 5432;
  };

  enterShell = ''
    echo "--- $GREET ---"
    java -version
    mvn -version
    echo "------------------------------------------------"
    echo "DB: postgresql://localhost:5432/$database_name"
    echo "------------------------------------------------"
  '';
}
