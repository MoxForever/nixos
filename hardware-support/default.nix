{ ... }:

{
  import = [
    (builtins.optional (builtins.elem "nvidia" (builtins.attrNames (builtins.readDir ./.))) ./nvidia.nix)
  ];
}