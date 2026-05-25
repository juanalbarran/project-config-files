{pkgs, ...}: {
  name = "typescript";

  nixpkgs.config.allowUnfree = true;

  packages = with pkgs; [
    nodejs_22
    pnpm
    typescript
  ];

  scripts = {
    dev.exec = "pnpm dev";
    build.exec = "pnpm build";
    test.exec = "pnpm test";
    lint.exec = "pnpm lint";
    format.exec = "pnpm format";
    e2e.exec = "pnpm e2e";
  };

  enterShell = ''
    echo "ctwo-ui devenv"
    echo "  node $(node --version) | pnpm $(pnpm --version)"
    pnpm install
  '';
}
