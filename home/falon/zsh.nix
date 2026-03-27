{ ... }:
{
    flake.homeModules.home-falon-zsh = { config, pkgs, ... }: {
        home.packages = with pkgs; [
            eza
            fzf
            zoxide
        ];

        programs.fzf = {
            enable = true;
            enableZshIntegration = true;
        };

        programs.zsh = {
            enable = true;
            shellAliases = {
                ll = "eza -al --icons";
                ls = "eza";
                cd = "z";
            };

            enableCompletion = true;
            syntaxHighlighting.enable = true;

            autosuggestion = {
                enable = true;
                strategy = [
                    "history"
                    "completion"
                ];
            };

            history = {
                size = 5000;
                path = "${config.xdg.cacheHome}/zsh_history";
            };

            initExtra = ''
                eval "$(zoxide init zsh)"

                bindkey '^F' autosuggest-accept
            '';
        };

        programs.starship = {
            enable = true;
            enableZshIntegration = true;
            settings = {
                format = "$username@$hostname in $directory$fill$cmd_duration$git_commit\n$character";

                scan_timeout = 50;

                fill.symbol = " ";

                username = {
                    show_always = true;
                    format = "[$user](yellow)";
                };

                hostname = {
                    ssh_only = false;
                    format = "[$hostname](yellow)";
                };

                character = {
                    success_symbol = "[](green) ";
                    error_symbol = "[](red) ";
                };
            };
        };
    };
}
