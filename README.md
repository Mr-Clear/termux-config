# Termux Configuration

Configuration of the Android [Termux](http://termux.com/) application available via [F-Droid](https://f-droid.org/repository/browse/?fdid=com.termux) and [Google Play](https://play.google.com/store/apps/details?id=com.termux).

To get going, copy the following command and paste it into Termux:


```bash
apt update ; \
apt install -y wget ; \
hash -r ; \
wget -qO- https://github.com/alexs77/termux-config/raw/master/scripts/setup.sh | busybox ash -x
```

This is the [start.sh](scripts/start.sh) script.

This will download and run the [setup](scripts/setup.sh) file from the repo.
