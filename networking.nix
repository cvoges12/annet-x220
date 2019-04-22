{ config, lib, pkgs, ... }:

{
  networking = {
    dhcpcd.enable = true;
    dnsExtensionMechanism = true;
    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 22 53 67 68 80 443 53589 ];
      allowedUDPPorts = [ 22 53 67 68 80 433 53589 ];
      allowedUDPPortRanges = [
        { from = 60000;
          to = 61000; }
      ];
    };
    hostName = "annet-x220";
    nameservers = [ "1.1.1.1" ];
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        scanRandMacAddress = true;
      };
    };
    #useDHCP = true;
    usePredictableInterfaceNames = true;
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
