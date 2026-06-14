{ config, lib, tag ? "default", ... }:

let
  cfg = tag; 

  hostBlocks =
    if cfg == "ls_ubuntu" then ''
      Host wsl
        HostName localhost
        User ty_br
        Port 9008  
    ''
    else ''
      
    '';
in
{
  options.hm.ssh-config.enable = lib.mkEnableOption "ssh config";

  config = lib.mkIf config.hm.ssh-config.enable {
    home.file.".ssh/config".text = ''
      Host Vultr
        HostName tybruce.com
        User root
        Port 22
        IdentityFile ~/.ssh/general_id_ed25519
        IdentitiesOnly yes
      
     Host github.com
        HostName github.com
        User git
        Port 22
        #IdentityFile ~/.ssh/apprentice922_rsa
        IdentityFile ~/.ssh/git_general #TyBruceChen
        IdentitiesOnly yes 

     Host ali
        HostName 8.136.11.56
        User ecs-user
        IdentityFile ~/.ssh/cn_rsa
        IdentitiesOnly yes

      ${hostBlocks}
    '';
  };
}
