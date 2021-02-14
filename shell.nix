{ pkgs ? import <nixpkgs> {} }:

let
  env = pkgs.bundlerEnv {
    name = "bwilkins.github.io-bundler-env";
    ruby = pkgs.ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };

in with pkgs; mkShell {
  buildInputs = [
    ruby
    env

    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
