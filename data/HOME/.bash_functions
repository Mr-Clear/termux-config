# grep the shell history
hgrep(){
    grep -- "$@" "$HOME/.bash_history"
}


# list all packages and their descriptions
packages(){
    while IFS= read -r package; do
        echo "$package — $(apt show "$package" 2>/dev/null | awk '/^Description: / {sub("^Description: ", ""); print}')"
    done < <(apt list 2>/dev/null | awk -F'/' '/\// {print $1}')
}
