# Backup Configs / symlink

Shit i need yeah

### Installations

Make sure git and stow is installed

```
dnf install stow
```

Make directoy in $HOME ~/.dotfiles

```
mkdir ~/.dotfiles
git clone https://github.com/rfqarbee/dotfiles.git $HOME/.dotfiles
```

CD ~/.dotfiles and stow

```
CD ~/.dotfiles
stow .
```

This will symlink all dotfiles to $HOME

### Issues

If somehow when trying to stow has conflicts, either resolve it by manually or just move the conflicted files inside .dotfiles using :

```
stow --adopt .
```
