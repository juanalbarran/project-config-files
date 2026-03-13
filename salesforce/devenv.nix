# devenv.nix
{
  pkgs,
  inputs,
  ...
}: {
  # Core packages required for your Salesforce workflow
  packages = [
    # Salesforce CLI pulled directly from your flake input
    inputs.sfdx-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.jq
  ];

  # Devenv language modules handle environment setup for you
  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_20;
  };

  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk17;
  };

  # Explicitly export JAVA_HOME.
  # This is highly recommended because Neovim's Apex Language Server
  # (which is built on top of Eclipse JDTLS) requires it to function properly.
  env.JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
}
