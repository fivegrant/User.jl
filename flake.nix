{
  description = "Create a Julia REPL with REPLBuild.jl";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager...}:
  {
    homeManagerModules.juliarepl = { pkgs, ... }@args: {
        imports = [];
      };
  };

}