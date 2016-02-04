Rex Arch Test
===========

quick & dirty vagrant test env for rex archlinux test

vagrant:vagrant
root:vagrant

ToDo
--------
 * edit IPs in servers.yaml
 * edit IPs in modules/common/manifests/init.pp
 * ensure provision.sh is executable


Usage
-----

Assuming that you already have vagrant and virtualbox

    $ git clone https://github.com/stinA0815/rex-arch-test.git
    $ cd rex-arch-test/
    $ vagrant up
    $ ssh vagrant@$IP
    $ cd /cagrant
    $ rex [test_rex|.*]
