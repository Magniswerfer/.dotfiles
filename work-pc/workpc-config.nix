{ config, pkgs, pkgs-unstable, ... }:

{

  networking.hostName = "magnus-creativeoak"; # Define your hostname.

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  environment.systemPackages =
    (with pkgs; [
        thunderbird
        chromium
        get-google-fonts
        davinci-resolve
        darktable
    ])

    ++

    (with pkgs-unstable; [
      neovim
      figma-linux
    ]);

}
