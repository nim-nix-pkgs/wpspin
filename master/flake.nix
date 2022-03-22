{
  description = ''Full-featured WPS PIN generator'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-wpspin-master.flake = false;
  inputs.src-wpspin-master.owner = "drygdryg";
  inputs.src-wpspin-master.ref   = "master";
  inputs.src-wpspin-master.repo  = "wpspin-nim";
  inputs.src-wpspin-master.type  = "github";
  
  inputs."argparse".owner = "nim-nix-pkgs";
  inputs."argparse".ref   = "master";
  inputs."argparse".repo  = "argparse";
  inputs."argparse".dir   = "v3_0_0";
  inputs."argparse".type  = "github";
  inputs."argparse".inputs.nixpkgs.follows = "nixpkgs";
  inputs."argparse".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-wpspin-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-wpspin-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}