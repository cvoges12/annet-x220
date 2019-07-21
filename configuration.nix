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
      rev = "31bb03e95cfef501cc307f114c2a32846810002b";}) {})
    (import (builtins.fetchGit {
      url = "https://gitlab.com/cvoges12/annet-personal";
      ref = "master";
      rev = "c88879df2bac57adc94f506ed7b798f4278f7cd8";}) {})
  ];
}
