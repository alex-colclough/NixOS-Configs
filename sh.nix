{ config, pkgs, ... }:
let
  myAliases = {
      ll = "lsd -l";
      ".." = "cd ..";
};
in 
{
    programs.zsh = {
        enable = true;
        shellAliases = myAliases;
    };
}
