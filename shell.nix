{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    ruby
    rubyPackages.jekyll

    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
