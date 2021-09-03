{
  description = "Selenium python bot.";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
        let
          pname = "abbot";
          version = "0.5";
          pkgs = nixpkgs.legacyPackages.${system};

          python = pkgs.python38;
          pythonPkgs = python.pkgs;

          propagatedBuildInputs = [
              # Web drivers
              pkgs.chromedriver

              # Python dependencies
              pythonPkgs.setuptools
              pythonPkgs.certifi
              pythonPkgs.dnspython
              pythonPkgs.idna
              pythonPkgs.requests
              pythonPkgs.requests-toolbelt
              pythonPkgs.urllib3
            ];

          app = pythonPkgs.buildPythonApplication {
            inherit pname version;
            inherit propagatedBuildInputs;
            src = ./.;
          };

          # This Shell env is helpful for just playing around with new approaches.
          # It contains a new shell that has all the dependencies you'd expect. 
          # Feel free to have fun and experiment!
          # 
          # Run `nix develop` from this directory to enter the shell.
          shellEnv = pkgs.mkShell {
            # shellHook = ''
            #   # Patch Visual Studio Code's `packages.json` so that nix's *python* is used as default value for `python.pythonPath`.
            #   if [ -e "./.vscode/settings.json" ]; then
            #     substituteInPlace ./.vscode/settings.json \
            #       --replace \"python.defaultInterpreterPath\"  \"${python}/bin/python\"
            #   fi
            #   printf "\nSet VSCode's python to: ${python}/bin/python \n"
            # '';

            buildInputs = [
              pkgs.bash
              pkgs.bashInteractive
              pkgs.locale
              pkgs.xtermcontrol
              pkgs.xterm
              pkgs.zsh
            ];

            propagatedBuildInputs = propagatedBuildInputs ++
            [
              # A fun, easy-to-use python REPL for easy debugging and trying 
              # new ideas :)
              pythonPkgs.bpython
            ];
          };

          

        in {            
            packages.${pname} = app;

            packages.${system}.docker = pkgs.dockerTools.buildImage {
              name = "${pname}";
              tag = "latest";

              # Setting 'created' to 'now' will correctly set the file's creation date
              # (instead of setting it to Unix epoch + 1). This is impure, but fine for our purposes.
              created = "now";
              config = {
                Cmd = [ ];
                # Runs 'abbot' by default.
                Entrypoint = [ "${app.outPath}/bin/${app.pname}" ];
              };
            };

            defaultApp = app;

            defaultPackage = self.packages.${system}.${pname};

            devShell = shellEnv;
        }
    );
}
