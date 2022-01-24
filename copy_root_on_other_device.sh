# https://losst.ru/perenos-linux-na-drugoj-disk

partition_new=/dev/vg3/lv3

# mount new partition
sudo mount ${partition_new} /mnt

# copy root to new partition
sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*"} / /mnt/

# replace root in /etc/fstab on new partition
sudo blkid ${partition_new}
# sudo vi /mnt/etc/fstab


# mount pseudo partitions
sudo mount --bind /sys /mnt/sys
sudo mount --bind /proc /mnt/proc
sudo mount --bind /dev /mnt/dev

# only for uefi
sudo mount --bind /boot/efi /mnt/boot/efi


# go to new root
sudo chroot /mnt

# ?????????????????
sudo grub-install /boot/efi

#that also possible, but for that nessecary know efi partition name
# sudo grub-install /dev/sda1



# update gub config files
sudo update-grub2


# exit from chroot
exit 

# unmount
sudo umount /mnt/sys
sudo umount /mnt/proc
sudo umount /mnt/dev
sudo umount /mnt/boot/efi
sudo umount /mnt