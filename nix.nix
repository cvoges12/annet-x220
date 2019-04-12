{ config, lib, pkgs, ... }:

{
  nix = {
    maxJobs = lib.mkDefault 4; # change to number of total cores; lscpu
    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
      "/nix/var/nix/profiles/per-user/root/channels/nixos-hardware/lenovo/thinkpad/x220"
      ((builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz) + "/nixos")
    ];
  };
}
