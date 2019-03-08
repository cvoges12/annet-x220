{ config, lib, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      allowBitmaps = true;
      antialias = true;
      hinting.enable = true;
      includeUserConf = true;
      penultimate.enable = true;
      defaultFonts = {
        monospace = ["Fira Mono"];
        sansSerif = ["Fira Sans"];
      };
      ultimate.enable = true;
    };
    fonts = with pkgs; [
      fira-code
      fira-mono
      font-droid
      font-awesome_5
    ];
  };
}