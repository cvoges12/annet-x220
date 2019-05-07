{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./fileSystems.nix
    ./networking.nix
    ./swapDevices.nix
    (import (builtins.fetchGit {
      url = "https://github.com/cvoges12/annet-common";
      ref = "master";
    }) {})
    (import (builtins.fetchGit {
      url = "https://github.com/cvoges12/annet-personal";
      ref = "master";
      rev = "1abdbe1a6390c264800b46d4c41357c18710f1cf";
    }) {})
  ];
}
