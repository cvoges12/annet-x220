{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./common/import.nix
    ./docs.nix
    ./environment.nix
    ./fonts.nix
    ./fileSystems.nix
    ./hardware.nix
    ./home.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./swapDevices.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    (import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-18.09.tar.gz) {}).nixos
  ];
}
