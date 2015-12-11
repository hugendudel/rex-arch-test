#!/bin/bash
puppet apply --modulepath=/vagrant/modules/ /vagrant/manifests/default.pp
wget -q https://github.com/RexOps/Rex/archive/arch.zip
tmp_md5=$(md5sum arch.zip | awk '{ print $1 }')
tmp_sha512=$(sha512sum arch.zip | awk '{ print $1 }')
sed -ir "s/md5sums=.*/md5sums=(\'$tmp_md5\')/" /home/vagrant/PKGBUILD
sed -ri "s/sha512sums=.*/sha512sums=(\'$tmp_sha512\')/" /home/vagrant/PKGBUILD
su - vagrant -c "makepkg"
pacman --noconfirm -U perl-rex-1.3.3-3-any.pkg.tar.xz 
#rex test_rex
