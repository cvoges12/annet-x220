{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./common/import.nix
    ./environment.nix
    ./fileSystems.nix
    ./home.nix
    ./i18n.nix
    ./networking.nix
    ./personal/import.nix
    ./services.nix
    ./swapDevices.nix
    ./users.nix
    (import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-18.09.tar.gz) {}).nixos
  ];
}
