{ pkgs ? import (fetchTarball https://github.com/NixOS/nixpkgs/archive/eac7da7b519a5aefe92c33c90b4450a24ebe0ab3.tar.gz) {}  }: pkgs.mkShell {
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
pkgs.awscli2
pkgs.aws-lambda-rie
pkgs.bash
pkgs.cacert
pkgs.coreutils
pkgs.coreutils-full
pkgs.curl
pkgs.entr
pkgs.esbuild
pkgs.exa
pkgs.file
pkgs.git
pkgs.gnugrep
pkgs.gnumake
pkgs.gnutar
pkgs.libffi
pkgs.libstdcxx5
pkgs.ncurses
pkgs.nix
pkgs.nodejs
pkgs.nodePackages.eslint
pkgs.nodePackages.prettier
pkgs.openssh
pkgs.openssl
pkgs.procps
pkgs.pulumi-bin
pkgs.python39
pkgs.python39Packages.aiohttp
pkgs.python39Packages.argcomplete
pkgs.python39Packages.awslambdaric
pkgs.python39Packages.boto3
pkgs.python39Packages.certifi
pkgs.python39Packages.chardet
pkgs.python39Packages.elasticsearch
pkgs.python39Packages.grpcio
pkgs.python39Packages.idna
pkgs.python39Packages.pip
pkgs.python39Packages.pytz
pkgs.python39Packages.s3transfer
pkgs.python39Packages.simplejson
pkgs.python39Packages.urllib3
pkgs.python39Packages.wheel
pkgs.rsync
pkgs.sudo
pkgs.terraform-providers.aws
pkgs.which
pkgs.yarn
pkgs.zip
];}
