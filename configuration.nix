{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./common/import.nix
    ./fileSystems.nix
    ./networking.nix
    ./personal/import.nix
    ./swapDevices.nix
  ];
}
