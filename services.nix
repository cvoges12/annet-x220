{ config, lib, pkgs, ... }:

{
  services = {
    #actkbd.enable = true;
    #apache-kafka.enable = true;
    #apcupsd.enable = true;
    #arbtt.enable = true;
    openssh.enable = true;
    printing.enable = true;
    fprintd.enable = true;
    #firefox.syncserver.enable = true;
    #flexget.enable = true;
    redshift = {
      enable = true;
      latitude = "38.6";
      longitude = "90.5";
      temperature = {
        day = 3500;
        night = 5500;
      };
      brightness = {
        day = "1";
        night = "1";
      };
    };
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
          extraPackages = haskellPackages: [
            haskellPackages.xmonad-contrib
            haskellPackages.xmonad-extras
            haskellPackages.xmonad
            haskellPackages.monad-logger
          ];
        };
        default = "i3";
      };
      desktopManager.xterm.enable = false;
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "0 0 1 * *     root     tmpwatch -maf 240 /tmp"
      ];
    };
    udev.packages = with pkgs; [
      android-udev-rules
    ];
    nixosManual.showManual = true;
    upower.enable = true;
  };
  nix = {
    checkConfig = true;
    gc = {
      automatic = true;
      dates = "3:00";
    };
    optimise = {
      automatic = true;
      dates = [ "3:30" ];
    };
    readOnlyStore = true;
    requireSignedBinaryCaches = true;
    useSandbox = true;
  };
}
