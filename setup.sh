#!/data/data/com.termux/files/usr/bin/bash

{

set -eo pipefail

masterzip_url='https://github.com/brbsix/termux-config/archive/master.zip'
masterzip_file="$HOME/tmp/termux-config-master.zip"
masterzip_dir="$HOME/tmp/termux-config"
master_dir="$masterzip_dir/termux-config-master"
package_file="$master_dir/data/packages.list"

echo 'Setting up Termux'
echo

mkdir -p "$HOME/tmp" "$HOME/bin"

echo 'updating installation...'
apt update &>/dev/null
apt full-upgrade -y &>/dev/null
echo

echo 'setting up prerequisites...'
apt install -y wget &>/dev/null
hash -r
rm -rf "$masterzip_file"
wget -O "$masterzip_file" "$masterzip_url" &>/dev/null
rm -rf "$masterzip_dir"
mkdir -p "$masterzip_dir"
unzip -d "$masterzip_dir" "$masterzip_file" &>/dev/null
echo

echo 'copying files...'
cp -rp "$master_dir/data/HOME/." "$HOME"
echo

if [[ $1 != --no-packages ]]; then
    echo 'installing packages...'
    awk '{print $1}' "$package_file" | xargs -r -- apt install -y
    echo
fi

echo 'cleaning up...'
rm -rf "$HOME/.wget-hsts" "$HOME/tmp"
echo

echo 'Done.'

}
