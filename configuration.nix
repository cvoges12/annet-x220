{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./common/boot.nix
    ./common/environment.nix
    ./common/hardware.nix
    ./common/i18n.nix
    ./common/networking.nix
    ./common/nix.nix
    ./common/nixpkgs.nix
    ./common/powerManagement.nix
    ./common/programs.nix
    ./common/security.nix
    ./common/services.nix
    ./common/system.nix
    ./common/users.nix
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
