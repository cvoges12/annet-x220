{ config, lib, pkgs, ... }:

{
  networking = {
    dhcpcd.enable = true;
    dnsExtensionMechanism = true;
    hostName = "annet-x220";
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        scanRandMacAddress = true;
      };
    };
    #useDHCP = true;
    #wireguard.interfaces.wg0 = {
    #  allowIPsAsRoutes = true;
    #  ips = [ "" ];
    #  listenPort = null;
    #  peers = [
    #    { allowedIPs = [ "" ];
    #      endpoint = "";
    #      publicKey = "";}
    #  ];
    #  privateKeyFile = "";
    #};
  };
}
