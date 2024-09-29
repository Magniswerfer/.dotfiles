{
    description = "My first flake, basically just my configuration.nix for now lol";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, home-manager, ...}: 
    
        let 
            system = "x86_64-linux";
            lib  = nixpkgs.lib;
            pkgs = nixpkgs.legacyPackages.${system};
        
        in {
            nixosConfigurations = {
                t480 = lib.nixosSystem {
                    inherit system;
                    modules = [ ./configuration.nix ./t480/t480-config.nix ];

                };
                gaming-pc = lib.nixosSystem {
                    inherit system;
                    modules = [ ./configuration.nix ];
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