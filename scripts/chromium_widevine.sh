#!/usr/bin/env sh
#
# copies google chrome CDM to ungoogled-chromium
#
chrome="$(sudo pacman -Qe | grep chrome | cut -d " " -f2 | cut -d "." -f1)"
chromium="$(sudo pacman -Qe | grep ungoogled-chromium | cut -d " " -f2 | cut -d "." -f1)"

case "$chrome" in
    "$chromium") printf "[+] Compatible CDM version\n" ;;
    *) printf "[-] Incompatible CDM version\n"  && exit;;
esac

sudo cp -rf /opt/google/chrome/WidevineCdm /usr/lib/chromium/
printf "[+] Copied.. \n/opt/google/chrome/WidevineCdm => /usr/lib/chromium/\n"