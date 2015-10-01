#!/bin/bash
puppet apply --modulepath=/vagrant/modules/ /vagrant/manifests/default.pp
su - vagrant -c "makepkg"
pacman --noconfirm -U perl-rex-1.3.3-1-any.pkg.tar.xz 
#rex test_rex
