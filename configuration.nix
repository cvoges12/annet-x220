{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./fileSystems.nix
    ./networking.nix
    ./swapDevices.nix
    (import (builtins.fetchGit {
      url = "https://gitlab.com/cvoges12/annet-common";
      ref = "master";
    }) {})
    (import (builtins.fetchGit {
      url = "https://gitlab.com/cvoges12/annet-personal";
      ref = "master";
      rev = "41dd4224cc9023d7fbc3eeeb1604712edd1bfc36";
    }) {})
  ];
}
