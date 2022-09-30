HOWTO guide for deploying RHEL 8/9 for virtual/real smart card
===============================================================

## Playbooks

- [setup-vm.yaml](./setup-vm.yaml): this playbok is used to general setup of  the KVM based on some specifications.
  There are several places for specification.
  There are default values for some arguments (check defauls in [roles/check-image/defaults/main.yml](roles/check-image/defaults/main.yml)).
  However, those values can be overwritten with hosts file.
  If hosts file is provided and some values are set, those values will be used.  
- [virtual-card.yaml](./virtual-card.yaml): this playbook is used to deploy virtual smart card.
  By deployment of virtual smart card, we mean that all dependecies for them, including SCAutolib, would be installed on the system
  **BUT** the system **would not be configured** to use virtual smart card.
- [virtual-card-ready.yaml](./virtual-card-ready.yaml): this playbook is used to deploy virtual smart card **and** configure the system to use virtual smart card.
  In other words, this playbook extends [virtual-card.yaml](./virtual-card.yaml) by configuration of the system to use virtual smart card using SCAutolib
- [ipa-server.yaml](./ipa-server.yaml): this playbook is used to deploy IPA server.
  This playbook is using publickly available roles for IPA deployment available [GitHub](https://github.com/freeipa/ansible-freeipa).
  That means that this playbook reuquires this Ansible module to be accessible (in any way you prefer, e.g. installing globally to the system)

## Roles

Documentation to individual roles can be found in [roles](./roles) directory.

- [check-image](./roles/check-image/README.md): handles checking of the image and its preparation for deployment
- [common](./roles/common/README.md): handles installation of the KVM
- [ipa-server](./roles/ipa-server/README.md): handles installation of the IPA server
- [real-smart-card](./roles/real-smart-card/README.md): prepare system for using it with a real smart card
- [smart-card-deps](./roles/smart-card-deps/README.md): installs common dependencies for real and virtual smart cards
- [virtual-smart-card](./roles/virtual-smart-card/README.md): handles setup of the system for the virtual smart card
- [sc-regression-testing](./roles/sc-regression-testing/README.md)
- [sc-unit-testing](./roles/sc-unit-testing/README.md)
- [SCAutolib-prepare](./roles/SCAutolib-prepare/README.md)
- [system-check](./roles/system-check/README.md)
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

### real-smart-card

### virtual-smart-card
