{
  description = "Death to the C++ Programmer";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs@{ flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    perSystem = { config, self', inputs', pkgs, system, ... }: {
      devShells.default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
        packages = with pkgs; [
          cmake
          glm
          sdl3
          imgui
          stb
          tinyobjloader
          vk-bootstrap
          vulkan-memory-allocator
          vulkan-headers
          vulkan-loader
          vulkan-validation-layers
          fmt
          xorg.libX11
          xorg.libXrandr
          xorg.libXinerama
          xorg.libxkbfile
          xorg.libXcursor
          xorg.libXi
          xorg.libX11
        ];
        shellHook = ''
          export CMAKE_PREFIX_PATH=${pkgs.vulkan-memory-allocator}/lib/cmake:$CMAKE_PREFIX_PATH
        '';
      };
    };
  };
}