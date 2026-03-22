{pkgs, ...}: {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  packages = with pkgs; [
    cargo-watch
  ];

  languages.rust.enable = true;

  # https://devenv.sh/basics/
  enterShell = ''
    Hello Rust
    cargo --version
    rustc --version
  '';

  # See full reference at https://devenv.sh/reference/options/
}
