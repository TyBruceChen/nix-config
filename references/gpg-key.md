### check gpg key ([CES] key ID):

`gpg --list-secret-keys --keyid-format=long`

### export gpg key in ASCII-armor:

```
gpg --armor --export sign_key_id > public-key.asc
gpg --armor --export-secret-subkeys sign_key_id > secret-subkey.asc
```

### import gpg key from local file:

```
gpg --import public-key.asc
gpg --import secret-subkey.asc
```


### check related app configuration

- gpg key id config in `homeManagerModules/git.nix`

### Debug

- `gpg: error building skey array: No pinentry`: 
1. check if  pinentry is installed
2. restart gpg agent:
```
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent 
```
