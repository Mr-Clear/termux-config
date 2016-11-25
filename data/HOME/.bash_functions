# grep the shell history
hgrep(){
    grep -- "$@" "$HOME/.bash_history"
}


# list all packages and their descriptions
packages(){
    apt list --verbose 2>/dev/null | awk '
        ! (NR == 1 && /^Listing...$/) && ! /^(  |$)/ {
            sub("/.*", "")
            n = $0
            getline
            sub("^  ", "")
            d = $0
            print n, "—", d
        }'
}
