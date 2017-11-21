{ pkgs ? import <nixpkgs> {} }:

with pkgs.lib;

let
  kubenix = import (builtins.fetchGit {
    url = "https://github.com/xtruder/kubenix.git";
  }) { inherit pkgs; };
in {
  services = import ./services/module-list.nix;

  tests = {
    rabbitmq = kubenix.buildResources {
      configuration = ./test/rabbitmq.nix;
    };
    elasticsearch = kubenix.buildResources {
      configuration = ./test/elasticsearch.nix;
    };
    redis = kubenix.buildResources {
      configuration = ./test/redis.nix;
    };
    galera = kubenix.buildResources {
      configuration = ./test/galera.nix;
    };
  };
}
