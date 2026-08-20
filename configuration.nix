{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = "otnielaguilar";
  users.users.otnielaguilar = {
    home = "/Users/otnielaguilar";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2; # fast key repeat
      InitialKeyRepeat = 15; # short delay before repeat
      _HIHideMenuBar = true; # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;

    finder.FXPreferredViewStyle = "Nlsv"; # list view by default
    finder.CreateDesktop = false; # clean desktop
    trackpad.Clicking = true; # tap to click
  };

  nix-homebrew = {
    enable = true;
    user = "otnielaguilar";
    autoMigrate = true; # adopt the existing /opt/homebrew install
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];

    taps = [
      "homebrew/services"
      "supabase/tap"
    ];

    brews = [
      "autoconf"
      "automake"
      "azure-cli"
      "ca-certificates"
      "cmake"
      "coreutils"
      "docker"
      "docker-completion"
      "docker-compose"
      "easy-rsa"
      "expat"
      "fzf"
      "herdr"
      "gettext"
      "gh"
      "gmp"
      "icu4c@78"
      "jq"
      "krb5"
      "libevent"
      "libgpg-error"
      "libidn2"
      "libksba"
      "liblinear"
      "libpq"
      "libsodium"
      "libssh2"
      "libtermkey"
      "libtool"
      "libunistring"
      "libuv"
      "libvterm"
      "libyaml"
      "lua"
      "luajit"
      "luv"
      "lz4"
      "lzo"
      "m4"
      "mpdecimal"
      "msgpack"
      "ncurses"
      "neovim"
      "ninja"
      "nmap"
      "oniguruma"
      "openssl@1.1"
      "openssl@3"
      "openvpn"
      "pcre2"
      "pkcs11-helper"
      "pkgconf"
      "python@3.14"
      "readline"
      "redis"
      "ripgrep"
      "sqlite"
      "supabase"
      "tmux"
      "tree"
      "tree-sitter"
      "unibilium"
      "utf8proc"
      "wget"
      "xz"
      "zlib"
      "zstd"
    ];

    casks = [
      "wezterm"
      "gcloud-cli"
      "opensuperwhisper"
      "claude-code"
    ];
  };
}
