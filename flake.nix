{
    description = "My first flake, basically just my configuration.nix for now lol";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ...}:

        let
            system = "x86_64-linux";
            lib  = nixpkgs.lib;
            pkgs = nixpkgs.legacyPackages.${system};
            pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

        in {
            nixosConfigurations = {
                t480 = lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./configuration.nix
                        ./dev.nix
                        ./t480/t480-config.nix
                        ./intel.nix
                    ];
                    specialArgs = {
                        inherit pkgs-unstable;
                    };
                };
                gaming-pc = lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./configuration.nix
                    ];
                    specialArgs = {
                        inherit pkgs-unstable;
                    };
                };
                work-pc = lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./configuration.nix
                        ./dev.nix
                        ./work-pc/workpc-config.nix
                    ];
                    specialArgs = {
                        inherit pkgs-unstable;
                    };
                };
            };

            homeConfigurations = {
                magnushk = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [ ./home.nix];
                };
            };
        };
}
