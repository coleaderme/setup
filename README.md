# setup

### google docs mini-wiki:
https://docs.google.com/document/d/1n4g8nYFDroHMy6fbYHAyRVx64HswYeQoAvtRxHw_EsM/edit

### Slow download speed?:
`pacman -S reflector rsync`
`reflector --threads 5 --sort rate --country AU,GB --age 6 --fastest 20 --protocol https --ipv4 --save /etc/pacman.d/mirrorlist`

