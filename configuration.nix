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
      rev = "d18def567fb7c1f3ae97c66fb79f22b6c5f52938";
    }) {})
  ];
}
