# How To Install

```bash
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

# How To Use
```bash 
dotfiles add folder/file
dotfiles commit -m "your message"
dotfiles push -u origin main
```

# Untrack README.md
```bash
dotfiles update-index --assume-unchanged README.md
```

## TODO
- [ ] Add screenshots

fork me daddy
