HOWTO guide for deploying RHEL 8/9 for virtual/real smart card
===============================================================

## Roles
Following roles are included:
- [common](#common): handles installation of the KVM including
- smart-card-deps: installs common dependencies for real and virtual smart cards
- [virtual-smart-card](#virtual-smart-card): handles setup of the system for the virtual smart card
- [real-smart-card](#real-smart-card): prepare system for using it with a real smart card

### common
This role requires that QCOW2 image is already downloaded and expects that your
user (that executes the play) would enough permission to manipulate with `virsh`
command.

If no options are provided (via `-e "option1=... option2=..."`), role would use
default values located in [roles/common/defaults/main.yaml](./roles/common/defaults/main.yml).
Images directory is _$HOME/os_dir/_. Role would copy `base_img` to destination
`img_path` and the image would have name `<img_name>.qcow2`.By default, base
image hase name _rhel-<rhel_version>_ (e.g _rhel-9.0_) and located in image
directory. No file extension is expected for base image because the name can be
symlink to the real image. You can overwrite these options in option string 
(`-e "base_img=... "`).

## real-smart-card

## virtual-smart-card
