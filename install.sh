encryptPart(){
  pv=$1
  fs=$2
  cryptsetup luksFormat $fs
  cryptsetup luksOpen $fs $pv
}

formatDisk(){
  table=$1
  disk=$2
  parted $disk --script mklabel $table
  sgdisk -og $disk
  sgdisk -n 1:0:500M -c 1:"EFI" -t 1:ef00 -g $disk
  sgdisk -n 2:0:0 -c 2:"LVM" -t 2:8301 -g $disk
}

fsSetup(){
  mkfs.vfat -n EFI /dev/sda1
  mkfs.ext4 -L root /dev/vg/root
  mkswap -L swap /dev/vg/swap
  mount /dev/vg/root /mnt
  mkdir /mnt/boot
  mount /dev/sda1 /mnt/boot
  swapon /dev/vg/swap
}

lvmSetup(){
  vg = $1
  pv = $2
  pvcreate $vg
  vgcreate $vg $pv
  lvcreate -n swap vg -L 8G
  lvcreate -n root vg -l 100%FREE
}

mvConfig(){
  hostname = $1
  mkdir /mnt/etc
  mkdir /mnt/etc/nixos
  mv $hostname /mnt/etc/nixos
  rm -rf $hostname
  cd /mnt/etc/nixos
}

### MAIN ###
formatDisk "gpt" "/dev/sda"
encryptPart "enc-pv" "/dev/sda2"
lvmSetup "vg" "/dev/mapper/enc-pv"
fsSetup
mvConfig "ghibli-x220"
