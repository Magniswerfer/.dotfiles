{ config, pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages = 
    (with pkgs; [
      docker
      docker-compose
    ])

    ++

    (with pkgs-unstable; [
      zed-editor
    ]);

    virtualisation.docker.enable = true;
    users.users.magnushk.extraGroups = [ "docker" ];
}