{ config, pkgs, pkgs-unstable, ... }:

{

  networking.hostName = "t480"; # Define your hostname.

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  environment.systemPackages =
    (with pkgs; [

    ])

    ++

    (with pkgs-unstable; [
      neovim
    ]);

}
