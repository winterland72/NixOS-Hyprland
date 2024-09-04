{
  description = "KooL's NixOS-Hyprland"; 
  	
  inputs = {
  	nixpkgs.url = "nixpkgs/nixos-unstable";
	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # hyprland development
	distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes"; 
  	};

  outputs = 
	inputs@{ self,nixpkgs, ... }:
    	let
      	system = "x86_64-linux";
      	host = "NixOS-Hyprland";
		username = "ja";

      	pkgs = import nixpkgs {
        	inherit system;
        	config = {
          	allowUnfree = true;
        	};
      	};
    in
    {
	nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem rec {
		specialArgs = { 
			inherit system;
			inherit inputs;
			inherit username;
			inherit host;
			};
	   		modules = [ ./${host}/config.nix ];
			};
		};
	};
}
