source /etc/profile
export PS1="(chroot) ${PS1}"
export alias ll='ls -lah'


mount /dev/sda1 /boot

emerge-webrsync

emerge --ask --verbose --update --deep --newuse @world
