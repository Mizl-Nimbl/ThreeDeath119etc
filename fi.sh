#!/usr/bin/env bash

for arg in "$@"; do
    case $arg in
        --start|-s)
            nix develop
            ;;
        --flakeupdate|-f)
            nix flake update --commit-lock-file
            ;;
        --verifystd|-v)
            nix repl
            ;;
        --configure|-n)
            cmake -B build -S .
            ;;
        --compile|-c)
            cd build
            cmake --build . --verbose
            ;;
        --test|-t)
            cd build
            ctest
            ;;
        --run|-r)
            cd build
            ./death
            ;;
        --yall|-y)
            cd build
            cmake --build .
            ./death
            ;;
    esac
done