{ config, lib, pkgs, ... }:

{
  options.hardware.hasNvidiaCard = builtins.any 
    (gpu: builtins.match ".*NVIDIA.*" gpu != null) 
    (lib.splitString "\n" (builtins.readFile "${pkgs.pciutils}/bin/lspci"));

  config = {
    imports = lib.optional config.hardware.hasNvidiaCard ./nvidia.nix;
  };
}