class common {

    file { "/etc/pacman.conf":
        source  =>  "puppet:///modules/common/pacman.conf",
    }
    ->
    exec { "pacman -Syy":
        path    =>  "/usr/bin"
    }
    ->
    package { ['vim', 'zsh', 'htop', 'wget', 'perl-hash-merge', 'perl-net-ssh2', 'perl-libwww', 'perl-io-string', 'perl-json-xs', 'perl-list-allutils', 'perl-sort-naturally', 'perl-term-readkey', 'perl-text-glob', 'perl-xml-simple', 'perl-yaml', 'perl-net-openssh', 'perl-test-useallmodules', 'perl-io-tty', 'perl-net-sftp-foreign', 'perl-test-pod', 'perl-string-escape', 'perl-test-deep', 'perl-devel-caller', 'perl-padwalker']:
        ensure  =>  installed,
    }

    ssh_authorized_key { 'me_at_root':
        user    =>  'root',
        type    =>  'ssh-rsa',
        key     =>  'PUT_YOUR_KEY_IN_HERE',
    }
        ssh_authorized_key { 'me_at_vagrant':
        user    =>  'vagrant',
        type    =>  'ssh-rsa',
        key     =>  'PUT_YOUR_KEY_IN_HERE',
    }

    file { "/home/vagrant/Rexfile":
        source => "puppet:///modules/common/Rexfile",
    }

    file { "/home/vagrant/PKGBUILD":
        source => "puppet:///modules/common/PKGBUILD",
    }

    host { "arch-01":
        ensure  => 'present',
        ip      => '192.168.56.21',
    }

    host { "arch-02":
        ensure  => 'present',
        ip      => '192.168.56.22',
    }

}
