# SPDX-FileCopyrightText: 2020 Aluísio Augusto Silva Gonçalves <https://aasg.name>
#
# SPDX-License-Identifier: MIT

{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.simpleFlake rec {
    inherit self nixpkgs;
    name = "chirpingmustard.com";
    overlay = final: prev: {
      ${name} = {
        defaultPackage = (final.mkYarnPackage rec {
          pname = "chirpingmustard.com";
          version = (builtins.fromJSON (builtins.readFile "${src}/package.json")).version;
          src = self;

          buildPhase = ''
            runHook preBuild

            yarn run metalsmith

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall

            mv deps/chirpingmustard.com/output $out

            runHook postInstall
          '';
        }).overrideAttrs (_: { doDist = false; });

        devShell = final.mkShell {
          buildInputs = [ final.nodejs final.yarn ];
        };
      };
    };
  };
}
