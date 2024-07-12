{ pkgs }:

pkgs.writeShellScriptBin "dev_make" ''
  echo $1
''

