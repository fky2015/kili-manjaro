#!/usr/bin/env zsh

logging () {
    print "[$funcstack[2]] $*" 1>&3
    print "[$funcstack[2]] $*"
}
