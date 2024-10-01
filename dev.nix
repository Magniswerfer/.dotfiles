{ config, pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages = 
    (with pkgs; [
      docker
      docker-compose
    ])

    ++

    (with pkgs-unstable; [
      
    ]);

    virtualisation.docker.enable = true;
    users.users.magnushk.extraGroups = [ "docker" ];
}