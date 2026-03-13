{
  pkgs,
  inputs,
  ...
}: let
  salesforce-extension = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "salesforcedx-vscode";
    publisher = "salesforce";
    version = "60.4.1";
    sha256 = "sha256-g+GdVForEFQl8NMeBTky5BUykBXbau7UyuhZAGhpdP8=";
  };

  custom-vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      salesforce-extension
      vscjava.vscode-java-pack
    ];
  };
in {
  packages = [
    custom-vscode
    inputs.sfdx-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.jq
  ];

  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_20;
  };

  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk21;
  };

  env.JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";
}
