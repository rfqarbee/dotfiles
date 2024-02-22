## Backup Configs

## Installations
Make sure git and stow is installed
```
dnf install git
dnf install stow
```
Make directoy in $HOME ~/.dotfiles
```
mkdir ~/.dotfiles
git clone https://github.com/rfqarbee/dotfiles.git
```

CD ~/.dotfiles and stow
```
CD ~/.dotfiles
stow .
```

## Issues
If somehow when trying to stow has conflicts
```
stow --adopt .
```
