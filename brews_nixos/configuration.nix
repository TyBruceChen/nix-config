{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Disable GPU?
  # boot.blacklistedKernelModules = [ "nouveau" ]; 
  #
  networking.hostName = "brews-nixos"; # Define your hostname.
 
   # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
	}; 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brews = {
    isNormalUser = true;
    description = "Brews";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	openssh
	curl
	git
  ];

  system.stateVersion = "25.11"; # Did you read the comment?

  ## customized config
  nix.settings.experimental-features = ["nix-command" "flakes"]; 
    home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
	inherit inputs;
	username = "brews";
	tag = "brews"; #for ssh-config	
	};
    users = {
      "brews" = import ./home.nix;
    };
  };

  users.users.brews = {
	openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAybMbbEzlZXgbc27CjcqN2ZpC0Ir/BPm5frPI9Gf3WB ty_bruce.chen@outlook.com"
        ];
  };

  programs.zsh.enable = true;	#control nixos login shell, different than programs.zsh.enable in hm
	
	# system program/env setup
	nixos-env.username = "brews";
	nixos-env.frp.enable = true;
	environment.variables = {
	NH_FLAKE = "/home/brews/Documents/nix-config";	
  };
}
