{ config, lib, pkgs, ... }:

{
  services = {
    #actkbd.enable = true;
    #apache-kafka.enable = true;
    #apcupsd.enable = true;
    #arbtt.enable = true;
    printing.enable = true;
    fprintd.enable = true;
    #firefox.syncserver.enable = true;
    #flexget.enable = true;
    #gitea.enable = true;
    #gitlab.enable = true;
    #glusterfs.enable = true;
    #graphana.enable = true;
    #graylog.enable = true;
    #haka.enable = true;
    #haproxy.enable = true;
    #home-assistant.enable = true;
    #hostapd.enable = true;
    #i2pd.enable = true;
    #ipfs.enable = true;
    #opensmtpd.enable = true;
    #pipewire.enable = true;
    #plex.enable = true;
    #prometheus.enable = true;
    #taskserver = {
    #  confirmation = true;
    #  debug = true;
    #  enable = true;
    #  fqdn = config.networking.hostName;
    #  group = "taskd";
    #  ipLog = true;
    #  listenHost = config.networking.hostName;
    #  listenPort = 53589;
    #  organisations = {
    #    VE = {
    #      users = [ "cvoges12" ];
    #    };
    #  };
    #  pki.auto = {
    #    bits = 4096;
    #    expiration = {
    #      ca = 365;
    #      client = 365;
    #      crl = 365;
    #      server = 365;
    #    };
    #  };
    #  queueSize = 10;
    #  requestLimit = 1048576;
    #  trust = "strict";
    #  user = "taskd";
    #};
    #unifi.enable = true;
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
      autorun = true;
      layout = "us";
      xkbVariant = "colemak";
      xkbOptions = "altwin:swap_alt_win,caps:bksp";
      startDbusSession = true;
      terminateOnReset = true;
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
        default = "i3";
      };
      desktopManager.xterm.enable = false;
    };
    udev.packages = with pkgs; [
      android-udev-rules
    ];
    nixosManual.showManual = true;
  };
}
