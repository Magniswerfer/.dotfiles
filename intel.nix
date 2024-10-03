{ config, pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages = 
    (with pkgs; [
      throttled
    ])

    ++

    (with pkgs-unstable; [
      
    ]);

    # Power management for Intel / Thinkpad
    services.throttled.enable = true;

}