{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = "otnielaguilar";
  home.homeDirectory = "/Users/otnielaguilar";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # cli i use constantly
    ripgrep    # fast search
    fd         # fast find
    fzf        # fuzzy finder
    jq         # json on the command line
    lazygit
    neovim
    tree-sitter # CLI nvim-treesitter shells out to for `tree-sitter build`
    # the font everything renders in
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true; # ghost text from history
    syntaxHighlighting.enable = true; # commands turn green when valid
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    initContent = ''
      bindkey '^f' autosuggest-accept

      # Herd injected PHP binary.
      export PATH="/Users/otnielaguilar/Library/Application Support/Herd/bin/":$PATH

      # Herd injected PHP 8.2 configuration.
      export HERD_PHP_82_INI_SCAN_DIR="/Users/otnielaguilar/Library/Application Support/Herd/config/php/82/"

      # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
      export PATH="$PATH:$HOME/.rvm/bin"

      eval "$(/opt/homebrew/bin/brew shellenv)"

      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
              . "/opt/miniconda3/etc/profile.d/conda.sh"
          else
              export PATH="/opt/miniconda3/bin:$PATH"
          fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<

      export PATH="/opt/miniconda3/bin:$PATH"
      [[ -e "/opt/miniconda3/etc/profile.d/conda.sh" ]] && source "/opt/miniconda3/etc/profile.d/conda.sh"

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      export PATH="$(brew --prefix libpq)/bin:$PATH"
    '';
    shellAliases = {
      ".." = "cd ..";
      ga = "git add";
      gs = "git status";
      gd = "git diff";
      cc = "claude --dangerously-skip-permissions";
      co = "codex --full-auto";
      vim = "nvim";
      eZ = "nvim ${dotfiles}/home.nix";
      dcs = "dotnet csharpier";
      c = "claude";
    };
  };

  programs.git.settings.user = {
    name = "Otniel Aguilar";
    email = "otnieel.aguilar@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[➜](purple)";
        error_symbol = "[➜](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  # Edit-in-place: the real file stays in my repo, ~/.config just points at it.
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/wezterm";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/herdr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";
  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.claude/settings.json";
  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".codex/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".config/opencode/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
}
