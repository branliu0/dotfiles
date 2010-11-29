# -*- bash -*-

# ssh to server by name
fssh () {
    FORMAT=$1
    NUMBER=$2
    shift 2
    HOST=$(printf $FORMAT "$NUMBER")
    sudo ssh $HOST $@
}

alias chan="fssh channel%03g.sf2p"
alias pres="fssh presence%03g.sf2p"
alias chlog="fssh chatlog%03g.sf2p"
alias aim="fssh appproxy%03g.sf2p"
alias jab="fssh jabber%03g.sf2p"

mkcd () {
    mkdir -p "$1" && cd "$1"
}

rs () {
    HASH=`git svn find-rev r$1`
    git show -w $HASH
}
