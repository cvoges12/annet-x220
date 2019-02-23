{ config, lib, pkgs, ... }:

{
  # $ nix-env -qaP | grep
  environment.systemPackages = with pkgs; [
  
    # Applications
    ## Audio
    #cava
    #mopidy
    #mopidy-gmusic
    #mopidy-soundcloud
    #mopidy-spotify
    #ncmpcpp

    ## Editors
    (import ./vim.nix)

    ## Graphics
    feh

    ## Misc
    dmenu
    khal
    khard
    #mpvc
    #ranger
    zathura
    
    ## Networking
    ### Browsers
    firefox
    #w3m

    ### Feedreaders
    #newsboat

    ### IDS
    #snort

    ### Instant-Messengers
    #profanity
    #quaternion
    #riot-web
    #signal-desktop
    #tdesktop
    #telegram-cli
    
    ### IRC
    #weechat

    ### Mailreaders
    #mailsync  # maybe checkout too?
    #neomutt
    #notmuch # maybe check out `notmuch-mutt`
    
    ### Sniffers
    #wireshark

    ## Version-Management
    ### Git-and-Tools
    git

    ## Video
    #mpv

    ## Window-Manager
    i3-gaps
    i3blocks-gaps
    i3lock
    i3status

    # Build-Support
    ## CC-Wrapper
    #clang
    #gcc

    ## Trivial-Builder
    idris
    #libreoffice
    texlive.combined.scheme-full
    #vimPlugins.pluginnames2nix  # use this in the future

    # Development
    ## Compilers
    ghc
    #llvm
    openjdk

    ## Haskell-Modules
    ### Hackage-Packages
    haskellPackages.Chart
    #haskellPackages.djinn
    haskellPackages.ghcid
    haskellPackages.hnix
    haskellPackages.pandoc
    #haskellPackages.purescript
    haskellPackages.stack

    ## Interpreters
    #python37Full

    ## Libraries
    gnutls
    libnotify

    ## Tools
    ### Misc
    dialog

    ## Web
    #nodejs

    # Misc
    ## Emulators
    wine

    # OS-Specific
    ## Linux
    iotop
    powertop
    psmisc
    #linuxPackages.wireguard

    # Servers
    #clamsmtp
    #mpd
    #quagga

    # Shells
    zsh

    # Tools
    ## Archivers
    unrar
    unzip
    zip

    ## Bluetooth
    #blueman
    #bluez

    ## Graphics
    pywal
    scrot    # OR escrotum OR maim OR yaxg

    ## Misc
    neofetch
    #screen
    tmpwatch
    tmux
    vdirsyncer # for khal and khard
    #youtube-dl

    ## Networking
    #aircrack-ng
    #offlineimap
    #traceroute
    #wget
    #whois

    ## Package-Management
    home-manager
    
    ## Security
    #clamav
    gnupg
    #john
    kpcli
    #metasploit
    #nmap
    #thc-hydra

    ## System
    htop
    tree

    # Top-level
    ## Python-packages
    python36Packages.glances

    # ../libs
    ## attrsets
    perl528Packages.WWWYoutubeViewer
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };
}
