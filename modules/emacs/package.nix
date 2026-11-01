{ inputs, ... }:
{
  perSystem =
    {
      pkgs,
      ...
    }:
    let
      pkgs' = pkgs.extend inputs.nix-doom-emacs-unstraightened.overlays.default;

      emacs = pkgs'.doomEmacs {
        doomDir = ./config;
        doomLocalDir = "~/.local/share/nix-doom";
        extraBinPackages = with pkgs'; [
          graphviz
          ripgrep
          nil
          tree-sitter
        ];
      };
    in
    {
      checks.emacs = emacs;
      packages.default = emacs;
      packages.emacs = emacs;
    };
}
