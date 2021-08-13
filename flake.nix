{
  description = ''
    Yices 2 is a solver for Satisfiability Modulo Theories (SMT)
    problems. Yices 2 can process input written in the SMT-LIB
    language, or in Yices' own specification language. We also provide
    a C API and bindings for Java, Python, Go, and OCaml.
  '';

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-21.05";

  outputs = { self, nixpkgs }:
    let

      # Generate a user-friendly version numer.
      version = builtins.substring 0 8 self.lastModifiedDate;

      # System types to support.
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

      yices2 =
        { lib, stdenv, gmp, gperf, autoreconfHook }:
        stdenv.mkDerivation {
          name = "yices2-${version}";

          src = ./.;

          buildInputs = [ gmp gperf ];
          nativeBuildInputs = [ autoreconfHook ];

          meta = with lib; {
            description = "The Yices SMT Solver";
            longDescription = ''
              Yices 2 is a solver for Satisfiability Modulo Theories (SMT)
              problems. Yices 2 can process input written in the SMT-LIB
              language, or in Yices' own specification language. We also provide
              a C API and bindings for Java, Python, Go, and OCaml.
            '';
            homepage    = "https://yices.csl.sri.com/";
            license     = licenses.gpl3Plus;
            platforms   = platforms.all;
          };
        };

    in

    rec {
      overlay = final: prev: {
        yices2 = final.callPackage yices2 {};
      };

      packages = forAllSystems (system:
        {
          inherit (nixpkgsFor.${system}) yices2;
        });

      defaultPackage = forAllSystems (system: self.packages.${system}.yices2);
      devShell = defaultPackage;

      hydraJobs.yices2 = self.defaultPackage;
    };
}
