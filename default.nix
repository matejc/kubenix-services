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

    elasticsearch-curator = kubenix.buildResources {
      configuration = ./test/elasticsearch-curator.nix;
    };

    redis = kubenix.buildResources {
      configuration = ./test/redis.nix;
    };

    nginx = kubenix.buildResources {
      configuration = ./test/nginx.nix;
    };
    
    galera = kubenix.buildResources {
      configuration = ./test/galera.nix;
    };
  };
}
