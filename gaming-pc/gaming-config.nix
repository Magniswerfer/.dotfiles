{ config, pkgs, pkgs-unstable, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  environment.systemPackages = 
    (with pkgs; [

    ])

    ++

    (with pkgs-unstable; [
      steam
    ]);

}