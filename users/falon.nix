{ ... }:
{
    flake.nixosModules.user-falon = { pkgs, ... }:
    {
        users.users.falon = {
            isNormalUser = true;
            description = "Falon Clark";
            extraGroups = [ "wheel" "networkmanager" ];
            shell = pkgs.zsh;
            password = "password";
        };

        programs.zsh.enable = true;
        security.sudo.wheelNeedsPassword = false;
    };
}
