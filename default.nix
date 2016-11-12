let
  pkgs = import <nixpkgs> {};
  reflexPkgs = import ./reflex-platform { };

  ghc-env = reflexPkgs.ghc.ghcWithPackages (p: with p; [
      # for use with the intero emacs package
      intero

      # We want the ghc packages to be a superset of the ghcjs
      # packages, so that intero can provide typechecking, etc. using
      # ghc (it can't be done with ghcjs because of the dependency on
      # the ghci/intero repl)
      reflex-dom
    ]);
  ghcjs-env = reflexPkgs.ghcjs.ghcWithPackages (p: with p; [
      reflex-dom
    ]);
in pkgs.buildEnv {
  name = "ghc-and-ghcjs-env";
  paths = [
      ghc-env
      ghcjs-env
      pkgs.haskellPackages.cabal-install
      pkgs.haskellPackages.stack
      pkgs.nodejs
    ];
}
