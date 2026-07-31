{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".p10k.zsh".source = ./assets/p10k.zsh;

  home.packages = with pkgs; [
    bat
    ripgrep
    meslo-lgs-nf
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
  };

  fonts.fontconfig.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # ...
    };

    oh-my-zsh = {
      enable = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
