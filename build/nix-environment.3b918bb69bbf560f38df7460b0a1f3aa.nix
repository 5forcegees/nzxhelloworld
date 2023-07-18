{ pkgs ? import (fetchTarball https://github.com/NixOS/nixpkgs/archive/b3783bcfb8ec54e0de26feccfc6cc36b8e202ed5.tar.gz) {}  }: pkgs.mkShell {
shellHook = ''
export PROJECT=nzx_hello_world
export SHELL_TYPE=NIX
export PROVISIONED_PATH=$PATH
export PROVISIONED_PYTHONPATH=$PYTHONPATH
KIT_PATH="/home/vboxuser/code/nzx_hello_world/.deps/bin:$PROVISIONED_PATH" KIT_PYTHONPATH="/home/vboxuser/code/nzx_hello_world/.deps/lib/py:$PROVISIONED_PYTHONPATH"
PATH=$KIT_PATH:$PATH PYTHONPATH=$KIT_PYTHONPATH:$PYTHONPATH
export PATH PYTHONPATH
if [ -e .deps/src/appenv/bin/appenv.bash ] && [ "$USE_APPENV" != "0" ]; then . .deps/src/appenv/bin/appenv.bash; appenv; fi
if [ -e /home/vboxuser/code/nzx_hello_world/.deps/src/build-kit/src/sh/prompt.bash ]; then . /home/vboxuser/code/nzx_hello_world/.deps/src/build-kit/src/sh/prompt.bash; fi
'';
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
