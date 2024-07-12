{ pkgs }:

pkgs.writeShellScriptBin "dev" ''
  # Check if at least one argument is provided
  if [ $# -lt 1 ]; then
    echo "Usage: $0 ENV [NEW_PROJECT_DIRECTORY]"
    exit 1
  fi

  # Assign the first argument to ENV
  ENV=$1

  # Check if the second argument is provided
  if [ $# -eq 2 ]; then
    NEW_PROJECT_DIRECTORY=$2
    # Run the command with two inputs
    nix flake init --template github:the-nix-way/dev-templates#${ENV} ${NEW_PROJECT_DIRECTORY}
  else
    # Run the command with one input
    nix flake init --template github:the-nix-way/dev-templates#${ENV}
  fi
''

