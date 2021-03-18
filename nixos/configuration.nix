# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/local-configuration.nix
    ];

  # Allow unfree package (e.g. Nvidia drivers)
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.memtest86.enable = true;
  boot.loader.grub.default = "saved";
  boot.supportedFilesystems = [ "ntfs" ];

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour. (They are moved into local-configuration)
  networking.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  fonts.fonts = (with pkgs; [
    source-code-pro
    dejavu_fonts
    liberation_ttf
    nerdfonts
  ]);

  environment.shellAliases = {
    ll = "ls -la";
  };

  environment.variables.XDG_CONFIG_HOME = "$HOME/.config";

  environment.etc."polkit-1/rules.d/00-mount-internal.rules".text = ''
    polkit.addRule(function(action, subject) {
       if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" &&
          subject.local && subject.active && subject.isInGroup("storage")))
          {
             return polkit.Result.YES;
          }
    });
  '';

  environment.etc."polkit-1/rules.d/60-udiskie.rules".text = ''
    polkit.addRule(function(action, subject) {
      var YES = polkit.Result.YES;
      // NOTE: there must be a comma at the end of each line except for the last:
      var permission = {
        // required for udisks1:
        "org.freedesktop.udisks.filesystem-mount": YES,
        "org.freedesktop.udisks.luks-unlock": YES,
        "org.freedesktop.udisks.drive-eject": YES,
        "org.freedesktop.udisks.drive-detach": YES,
        // required for udisks2:
        "org.freedesktop.udisks2.filesystem-mount": YES,
        "org.freedesktop.udisks2.encrypted-unlock": YES,
        "org.freedesktop.udisks2.eject-media": YES,
        "org.freedesktop.udisks2.power-off-drive": YES,
        // required for udisks2 if using udiskie from another seat (e.g. systemd):
        "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
        "org.freedesktop.udisks2.filesystem-unmount-others": YES,
        "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
        "org.freedesktop.udisks2.eject-media-other-seat": YES,
        "org.freedesktop.udisks2.power-off-drive-other-seat": YES
      };
      if (subject.isInGroup("storage")) {
        return permission[action.id];
      }
    });
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty

    wget
    vim
    htop
    git
    binutils
    gnumake
    cmake
    ripgrep
    mc
    fzf
    fzf-zsh
    colordiff
    psmisc
    lsof
    openvpn
    wget
    pciutils
    usbutils
    rofi
    busybox
    protobuf
    go
    go-protobuf
    thunderbolt
    bolt
    usb-modeswitch
    usb-modeswitch-data
    zoom-us
    jq
    gcc
    clang
    clang-tools
    nodejs
    p7zip
    tree
    lm_sensors
    gnupg
    pinentry
    polybarFull

    wireshark

    python27
    python38

    pavucontrol
    kbdd
    arandr
    flameshot

    pcmanfm
    gnome3.nautilus
    gnome3.sushi
    xscreensaver
    feh
    spotify
    mpv
    imagemagick
    evince

    vanilla-dmz
    paper-icon-theme

    krita
    pinta
    font-manager

    brave
    chromium
    firefox
    tdesktop

    blueberry
    xorg.xbacklight
  ];

  environment.homeBinInPath = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };
  programs.nm-applet.enable = true;
  programs.firejail.enable = true;
  programs.steam.enable = true;
  programs.tmux.enable = true;
  programs.wireshark.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.configure = {
    customRC = ''
    source /home/asp437/.config/nvim/init.vim
    '';
  };
  # programs.go.enable = true;

  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.interactiveShellInit = ''
    source ${pkgs.fzf-zsh}/share/zsh/plugins/fzf-zsh/fzf-zsh.plugin.zsh
    export TERM=xterm-256color
  '';
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "amuse";
  programs.zsh.ohMyZsh.plugins = [
    "git"
    "sudo"
  ];

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  programs.system-config-printer.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
	USB_AUTOSUSPEND = 0;
  };

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.bluetooth.enable = true;

  # Emacs (why this is service?!)
  services.emacs.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us,ru";
  services.xserver.xkbOptions = "grp:shifts_toggle,ctrl:swapcaps";

  services.xserver.windowManager.i3.enable = true; # Use i3wm
  services.picom.enable = true; # Since i3wm doesn't include compositor, use picom (ex. compton)
  services.autorandr.enable = true;
  services.xserver.displayManager.sessionCommands = ''
    autorandr --load default --force
  '';
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.iconTheme = {
    name = "Paper";
    package = pkgs.paper-icon-theme;
  };
  services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };

  services.xserver.autoRepeatDelay = 200;
  services.xserver.autoRepeatInterval = 20;

  hardware.opengl.enable = true;
  # OpenGL for 32bit applications
  hardware.opengl.driSupport32Bit = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = false;
  # services.xserver.libinput.naturalScrolling = true;

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.ssh.startAgent = true;
  services.openssh.enable = true;
  services.openvpn.servers = {
    personal = {
      config = "config /etc/openvpn/vpn.conf";
      autoStart = false;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.storage = {
    name = "storage";
  };
  users.groups.network = {
    name = "network";
  };
  users.groups.docker = {
    name = "docker";
  };
  users.users.asp437 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "docker" ];
    shell = pkgs.zsh;
  };

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}

