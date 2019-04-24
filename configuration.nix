{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./fileSystems.nix
    ./networking.nix
    ./swapDevices.nix
    (import (builtins.fetchGit https://github.com/cvoges12/annet-common) {})
    (import (builtins.fetchGit https://github.com/cvoges12/annet-personal) {})
  ];
}
