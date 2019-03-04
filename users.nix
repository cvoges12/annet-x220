{ config, lib, pkgs, ... }:

{
  users = {
    extraUsers = {
      cvoges12 = {
        description = "Clayton Voges";
        createHome = true;
        home = "/home/cvoges12";
        isNormalUser = true;
        uid = 1000;
        extraGroups = [
          "wheel" "disk" "audio" "video"
          "networkmanager" "systemd-journal"
          "libvirtd"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
      };
    };
    defaultUserShell = pkgs.zsh;
    enforceIdUniqueness = true;
    mutableUsers = true;
  };
}
