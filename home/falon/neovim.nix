{ ... }:
{
	flake.homeModules.home-falon-neovim = { pkgs, config, ... }: {

        home.packages = with pkgs; [
            ripgrep
            fzf
        ];

		programs.neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};  

		xdg.configFile."nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink "/home/falon/dotfiles/dot_config/nvim";
			recursive = true;
		};
	};
}
