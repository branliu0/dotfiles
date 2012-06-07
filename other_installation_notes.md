Here is a document that will list some other interesting utilities that I  want to remember to install on new machines.

# GRC
Colorizes/beautifies the output of a few Unix utilities (like traceroute and ping)

Github: https://github.com/pengwynn/grc

## Installation

    brew install grc

# ls++

Colorized ls on steroids

Github: https://github.com/trapd00r/ls--

## Installation

### GNU/Linux Installation

    cpan Term::ExtendedColor
    git clone git://github.com/trapd00r/ls--.git
    cd ls--
    perl Makefile.PL
    make && su -c 'make install'

    cp ls++.conf $HOME/.ls++.conf

### Mac OS X Installation

    cpan Term::ExtendedColor
    git clone git://github.com/trapd00r/ls--.git
    cd ls--
    perl Makefile.PL
    make && sudo 'make install'

    cp ls++.conf $HOME/.ls++.conf
