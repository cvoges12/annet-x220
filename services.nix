{ config, lib, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    fprintd.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "colemak";
      libinput = {
        enable = true;
        tapping = false;
      };
      synaptics.enable = false;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
        default = "i3";
      };
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "0 0 1 * *     root     tmpwatch -maf 240 /tmp"
        "30 3 * * *    root     nix-store --optimize"
      ];
    };
    udev.packages = with pkgs; [
      android-udev-rules
    ];
    nixosManual.showManual = true;
    upower.enable = true;
  };
  nix = {
    gc.automatic = true;
    gc.dates = "3:00";
  };
}
