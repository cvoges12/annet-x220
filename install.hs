{-
-- done
encryptPart(){
  pv=$1
  fs=$2
  cryptsetup luksFormat $fs
  cryptsetup luksOpen $fs $pv
}

-- done
formatDisk(){
  table=$1
  disk=$2
  parted $disk --script mklabel $table
  sgdisk -og $disk
  sgdisk -n 1:0:500M -c 1:"EFI" -t 1:ef00 -g $disk
  sgdisk -n 2:0:0 -c 2:"LVM" -t 2:8301 -g $disk
}

-- done
fsSetup(){
  mkfs.vfat -n EFI /dev/sda1
  mkfs.ext4 -L root /dev/vg/root
  mkswap -L swap /dev/vg/swap
  mount /dev/vg/root /mnt
  mkdir /mnt/boot
  mount /dev/sda1 /mnt/boot
  swapon /dev/vg/swap
}

-- done
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
mvConfig "annet-x220"
-}

{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
             TemplateHaskell, OverloadedStrings #-}

import Shelly
import Prelude hiding (FilePath)
import Data.Text.Lazy (Text)
default (Int, Text)

diskFormat_ table disk = shelly $ do
    run_ "parted" [disk, "--script", "mklabel", table]
    run_ "sgdisk" ["-og", disk]
    run_ "sgdisk" ["-n", "1:0:500M", "-c", "1:\"EFI\"", "-t", "1:ef00", "-g", disk]
    run_ "sgdisk" ["-n", "2:0:0", "-c", "2:\"LVM\"", "-t", "2:8301", "-g", disk]
    
partEncrypt_ physVol fileSys = shelly $ do
    run_ "cryptsetup" ["luksFormat", fileSys]
    run_ "cryptsetup" ["luksOpen", fileSys, physVol]

lvm_ physVol volGroup = shelly $ do
    run_ "pvcreate" [volGroup]
    run_ "vgcreate" [volGroup, physVol]
    run_ "lvcreate" ["-n", "swap", volGroup, "-L", "8G"]
    run_ "lvcreate" ["-n", "root", volGroup, "-l", "100%FREE"]

fileSystems disk = shelly $ do
    run_ "mkfs.vfat" ["-n", "EFI", (disk ++ '1')]
    run_ "mkfs.ext4" ["-L", "root", "/dev/vg/root"]
    run_ "mkswap" ["-L", "swap", "/dev/vg/swap"]
    run_ "mount" ["/dev/vg/root", "/mnt"]
    run_ "mkdir" ["/mnt/boot"]
    run_ "mount" [(disk ++ '1'), "/mnt/boot"]
    run_ "swapon" ["/dev/vg/swap"]

main = shelly $ verbosely $ do
    putStrLn $ "Input the disk you would like to install to: "
    disk <- getLine
    diskFormat_ "gpt" disk
    putStrLn $ "Input the name of the physical volume you would like: "
    physVol <- getLine
    putStrLn $ "Input the name of the volume group you would like: "
    volGroup <- getLine
    partEncrypt_ physVol (disk ++ '2')
    lvm_ physVol volGroup
    fileSystems disk
