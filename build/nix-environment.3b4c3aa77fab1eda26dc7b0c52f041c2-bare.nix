{ pkgs ? import (fetchTarball https://github.com/NixOS/nixpkgs/archive/b3783bcfb8ec54e0de26feccfc6cc36b8e202ed5.tar.gz) {}  }: pkgs.mkShell {
buildInputs = [ pkgs.glibcLocales
pkgs.bash
pkgs.cacert
pkgs.coreutils
pkgs.coreutils-full
pkgs.curl
pkgs.entr
pkgs.exa
pkgs.file
pkgs.git
pkgs.gnugrep
pkgs.gnumake
pkgs.gnutar
pkgs.libffi
pkgs.ncurses
pkgs.nix
pkgs.openssh
pkgs.openssl
pkgs.procps
pkgs.python310
pkgs.python310Packages.argcomplete
pkgs.python310Packages.wheel
pkgs.rsync
pkgs.sudo
pkgs.which
];}
