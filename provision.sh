#!/bin/bash
puppet apply --modulepath=/vagrant/modules/ /vagrant/manifests/default.pp
wget -q https://github.com/stingA0815/Rex/archive/Rex-ArchLinux-Provider.zip
tmp_md5=$(md5sum Rex-ArchLinux-Provider.zip | awk '{ print $1 }')
tmp_sha512=$(sha512sum Rex-ArchLinux-Provider.zip | awk '{ print $1 }')
sed -ir "s/md5sums=.*/md5sums=(\'$tmp_md5\')/" /home/vagrant/PKGBUILD
sed -ri "s/md5sums=.*/sha512sums=(\'$tmp_sha512\')/" /home/vagrant/PKGBUILD
su - vagrant -c "makepkg"
pacman --noconfirm -U perl-rex-1.3.3-1-any.pkg.tar.xz 
#rex test_rex
