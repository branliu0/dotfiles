### Brandon's dotfiles ###

This is the Git repository for Brandon's dotfiles, which include his configuration files for bash, vim, git, irb, and tmux.

Use the installation script to initialize all of the vim plugins (which are managed by vundle) and to symbolically link files to your home directory. The installation script currently only links bash and vim files to your home directory. Link the other dotfiles as well if you want them!

    $ git clone http://github.com/thenovices/dotfiles ~/dotfiles && bash
~/dotfiles/install.sh
