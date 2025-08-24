#!/bin/bash

# TODO: This can be improved in many ways to make syncing entire directories much better
# honestly, I don't know why I did it the way I did.

sync() {
  # 1: directory, 2: target name (dir or file)
  if [ -e "$1/$2" ]; then
    mkdir -p ".$1"
    if cp -r "$1/$2" ".$1"; then
      echo "$1/$2 successfully synchronized."
    else
      echo "Error: Failed to copy $1/$2."
    fi
  else
    echo "Error: File $1/$2 does not exist." 
  fi
}

su_sync() {
  # 1: directory, 2: target name (dir or file)
  if sudo [ -e "$1/$2" ]; then
    mkdir -p ".$1"
    if sudo cp -r "$1/$2" ".$1"; then
      sudo chown "lost:users" ".$1/$2"
      echo "$1/$2 successfully synchronized."
    else
      echo "Error: Failed to copy $1/$2."
    fi
  else
    echo "Error: File $1/$2 does not exist." 
  fi
}

sync_etc() {
  # 1: file/dir in etc
  sync "/etc" "$1"
}

del_file() {
  echo "not syncing $1"
  rm ".$1"
}

# boot
su_sync "/boot/efi/EFI/refind" "refind.conf"

# etc
sync_etc "fstab"
sync_etc "auto-cpufreq.conf"
sync_etc "pacman.conf"
sync_etc "modprobe.d"
sync "/etc" "mkinitcpio.conf"
sync "/etc/zsh" "zshenv"
sync_etc "pacman.conf"
sync "/etc/pacman.d" "hooks"
sync "/etc/pacman.d" "hooks.bin"
sync "/etc/X11" "xorg.conf.d"
sync "/etc/pam.d" "system-auth"
sync "/etc/pam.d" "system-local-login"
sync "/etc/pam.d" "ly"
sync "/etc/keyd" "default.conf"
sync_etc "tlp.d"
del_file "/etc/tlp.d/README"
del_file "/etc/tlp.d/00-template.conf"
sync_etc "hostname"
sync "/etc/systemd/system" "btrbk-hourly.timer"
sync "/etc/systemd/system" "btrbk.service"
sync "/etc/systemd/system" "btrbk.service"
sync "/etc/systemd/system" "touchpad-smp-affinity.service"
sync "/etc/systemd/system" "fw-fanctrl.service"
sync "/etc/systemd/system" "tlpnoboost.service"
sync "/etc/systemd/user" "atr2100x-easyeffects.service"
sync_etc "mkinitcpio.d"
sync_etc "btrbk"
sync "/etc/systemd" "logind.conf.d"
sync "/etc/systemd" "sleep.conf.d"
sync "/etc/udev/rules.d" "99-lowbat.rules"
sync "/etc/udev/rules.d" "99-atr2100x-easyeffects.rules"
sync "/etc/udev/rules.d" "99-backlight.rules"

# pacman
pacman -Qqen > "extras/native-pkg.list" # includes chaotic-aur
pacman -Qqem > "extras/foreign-pkg.list"

# systemd
systemctl list-unit-files --type=service --state=enabled --no-legend | awk '{print $1}' > "extras/systemd-enabled.list"
systemctl list-unit-files --type=service --state=disabled --no-legend | awk '{print $1}' > "extras/systemd-disabled.list"
