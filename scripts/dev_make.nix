{ pkgs }:

pkgs.writeShellScriptBin "dev" ''
  # Check if at least one argument is provided
  if [ $# -lt 1 ]; then
    echo """Usage: dev ENV [NEW_PROJECT_DIRECTORY] 
        
Help:
       Uses dev templates to setup a project quickly
       See full list of templates here: https://github.com/the-nix-way/dev-templates
        """
    exit 1
  fi

  # Check if the second argument is provided
  if [ $# -eq 2 ]; then
    mkdir $2
    cd $2
    nix flake init --template github:the-nix-way/dev-templates#$1
    direnv allow
  else
    # Run the command with one input
    nix flake init --template github:the-nix-way/dev-templates#$1
    direnv allow
  fi
''

