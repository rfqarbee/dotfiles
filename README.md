# Backup Configs / symlink

---
### Installations

Install `git` and `stow` using respective repository

Arch
```
pacman -S stow
```

Fedora
```
dnf install -y stow
```

---
Clone in `$HOME ~/dotfiles`

```
git clone https://github.com/rfqarbee/dotfiles.git $HOME/dotfiles
```

---
Navigate to `dotfiles` and `stow`

* All Dirs
`stow .`

* Specific Dirs
`stow $DIR`


