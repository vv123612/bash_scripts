# https://losst.ru/sozdanie-i-nastrojka-lvm-linux
#  https://access.redhat.com/documentation/ru-ru/red_hat_enterprise_linux/5/html/logical_volume_manager_administration/lv

# variables
partion_new=/dev/sda5
vg_new=vg3
lv_new=lv3


#create phisical volume
# -y say yes for question to erase data
sudo pvcreate ${partion_new} -y
 
#create virtual group
sudo vgcreate ${vg_new} ${partion_new}

#create logical volume
#  sudo lvcreate -L 1G -n lv2 vg2

# % of size of volume group
# sudo lvcreate -l 60%VG -n lv2 vg2

# % of size of free space in volume group
sudo lvcreate -l 100%FREE -n ${lv_new} ${vg_new}

#format logical volume
sudo mkfs.ext4 /dev/${vg_new}/${lv_new}