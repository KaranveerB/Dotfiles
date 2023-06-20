#!/bin/bash

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

sync_etc() {
  # 1: file/dir in etc
  sync "/etc" "$1"
}

# etc
sync_etc "fstab"
sync_etc "auto-cpufreq.conf"
sync "/etc/fwupd/" "uefi_capsule.conf"
sync "/etc/zsh/" "zshenv"
sync_etc "pacman.conf"
sync "/etc/pacman.d/" "hooks"
sync "/etc/pacman.d/" "hooks.bin"
sync "/etc/X11/" "xorg.conf.d"
sync "/etc/pam.d/" "system-auth"
sync "/etc/pam.d/" "system-local-login"
sync "/etc/pam.d/" "ly"
sync "/etc/tlp.d" "10-config.conf"
sync_etc "hostname"
sync "/etc/systemd/system" "btrbk-hourly.timer"
sync "/etc/systemd/system" "btrbk.service"
sync_etc "mkinitcpio.d"
sync_etc "btrbk"

# boot
sync "/boot/efi/EFI/refind" "refind.conf"
