source /etc/profile
export PS1="(chroot) ${PS1}"
alias ll='ls -lah'


mount /dev/sda1 /boot

emerge-webrsync

emerge --ask --verbose --update --deep --newuse @world

echo "Europe/Moscow" > /etc/timezone
emerge --config sys-libs/timezone-data

nano -w /etc/locale.gen
# en_US ISO-8859-1
# en_US.UTF-8 UTF-8
# ru_RU.UTF-8 UTF-8

locale-gen
eselect locale list
eselect locale set 6
# en_US.utf8

env-update && source /etc/profile && export PS1="(chroot) ${PS1}"


# Genkernel

# add to file
# /etc/portage/package.license/linux-firmware
# sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE

mkdir /etc/portage/package.license
emerge --ask sys-kernel/genkernel
genkernel --mountboot --install all