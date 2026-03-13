{
  pkgs,
  inputs,
  ...
}: {
  packages = [
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

  # Export JAVA_HOME for the Neovim Apex Language Server
  env.JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";
}
