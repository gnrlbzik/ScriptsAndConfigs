# HomeBrew

## Issues:

### Error: Failed to import:. After running brew doctor.

@dmpeters: Had the same issue today as well. I resolved it by doing the following:

$ brew prune
$ brew cleanup
$ brew update
$ brew tap --repair
$ brew doctor
