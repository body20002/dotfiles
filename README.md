# How To Install

## Using yadm

```bash
yadm clone git@github.com:body20002/dotfiles.git
yadm bootsrap
```

## Using git

```bash
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

# How To Use

## Using yadm

```bash
yadm add folder/file
yadm commit -m "your message"
yadm push
```

## Using git

```bash 
dotfiles add folder/file
dotfiles commit -m "your message"
dotfiles push
```

# Untrack README.md
```bash
dotfiles update-index --assume-unchanged README.md
```

# Screenshots
![](screenshots/screenshot-4.png)
![](screenshots/screenshot-3.png)
![](screenshots/screenshot-0.png)
![](screenshots/screenshot-1.png)
![](screenshots/screenshot-2.png)
![](screenshots/screenshot-5.png)


## TODO
- [x] Add screenshots

fork me daddy
